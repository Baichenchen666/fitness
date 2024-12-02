package com.graduate.bean;

import java.util.ArrayList;
import java.util.List;

/**
 * 食物三大元素对照表Entity
 */
public class Food{
	
	private String id;
	private String name;		// 名称
	private String type;		// 类型
	private String energy;		// 总能量（kcal）
	private String protein;		// 蛋白质（g）
	private String fat;		// 脂肪（g）
	private String carbohydrate;		// 碳水化合物（g）
	

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
	
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	public String getEnergy() {
		return energy;
	}

	public void setEnergy(String energy) {
		this.energy = energy;
	}
	
	public String getProtein() {
		return protein;
	}

	public void setProtein(String protein) {
		this.protein = protein;
	}
	
	public String getFat() {
		return fat;
	}

	public void setFat(String fat) {
		this.fat = fat;
	}
	
	public String getCarbohydrate() {
		return carbohydrate;
	}

	public void setCarbohydrate(String carbohydrate) {
		this.carbohydrate = carbohydrate;
	}
	
	public static List<String> getFoodType() {
		List<String> list = new ArrayList<String>();
		list.add("主食");
		list.add("肉类（熟）");
		list.add("蛋类");
		list.add("海产品");
		list.add("奶制品");
		list.add("豆制品");
		list.add("蔬菜");
		list.add("水果");
		list.add("糖");
		return list;
	}
}