package ${package}.provider;


import ${package}.config.SwaggerServicesConfig;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.cloud.client.ServiceInstance;
import org.springframework.cloud.client.discovery.DiscoveryClient;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Component;

import lombok.NoArgsConstructor;
import springfox.documentation.swagger.web.SwaggerResource;
import springfox.documentation.swagger.web.SwaggerResourcesProvider;



@Component
@Primary
@NoArgsConstructor
@EnableAutoConfiguration
public class CatalogSwaggerProvider implements SwaggerResourcesProvider {
	
	@Autowired
	private DiscoveryClient discoveryClient;
	
    @Autowired
    private SwaggerServicesConfig swaggerServiceList;

   // private final Logger log = LoggerFactory.getLogger(CatalogSwaggerProvider.class);
    
    
	@Override
    public List<SwaggerResource> get() {
		
		List<SwaggerResource> resources = new ArrayList<>();
		List<String> listServices = discoveryClient.getServices();
		for(String service : listServices ){
			List<ServiceInstance> list = discoveryClient.getInstances(service);
			System.out.println("test");
			ServiceInstance instance = list.get(0);
			String url = "http://localhost:" + instance.getPort() + "/api/v2/api-docs";//?group=" + instance.getServiceId();
			resources.add(swaggerResource(instance.getServiceId(),url, "1.0"));
			
		}

        return resources;
    }

    private SwaggerResource swaggerResource(String name, String location, String version) {
        SwaggerResource swaggerResource = new SwaggerResource();
        swaggerResource.setName(name);
        swaggerResource.setLocation(location);
        swaggerResource.setSwaggerVersion(version);
        return swaggerResource;	
    }
    

}