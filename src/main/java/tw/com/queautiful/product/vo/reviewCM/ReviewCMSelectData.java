package tw.com.queautiful.product.vo.reviewCM;

import com.fasterxml.jackson.annotation.JsonFormat;

public class ReviewCMSelectData {

	private Long rcmId;
	private Long reviewId;
	private Long memberId;
	private String nickname;
	//心得留言內容
	private String rcmMsg;
	//心得留言時間
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd HH:mm:ss",timezone="Asia/Taipei")
	private java.sql.Timestamp rcmTime;
	
	
	public Long getRcmId() {
		return rcmId;
	}
	public void setRcmId(Long rcmId) {
		this.rcmId = rcmId;
	}
	public Long getReviewId() {
		return reviewId;
	}
	public void setReviewId(Long reviewId) {
		this.reviewId = reviewId;
	}
	public Long getMemberId() {
		return memberId;
	}
	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getRcmMsg() {
		return rcmMsg;
	}
	public void setRcmMsg(String rcmMsg) {
		this.rcmMsg = rcmMsg;
	}
	public java.sql.Timestamp getReviewCMTime() {
		return rcmTime;
	}
	public void setReviewCMTime(java.sql.Timestamp rcmTime) {
		this.rcmTime = rcmTime;
	}
	
}
