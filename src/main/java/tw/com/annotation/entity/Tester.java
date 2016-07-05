package tw.com.annotation.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.EnumType;
import javax.persistence.Enumerated;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import tw.com.annotation.util.Gender;

@Entity
@Table
public class Tester {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ID")
    private Integer id;
	
	@Column(name="NAME")
    private String name;
    
    @Column(name="AGE")
    private Integer age;

    @Enumerated(EnumType.STRING)
    @Column(name = "GENDER")
    private Gender gender;

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Tester [id=" + id + ", name=" + name + ", age=" + age + ", gender=" + gender + "]";
	}
	
}
