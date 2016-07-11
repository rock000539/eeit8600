package tw.com.queautiful.product.entity;

import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OrderBy;
import javax.persistence.JoinTable;
import javax.persistence.Table;
import javax.persistence.Transient;

import org.neo4j.cypher.internal.compiler.v2_1.planner.logical.steps.sortSkipAndLimit;
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name="MEMBER")
public class Member {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="MEMBERID")
	private Long memberId;
	
	@Column(name="EMAIL", length=50)
	private String email;
	
	@Column(name="PASSWORD", length=100)
	private String password;
	
	@Column(name="NICKNAME", length=50)
	private String nickname;

	@Column(name="FIRSTNAME", length=50)
	private String firstName;
	
	@Column(name="LASTNAME", length=50)
	private String lastName;
	
	@Column(name="GENDER", length=10)
	private String gender;
	
	@Column(name="BIRTHDAY")
	private java.sql.Date birthDay;
	
	@Column(name="age")
	private Integer age;
	
	@Column(name="SKINTYPE", length=30)
	private String skinType;
	
	@Column(name="MEMBERIMG", length=200)
	private String memberImg;
	
	@Column(name="PHONE", length=50)
	private String phone;
	
	@Column(name="ADDR", length=200)
	private String addr;
	
	@Column(name="MEMBERREGIDATE")
	private java.sql.Date memberRegiDate; //會員註冊日期
	
	@Column(name="MEMBERSUSPEND")
	private Boolean memberSuspend; //會員停權狀態
	
	@Column(name="MEMBERSUSPENDSTART")
	private java.sql.Date memberSuspendStart; //會員停權日期
	
	@Column(name="MEMBERSUSPENDDAYS")
	private Integer memberSuspendDays; //會員停權天數
	
	@Column(name="MEMBERSUSPENDCOUNT")
	private Integer memberSuspendCount; //會員累計停權次數
	
	@Column(name="RESETPSWTOKEN")
	private String resetPswToken; //重設密碼token
	
	@Column(name="RESETPSWEXP")
	private java.sql.Date resetPswExp; //重設密碼期限
	
	//文章收藏
	@ManyToMany(fetch = FetchType.LAZY, cascade=CascadeType.ALL)
	@JsonIgnore
	@JoinTable(name="member_article", joinColumns=@JoinColumn(name="MEMBERID", referencedColumnName="MEMBERID"), inverseJoinColumns=@JoinColumn(name="ARTICLEID", referencedColumnName="ARTICLEID"))
	private Set<Article> articlesSavedByMember;
	
	//文章撰寫作者
	@OneToMany(mappedBy = "member", fetch = FetchType.EAGER)
	@JsonIgnore
	@OrderBy("ARTICLETIME DESC")
	private Set<Article> articlesWorteByAuthor;
	
	@Transient
	private java.sql.Date memberSuspendExp; //會員停權到期日
	
	@Transient
	private MultipartFile memberImgFile;
	
	
	@Override
	public String toString() {
		return "Member [memberId=" + memberId + ", email=" + email + ", articlesSavedByMember=" + articlesSavedByMember
				+ ", articlesWorteByAuthor=" + articlesWorteByAuthor + "]";
	}

	public MultipartFile getMemberImgFile() {
		return memberImgFile;
	}

	public void setMemberImgFile(MultipartFile memberImgFile) {
		this.memberImgFile = memberImgFile;
	}

	public java.sql.Date getMemberSuspendExp() {
		return memberSuspendExp;
	}

	public void setMemberSuspendExp(java.sql.Date memberSuspendExp) {
		this.memberSuspendExp = memberSuspendExp;
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
	
	public Integer getAge() {
		return age;
	}

	public void setAge(Integer age) {
		this.age = age;
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
	
	public java.sql.Date getMemberRegiDate() {
		return memberRegiDate;
	}

	public void setMemberRegiDate(java.sql.Date memberRegiDate) {
		this.memberRegiDate = memberRegiDate;
	}

	public Boolean getMemberSuspend() {
		return memberSuspend;
	}

	public void setMemberSuspend(Boolean memberSuspend) {
		this.memberSuspend = memberSuspend;
	}

	public java.sql.Date getMemberSuspendStart() {
		return memberSuspendStart;
	}

	public void setMemberSuspendStart(java.sql.Date memberSuspendStart) {
		this.memberSuspendStart = memberSuspendStart;
	}

	public Integer getMemberSuspendDays() {
		return memberSuspendDays;
	}

	public void setMemberSuspendDays(Integer memberSuspendDays) {
		this.memberSuspendDays = memberSuspendDays;
	}

	public Integer getMemberSuspendCount() {
		return memberSuspendCount;
	}

	public void setMemberSuspendCount(Integer memberSuspendCount) {
		this.memberSuspendCount = memberSuspendCount;
	}

	public String getResetPswToken() {
		return resetPswToken;
	}

	public void setResetPswToken(String resetPswToken) {
		this.resetPswToken = resetPswToken;
	}

	public java.sql.Date getResetPswExp() {
		return resetPswExp;
	}

	public void setResetPswExp(java.sql.Date resetPswExp) {
		this.resetPswExp = resetPswExp;
	}

	public Set<Article> getArticlesSavedByMember() {
		return articlesSavedByMember;
	}

	public void setArticlesSavedByMember(Set<Article> articlesSavedByMember) {
		this.articlesSavedByMember = articlesSavedByMember;
	}

	public Set<Article> getArticlesWorteByAuthor() {
		return articlesWorteByAuthor;
	}

	public void setArticlesWorteByAuthor(Set<Article> articlesWorteByAuthor) {
		this.articlesWorteByAuthor = articlesWorteByAuthor;
	}

	
}
