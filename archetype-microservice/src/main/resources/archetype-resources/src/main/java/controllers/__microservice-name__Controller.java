package ${package}.controllers;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;


#macro( ccase $str )
#foreach( $word in $str.split('-') )$word.substring(0,1).toUpperCase()$word.substring(1)#end
#end
#set( $name = "#ccase( $artifactId )" )


@RestController
public class ${name}Controller {




}
