package ${package};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.context.config.annotation.RefreshScope;
import org.springframework.cloud.netflix.zuul.EnableZuulProxy;
import org.springframework.cloud.sleuth.metric.SpanMetricReporter;
import org.springframework.cloud.sleuth.zipkin.HttpZipkinSpanReporter;
import org.springframework.cloud.sleuth.zipkin.ZipkinProperties;
import org.springframework.cloud.sleuth.zipkin.ZipkinSpanReporter;
import org.springframework.context.annotation.Bean;

import com.netflix.appinfo.InstanceInfo;
import com.netflix.discovery.EurekaClient;

import zipkin.Span;


@SpringBootApplication
@EnableZuulProxy
@RefreshScope  //This annotation allow to zuul to detect changes in zuul.yml (from config server) and auto refresh the spring scope with this changes
public class ZuulApp {

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
		
		SpringApplication.run(ZuulApp.class, args);
	}
	
	
	@Bean
	public ZipkinSpanReporter makeZipkinSpanReporter() {
	    return new ZipkinSpanReporter() {
	        private HttpZipkinSpanReporter delegate;
	        private String baseUrl;
	 
	        @Override
	        public void report(Span span) {
	  
	            InstanceInfo instance = eurekaClient.getNextServerFromEureka("zipkin", false);
	            //if (!(baseUrl != null && instance.getHomePageUrl().equals(baseUrl))) {
	                baseUrl = instance.getHomePageUrl();
	                delegate = new HttpZipkinSpanReporter(baseUrl, zipkinProperties.getFlushInterval(), zipkinProperties.getCompression().isEnabled(), spanMetricReporter);
	  
	                if (!span.name.matches(skipPattern)) 
	                	delegate.report(span);
	            //}
	        }
	    };
	}

}
