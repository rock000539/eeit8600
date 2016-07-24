package tw.com.queautiful.commons.enums;

import com.fasterxml.jackson.annotation.JsonProperty;

public enum CategoryTitle {

	@JsonProperty(value="MakeUp")
	MAKEUP, 
	
	@JsonProperty(value="Skin Care")
	SKINCARE, 
	
	@JsonProperty(value="Bath&Body")
	BATHBODY, 
	
	@JsonProperty(value="Hair")
	HAIR;

}
