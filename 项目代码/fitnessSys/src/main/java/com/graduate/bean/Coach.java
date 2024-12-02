package com.graduate.bean;

/**
 * 健身教练团体Entity
 */
public class Coach{
	
	private String id;
	private String name;		// 教练姓名
	private String gender;		// 性别
	private String phone;		// 联系方式
	private String type;		// 教练类型：增肌，减脂
	private String info;		// 个人成就
	private Object background;		// 头像
	private Object qrcode;		// 二维码
	private String num;		// 点击的健身教练受欢迎度
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
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
	
	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	public Object getBackground() {
		return background;
	}

	public void setBackground(Object background) {
		this.background = background;
	}
	
	public Object getQrcode() {
		return qrcode;
	}

	public void setQrcode(Object qrcode) {
		this.qrcode = qrcode;
	}
	
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}
	
}