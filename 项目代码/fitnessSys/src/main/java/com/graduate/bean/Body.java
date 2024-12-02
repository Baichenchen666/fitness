package com.graduate.bean;

/**
 * 会员身体情况记录表Entity
 */
public class Body{
	
	private String id;
	private String userid;		// 用户id
	private String height;		// 身高
	private String weight;		// 体重
	private String bodyfat;		// 体脂率
	private String bmi;		// BMI指数
	private String bust;		// 胸围
	private String bigarm;		// 大臂围
	private String forearm;		// 小臂围
	private String waistline;		// 腰围
	private String hipline;		// 臀围
	private String thigh;		// 大腿围
	private String shank;		// 小腿围
	private String time;		// 记录时间
	private String username;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}
	
	public String getHeight() {
		return height;
	}

	public void setHeight(String height) {
		this.height = height;
	}
	
	public String getWeight() {
		return weight;
	}

	public void setWeight(String weight) {
		this.weight = weight;
	}
	
	public String getBodyfat() {
		return bodyfat;
	}

	public void setBodyfat(String bodyfat) {
		this.bodyfat = bodyfat;
	}
	
	public String getBmi() {
		return bmi;
	}

	public void setBmi(String bmi) {
		this.bmi = bmi;
	}
	
	public String getBust() {
		return bust;
	}

	public void setBust(String bust) {
		this.bust = bust;
	}
	
	public String getBigarm() {
		return bigarm;
	}

	public void setBigarm(String bigarm) {
		this.bigarm = bigarm;
	}
	
	public String getForearm() {
		return forearm;
	}

	public void setForearm(String forearm) {
		this.forearm = forearm;
	}
	
	public String getWaistline() {
		return waistline;
	}

	public void setWaistline(String waistline) {
		this.waistline = waistline;
	}
	
	public String getHipline() {
		return hipline;
	}

	public void setHipline(String hipline) {
		this.hipline = hipline;
	}
	
	public String getThigh() {
		return thigh;
	}

	public void setThigh(String thigh) {
		this.thigh = thigh;
	}
	
	public String getShank() {
		return shank;
	}

	public void setShank(String shank) {
		this.shank = shank;
	}

	public String getTime() {
		return time;
	}

	public void setTime(String time) {
		this.time = time;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}
	
}