package ${package}.dto;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import io.swagger.annotations.ApiModelProperty;

#macro( ccase $str )
#foreach( $word in $str.split('-') )$word.substring(0,1).toUpperCase()$word.substring(1)#end
#end
#set( $name = "#ccase( $artifactId )" )


@Data
@NoArgsConstructor
@AllArgsConstructor
public class ${name} {

	@ApiModelProperty(notes = "field1")
	private String field1;
	@ApiModelProperty(notes = "field2")
	private String field2;
	@ApiModelProperty(notes = "field3")
	private String field3;

}
