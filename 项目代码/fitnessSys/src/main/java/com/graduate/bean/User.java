package com.graduate.bean;

/**
 * 用户信息Entity
 */
public class User{
	
	private String id;
	private String phone;		// 手机号
	private String name;		// 姓名
	private String gender;		// 性别
	private String paytype;		// vip会员支付方式
	private String autograph;		// 签名
	private Object background;		// 头像
	private String auth;		// 权限;0管理员；1普通会员；2VIP会员；3游客；
	private String password;		// 密码
	private String flag;		// 免费标志（普通用户1手机号仅1次免费）
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getPaytype() {
		return paytype;
	}

	public void setPaytype(String paytype) {
		this.paytype = paytype;
	}
	
	public String getAutograph() {
		return autograph;
	}

	public void setAutograph(String autograph) {
		this.autograph = autograph;
	}
	
	public Object getBackground() {
		return background;
	}

	public void setBackground(Object background) {
		this.background = background;
	}
	
	public String getAuth() {
		return auth;
	}

	public void setAuth(String auth) {
		this.auth = auth;
	}
	
	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}
	
}