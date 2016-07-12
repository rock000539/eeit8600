package tw.com.queautiful.commons.util;

import com.fasterxml.jackson.annotation.JsonProperty;

public enum ArticleType {

	@JsonProperty(value="news")
	NEWS,
	
	@JsonProperty(value="solicit")
	SOLICIT,
	
	@JsonProperty(value="question")
	QUESTION,
	
	@JsonProperty(value="chat")
	CHAT;
	
}
