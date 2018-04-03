package ${package};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.circuitbreaker.EnableCircuitBreaker;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.eureka.EnableEurekaClient;
import org.springframework.cloud.netflix.hystrix.EnableHystrix;
import org.springframework.cloud.sleuth.metric.SpanMetricReporter;
import org.springframework.cloud.sleuth.zipkin.HttpZipkinSpanReporter;
import org.springframework.cloud.sleuth.zipkin.ZipkinProperties;
import org.springframework.cloud.sleuth.zipkin.ZipkinSpanReporter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import com.netflix.appinfo.InstanceInfo;
import com.netflix.discovery.EurekaClient;

import zipkin.Span;

#macro( ccase $str )
#foreach( $word in $str.split('-') )$word.substring(0,1).toUpperCase()$word.substring(1)#end
#end
#set( $name = "#ccase( $artifactId )" )


@SpringBootApplication
@EnableWebMvc
@EnableEurekaClient
@Configuration
@ComponentScan
@EnableHystrix
@EnableCircuitBreaker
@RefreshScope
public class ${name}App {
	
	@Autowired
	private EurekaClient eurekaClient;
	  
	@Autowired
	private SpanMetricReporter spanMetricReporter;
	  
	@Autowired
	private ZipkinProperties zipkinProperties;
	  
	@Value("${spring.sleuth.web.skipPattern}")
	private String skipPattern;
	

	public static void main(String[] args) {
		
		System.setProperty("com.sun.xml.ws.transport.http.client.HttpTransportPipe.dump", "true");
		System.setProperty("com.sun.xml.internal.ws.transport.http.client.HttpTransportPipe.dump", "true");
		System.setProperty("com.sun.xml.ws.transport.http.HttpAdapter.dump", "true");
		System.setProperty("com.sun.xml.internal.ws.transport.http.HttpAdapter.dump", "true");
		
		SpringApplication.run(${name}App.class, args);
	}
	
	
	@Bean
	public ZipkinSpanReporter makeZipkinSpanReporter() {
	    return new ZipkinSpanReporter() {
	        private HttpZipkinSpanReporter delegate;
	        private String baseUrl;
	 
	        @Override
	        public void report(Span span) {
	  
	            InstanceInfo instance = eurekaClient.getNextServerFromEureka("zipkin", false);
	            if (!(baseUrl != null && instance.getHomePageUrl().equals(baseUrl))) {
	                baseUrl = instance.getHomePageUrl();
	                delegate = new HttpZipkinSpanReporter(baseUrl, zipkinProperties.getFlushInterval(), zipkinProperties.getCompression().isEnabled(), spanMetricReporter);
	  
	                if (!span.name.matches(skipPattern)) delegate.report(span);
	            }
	        }
	    };
	}

}
