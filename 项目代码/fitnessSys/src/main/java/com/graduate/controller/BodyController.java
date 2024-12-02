package com.graduate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.lang3.StringUtils;

import com.graduate.bean.Body;
import com.graduate.bean.User;
import com.graduate.service.BodyService;
import com.graduate.util.DateUtils;

/**
 * 会员身体情况记录表Controller
 */
@Controller
@RequestMapping(value = "/graduate/body")
public class BodyController {

	@Autowired
	private BodyService bodyService;
	
	/**
	 * 1、使用@RequestMapping注解来映射请求的URL
	 * 2、使用ModelAndView类用来存储处理完后的结果数据，以及显示该数据的视图。
	 * 3、body为查询参数
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Body body, HttpServletRequest request, HttpServletResponse response) {
		// ModelAndView构造方法可以指定返回的页面名称-bodyPage
		ModelAndView mv = new ModelAndView("hou/bodyPage");
		// 通过调取service获取会员身体情况记录表列表
		List<Body> datalist = bodyService.findList(body); 
		// 使用addObject()设置需要返回的值
		mv.addObject("datalist", datalist).addObject("param", body);
		// 让该ModelAndView返回Spring MVC框架去处理
		return mv;
	}

	/**
	 * 跳转新增/修改页面
	 */
	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("qian/bodyForm");
		String id = request.getParameter("id");
		Body body = new Body();
		// 如果id不为空，则获取会员身体情况记录表，从而进行修改
		if(StringUtils.isNotBlank(id)) {
    		body = bodyService.get(id);
    	}
    	mv.addObject("body", body);
		return mv;
	}

	/**
	 * 新增/修改
	 */
	@RequestMapping(value = "save")
	public String save(HttpServletRequest request, Body body) {
		body.setTime(DateUtils.getDateTime());
		bodyService.save(body);
		return "redirect:/graduate/body/index";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        bodyService.delete(request.getParameter("id"));
        return "redirect:/graduate/body/index";
	}

	@RequestMapping(value = "/index")
	public ModelAndView index(Body body, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("qian/bodyIndex");
		User user = (User) request.getSession().getAttribute("currentUser");
		body.setUserid(user.getId());
		List<Body> datalist = bodyService.findList(body); 
		mv.addObject("datalist", datalist).addObject("param", body);
		return mv;
	}
}