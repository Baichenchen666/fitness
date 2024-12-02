package com.graduate.bean;

/**
 * 健身视频Entity
 */
public class Video{
	
	private String id;
	private String title;		// 视频名称
	private String strength;		// 强度
	private String apparatus;		// 器械
	private String duration;		// 时长
	private String position;		// 健身部位：例如全身、手臂、腿部
	private String consume;		// 总消耗（卡路里）
	private String info;		// 简介
	private String full;		// 全视频地址
	private String partial;		// 部分视频地址
	private String num;		// 观看次数
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}
	
	public String getStrength() {
		return strength;
	}

	public void setStrength(String strength) {
		this.strength = strength;
	}
	
	public String getApparatus() {
		return apparatus;
	}

	public void setApparatus(String apparatus) {
		this.apparatus = apparatus;
	}
	
	public String getDuration() {
		return duration;
	}

	public void setDuration(String duration) {
		this.duration = duration;
	}

	public String getPosition() {
		return position;
	}

	public void setPosition(String position) {
		this.position = position;
	}
	
	public String getConsume() {
		return consume;
	}

	public void setConsume(String consume) {
		this.consume = consume;
	}
	
	public String getInfo() {
		return info;
	}

	public void setInfo(String info) {
		this.info = info;
	}
	
	public String getFull() {
		return full;
	}

	public void setFull(String full) {
		this.full = full;
	}
	
	public String getPartial() {
		return partial;
	}

	public void setPartial(String partial) {
		this.partial = partial;
	}
	
	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}
	
}