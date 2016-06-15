package tw.com.queautiful.product.entity;

import javax.annotation.Generated;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="MEMBER")
public class Member {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MEMBERID")
	private Long memberId;
	
	@Column(name="EMAIL", length=50)
	private String email;
	
	@Column(name="PASSWORD", length=20)
	private String password;
	
	@Column(name="NICKNAME", length=50)
	private String nickname;
	
	@Column(name="LASTNAME", length=50)
	private String lastName;
	
	@Column(name="FIRSTNAME", length=50)
	private String firstName;
	
	@Column(name="GENDER", length=10)
	private String gender;
	
	@Column(name="BIRTHDAY")
	private java.sql.Date birthDay;
	
	@Column(name="SKINTYPE", length=30)
	private String skinType;
	
	@Column(name="MEMBERIMG", length=200)
	private String memberImg;
	
	@Column(name="PHONE", length=50)
	private String phone;
	
	@Column(name="ADDR", length=200)
	private String addr;
	
	@Column(name="MEMBERSUSPEND")
	private Integer memberSuspend;
	
	@Column(name="MEMBERSUSPENDEXP")
	private java.sql.Date memberSuspendExp;
	
	@Override
	public String toString() {
		return "Member [email=" + email + ", password=" + password + ", nickname=" + nickname + ", lastName=" + lastName
				+ ", firstName=" + firstName + ", gender=" + gender + ", birthDay=" + birthDay + ", skinType="
				+ skinType + ", memberImg=" + memberImg + ", phone=" + phone + ", addr=" + addr + ", memberSuspend="
				+ memberSuspend + ", memberSuspendExp=" + memberSuspendExp + ", memberId=" + memberId + "]";
	}

	public Long getMemberId() {
		return memberId;
	}

	public void setMemberId(Long memberId) {
		this.memberId = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public java.sql.Date getBirthDay() {
		return birthDay;
	}

	public void setBirthDay(java.sql.Date birthDay) {
		this.birthDay = birthDay;
	}

	public String getSkinType() {
		return skinType;
	}

	public void setSkinType(String skinType) {
		this.skinType = skinType;
	}

	public String getMemberImg() {
		return memberImg;
	}

	public void setMemberImg(String memberImg) {
		this.memberImg = memberImg;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public Integer getMemberSuspend() {
		return memberSuspend;
	}

	public void setMemberSuspend(Integer memberSuspend) {
		this.memberSuspend = memberSuspend;
	}

	public java.sql.Date getMemberSuspendExp() {
		return memberSuspendExp;
	}

	public void setMemberSuspendExp(java.sql.Date memberSuspendExp) {
		this.memberSuspendExp = memberSuspendExp;
	}
	
	
}
