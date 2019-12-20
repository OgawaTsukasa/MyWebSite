package beans;

import java.io.Serializable;

public class UserDataBeans implements Serializable{
	private int userId;
	private int personalId;
	private int sizeId;
	private String loginId;
	private String password;
	//PersonalInfoBeansと結合
	private PersonalInfoBeans personalInfo;
	//SizeBeanseと結合
	private SizeBeanse size;




	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}


	public int getPersonalId() {
		return personalId;
	}
	public void setPersonalId(int personalId) {
		this.personalId = personalId;
	}


	public int getSizeId() {
		return sizeId;
	}
	public void setSizeId(int sizeId) {
		this.sizeId = sizeId;
	}


	public String getLoginId() {
		return loginId;
	}
	public void setLoginId(String loginId) {
		this.loginId = loginId;
	}


	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}


	public PersonalInfoBeans getPersonalInfo() {
		return personalInfo;
	}
	public void setPersonalInfo(PersonalInfoBeans personalInfo) {
		this.personalInfo = personalInfo;
	}


	public SizeBeanse getSize() {
		return size;
	}
	public void setSize(SizeBeanse size) {
		this.size = size;
	}
}