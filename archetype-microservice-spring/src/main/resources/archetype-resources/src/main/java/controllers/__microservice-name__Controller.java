package ${package}.controllers;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import ${package}.dto.${name}Dto;


#macro( ccase $str )
#foreach( $word in $str.split('-') )$word.substring(0,1).toUpperCase()$word.substring(1)#end
#end
#set( $name = "#ccase( $microservice-name )" )


@RestController
@RequestMapping("/${microservice-mapping}")
@Api(value="${microservice-mapping}", description="${microservice-mapping} repository")
public class ${name}Controller {


	@ApiOperation(value = "get ${microservice-mapping}")
	@RequestMapping(value = "/id/{id}", method = RequestMethod.GET, produces = "application/json")
	public ${name}Dto getExample(@PathVariable("id") String id) {
		
		${name}Dto dtoExample = new ${name}Dto();
		return dtoExample;
	}

}
