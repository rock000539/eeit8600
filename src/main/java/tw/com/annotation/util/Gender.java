package tw.com.annotation.util;

import com.fasterxml.jackson.annotation.JsonProperty;

public enum Gender {
	
	@JsonProperty(value="男性")
	MALE("男性"),
	@JsonProperty(value="女性")
	FEMALE("女性");

    private String value;

    private Gender(String value) {
        this.value = value;
    }
    
	@Override
    public String toString() {
        return this.value;
    }
	
}
