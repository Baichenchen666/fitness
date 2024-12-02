package com.graduate.bean;

/**
 * 健身计划Entity
 */
public class Plan{
	
	private String id;
	private String place;		// 场所：健身房、家庭健身
	private String gender;		// 性别
	private String type;		// 类型：增肌，减脂
	private String level;		// 级数
	private String proposal;		// 建议
	private String rhythm;		// 健身节奏
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getPlace() {
		return place;
	}

	public void setPlace(String place) {
		this.place = place;
	}
	
	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}
	
	public String getProposal() {
		return proposal;
	}

	public void setProposal(String proposal) {
		this.proposal = proposal;
	}
	
	public String getRhythm() {
		return rhythm;
	}

	public void setRhythm(String rhythm) {
		this.rhythm = rhythm;
	}
	
}