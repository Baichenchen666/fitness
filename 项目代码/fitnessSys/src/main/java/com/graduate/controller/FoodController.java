package com.graduate.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.lang3.StringUtils;
import com.graduate.bean.Food;
import com.graduate.service.FoodService;

/**
 * 食物三大元素对照表Controller
 */
@Controller
@RequestMapping(value = "/graduate/food")
public class FoodController {

	@Autowired
	private FoodService foodService;
	
	/**
	 * 1、使用@RequestMapping注解来映射请求的URL
	 * 2、使用ModelAndView类用来存储处理完后的结果数据，以及显示该数据的视图。
	 * 3、food为查询参数
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Food food, HttpServletRequest request, HttpServletResponse response) {
		// ModelAndView构造方法可以指定返回的页面名称-foodPage
		ModelAndView mv = new ModelAndView("hou/foodPage");
		// 通过调取service获取食物三大元素对照表列表
		List<Food> datalist = foodService.findList(food); 
		// 使用addObject()设置需要返回的值
		mv.addObject("datalist", datalist).addObject("param", food);
		// 让该ModelAndView返回Spring MVC框架去处理
		return mv;
	}

	/**
	 * 跳转新增/修改页面
	 */
	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("hou/foodForm");
		String id = request.getParameter("id");
		Food food = new Food();
		// 如果id不为空，则获取食物三大元素对照表，从而进行修改
		if(StringUtils.isNotBlank(id)) {
    		food = foodService.get(id);
    	}
    	mv.addObject("food", food).addObject("foodtypelist", Food.getFoodType());
		return mv;
	}

	/**
	 * 新增/修改
	 */
	@RequestMapping(value = "save")
	public String save(HttpServletRequest request, Food food) {
		foodService.save(food);
		return "redirect:/graduate/food/list";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        foodService.delete(request.getParameter("id"));
        return "redirect:/graduate/food/list";
	}

	
	/**
	 *前台食物对照表
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("qian/foodIndex");
		List<Food> datalist = foodService.findList(new Food()); 
		mv.addObject("datalist", datalist);
		return mv;
	}
}