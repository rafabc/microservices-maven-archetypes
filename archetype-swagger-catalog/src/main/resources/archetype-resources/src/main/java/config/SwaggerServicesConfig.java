package ${package}.config;

import java.util.List;

import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.stereotype.Component;
import lombok.Data;

@Data
@Component
@EnableAutoConfiguration
@EnableConfigurationProperties
@ConfigurationProperties(prefix="documentation.swagger")
public class SwaggerServicesConfig {

    List<SwaggerServices> swaggers;

    @Data
    @EnableConfigurationProperties
    @ConfigurationProperties(prefix="documentation.swagger.services")
    public static class SwaggerServices{
       
    	private String name;
        private String url;
        private String version;

    }   

}