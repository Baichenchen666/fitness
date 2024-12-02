package com.graduate.bean;

/**
 * 每项健身计划Entity
 */
public class Planday{
	
	private String id;
	private String planid;		// 计划id
	private String day;		// 第几天
	private String act;		// 动作
	private String groups;		// 组数
	private String number;		// 次数
	private String secs;		// 组间休息秒数
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getPlanid() {
		return planid;
	}

	public void setPlanid(String planid) {
		this.planid = planid;
	}
	
	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}
	
	public String getAct() {
		return act;
	}

	public void setAct(String act) {
		this.act = act;
	}
	
	public String getGroups() {
		return groups;
	}

	public void setGroups(String groups) {
		this.groups = groups;
	}
	
	public String getNumber() {
		return number;
	}

	public void setNumber(String number) {
		this.number = number;
	}
	
	public String getSecs() {
		return secs;
	}

	public void setSecs(String secs) {
		this.secs = secs;
	}
	
}