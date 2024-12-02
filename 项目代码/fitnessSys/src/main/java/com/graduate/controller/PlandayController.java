package com.graduate.controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.lang3.StringUtils;
import com.graduate.bean.Planday;
import com.graduate.service.PlandayService;

/**
 * 每项健身计划Controller
 */
@Controller
@RequestMapping(value = "/graduate/planday")
public class PlandayController {

	@Autowired
	private PlandayService plandayService;
	
	/**
	 * 1、使用@RequestMapping注解来映射请求的URL
	 * 2、使用ModelAndView类用来存储处理完后的结果数据，以及显示该数据的视图。
	 * 3、planday为查询参数
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Planday planday, HttpServletRequest request, HttpServletResponse response) {
		// ModelAndView构造方法可以指定返回的页面名称-plandayPage
		ModelAndView mv = new ModelAndView("hou/plandayPage");
		// 通过调取service获取每项健身计划列表
		List<Planday> datalist = plandayService.findList(planday); 
		// 使用addObject()设置需要返回的值
		mv.addObject("datalist", datalist).addObject("param", planday);
		// 让该ModelAndView返回Spring MVC框架去处理
		return mv;
	}

	/**
	 * 跳转新增/修改页面
	 */
	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("hou/plandayForm");
		String id = request.getParameter("id");
		Planday planday = new Planday();
		planday.setPlanid(request.getParameter("planid"));
		// 如果id不为空，则获取每项健身计划，从而进行修改
		if(StringUtils.isNotBlank(id)) {
    		planday = plandayService.get(id);
    	}
    	mv.addObject("planday", planday);
		return mv;
	}

	/**
	 * 新增/修改
	 */
	@RequestMapping(value = "save")
	public String save(HttpServletRequest request, Planday planday) {
		plandayService.save(planday);
		return "redirect:/graduate/planday/list?planid="+planday.getPlanid();
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        plandayService.delete(request.getParameter("id"));
        return "redirect:/graduate/planday/list?planid="+request.getParameter("planid");
	}

}