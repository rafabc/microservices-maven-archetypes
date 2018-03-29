package ${package}.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


#macro( ccase $str )
#foreach( $word in $str.split('-') )$word.substring(0,1).toUpperCase()$word.substring(1)#end
#end
#set( $name = "#ccase( $artifactId )" )


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ${name} {


	private String field1;
	private String field2;
	private String field3;

}
