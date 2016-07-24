package tw.com.queautiful.commons.enums;

import com.fasterxml.jackson.annotation.JsonProperty;

public enum ArticleType {

	@JsonProperty(value="news") //轉JSON時用到
	NEWS, //存進DB/呼叫時 用到
	
	@JsonProperty(value="solicit")
	SOLICIT,
	
	@JsonProperty(value="question")
	QUESTION,
	
	@JsonProperty(value="chat")
	CHAT;
	
}
