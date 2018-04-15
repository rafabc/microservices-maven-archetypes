package ${package};

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.cloud.client.discovery.EnableDiscoveryClient;
import org.springframework.cloud.sleuth.metric.SpanMetricReporter;
import org.springframework.cloud.sleuth.zipkin.ZipkinProperties;
import org.springframework.context.annotation.ComponentScan;

import com.netflix.discovery.EurekaClient;

import springfox.documentation.swagger2.annotations.EnableSwagger2;



@SpringBootApplication
@ComponentScan
@EnableAutoConfiguration
@EnableSwagger2
@EnableDiscoveryClient
public class SwaggerCatalogApp {
	
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
		
		SpringApplication.run(SwaggerCatalogApp.class, args);
	}
	
	
//	@Bean
//	public ZipkinSpanReporter makeZipkinSpanReporter() {
//	    return new ZipkinSpanReporter() {
//	        private HttpZipkinSpanReporter delegate;
//	        private String baseUrl;
//	 
//	        @Override
//	        public void report(Span span) {
//	  
//	            InstanceInfo instance = eurekaClient.getNextServerFromEureka("zipkin", false);
//	            baseUrl = instance.getHomePageUrl();
//	            delegate = new HttpZipkinSpanReporter(baseUrl, zipkinProperties.getFlushInterval(), zipkinProperties.getCompression().isEnabled(), spanMetricReporter);
//	  
//	            if (!span.name.matches(skipPattern)) delegate.report(span);
//	        }
//	    };
//	}

}
