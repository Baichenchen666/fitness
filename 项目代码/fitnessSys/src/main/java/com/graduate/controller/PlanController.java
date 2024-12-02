package com.graduate.controller;

import java.math.BigDecimal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.graduate.bean.Food;
import com.graduate.bean.Plan;
import com.graduate.bean.Planday;
import com.graduate.bean.User;
import com.graduate.service.FoodService;
import com.graduate.service.PlanService;
import com.graduate.service.PlandayService;
import com.graduate.service.UserService;

/**
 * 健身计划Controller
 */
@Controller
@RequestMapping(value = "/graduate/plan")
public class PlanController {

	@Autowired
	private PlanService planService;
	@Autowired
	private PlandayService plandayService;
	@Autowired
	private FoodService foodService;
	@Autowired
	private UserService userService;
	
	/**
	 * 1、使用@RequestMapping注解来映射请求的URL
	 * 2、使用ModelAndView类用来存储处理完后的结果数据，以及显示该数据的视图。
	 * 3、plan为查询参数
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Plan plan, HttpServletRequest request, HttpServletResponse response) {
		// ModelAndView构造方法可以指定返回的页面名称-planPage
		ModelAndView mv = new ModelAndView("hou/planPage");
		// 通过调取service获取健身计划列表
		List<Plan> datalist = planService.findList(plan); 
		// 使用addObject()设置需要返回的值
		mv.addObject("datalist", datalist).addObject("param", plan);
		// 让该ModelAndView返回Spring MVC框架去处理
		return mv;
	}

	/**
	 * 跳转新增/修改页面
	 */
	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("hou/planForm");
		String id = request.getParameter("id");
		Plan plan = new Plan();
		// 如果id不为空，则获取健身计划，从而进行修改
		if(StringUtils.isNotBlank(id)) {
    		plan = planService.get(id);
    	}
    	mv.addObject("plan", plan);
		return mv;
	}

	/**
	 * 新增/修改
	 */
	@RequestMapping(value = "save")
	public String save(HttpServletRequest request, Plan plan) {
		planService.save(plan);
		return "redirect:/graduate/plan/list";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        planService.delete(request.getParameter("id"));
        return "redirect:/graduate/plan/list";
	}

	/**
	 * 批量删除
	 */
	@RequestMapping(value = "deleteCheck")
	public String deleteCheck(HttpServletRequest request) {
		String ids = request.getParameter("ids");
		String[] idsarr = ids.split(",");
		for(int i=0;i<idsarr.length;i++ ) {
			 planService.delete(idsarr[i]);
		}
        return "redirect:/graduate/plan/list";
	}
	
	/**
	 * 前台选择健身方案
	 */
	@RequestMapping(value = "index")
	public ModelAndView index(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("qian/planIndex");
		return mv;
	}
	
	/**
	 * 前台选择健身方案
	 */
	@RequestMapping(value = "choice")
	public ModelAndView choice(HttpServletRequest request, Plan param) {
		if("女".equals(param.getGender())) {
			param.setLevel(request.getParameter("level2"));
		}
		
		String age = request.getParameter("age");
		String height = request.getParameter("height");
		String weight = request.getParameter("weight");
		ModelAndView mv = new ModelAndView("qian/planChoice");
		List<Plan> list = planService.findList(param);
		// 生成健身计划
		if(list != null && !list.isEmpty()) {
			Plan plan = list.get(0);
			Planday planday = new Planday();
			planday.setPlanid(plan.getId());
			// 获取健身计划
			List<Planday> pdlist = plandayService.findList1(planday);
			mv.addObject("plan", plan);
			mv.addObject("pdlist", pdlist);
		}
		
		BigDecimal calorie = new BigDecimal(0);
		// 生成饮食建议
		// 基础代谢率公式
		if("男".equals(param.getGender())) {
			calorie = new BigDecimal(66);
			calorie = calorie.add(new BigDecimal(13.7).multiply(new BigDecimal(weight)));
			calorie = calorie.add(new BigDecimal(5.0).multiply(new BigDecimal(height)));
			calorie = calorie.subtract(new BigDecimal(6.8).multiply(new BigDecimal(age)));
		} else {
			calorie = new BigDecimal(655);
			calorie = calorie.add(new BigDecimal(9.6).multiply(new BigDecimal(weight)));
			calorie = calorie.add(new BigDecimal(1.7).multiply(new BigDecimal(height)));
			calorie = calorie.subtract(new BigDecimal(4.7).multiply(new BigDecimal(age)));
		}
		// 卡路里、碳水、蛋白质、脂肪
		BigDecimal carbohydrate = new BigDecimal(0);// 碳水
		BigDecimal protein = new BigDecimal(0);		// 蛋白质
		BigDecimal fat = new BigDecimal(0);			// 脂肪
		String content = "";
		if("增肌".equals(param.getType())) {
			calorie = calorie.add(new BigDecimal(300));
			carbohydrate = calorie.multiply(new BigDecimal(0.6));
			protein = calorie.multiply(new BigDecimal(0.2));
			fat = calorie.multiply(new BigDecimal(0.2));
			content = "增肌主食以精加工食品为主，如米饭、面条等，肉类以精瘦肉为主，如牛腱、猪里脊、鱼虾，脂肪类以橄榄油坚果等不饱和脂肪为主，蔬菜不限量";
		} else {
			calorie = calorie.subtract(new BigDecimal(300));
			carbohydrate = calorie.multiply(new BigDecimal(0.5));
			protein = calorie.multiply(new BigDecimal(0.25));
			fat = calorie.multiply(new BigDecimal(0.25));
			content = "减脂主食以粗粮为主，如紫薯、红薯玉米等，肉类以精瘦肉为主，如牛腱、猪里脊、鱼虾，脂肪类以橄榄油坚果等不饱和脂肪为主，蔬菜不限量";
		}
		calorie = calorie.setScale(2, BigDecimal.ROUND_HALF_UP);
		carbohydrate = carbohydrate.divide(new BigDecimal(4), 2, BigDecimal.ROUND_HALF_UP);
		protein = protein.divide(new BigDecimal(4), 2, BigDecimal.ROUND_HALF_UP);
		fat = fat.divide(new BigDecimal(9), 2, BigDecimal.ROUND_HALF_UP);
		mv.addObject("calorie", calorie.toString());
		mv.addObject("carbohydrate", carbohydrate.toString());
		mv.addObject("protein", protein.toString());
		mv.addObject("fat", fat.toString());
		mv.addObject("content", content);
		
		// 食物三大元素对照表
		List<Food> foodlist = foodService.findList(new Food());
		mv.addObject("foodlist", foodlist);
		
		// 修改查询次数
		User user = (User) request.getSession().getAttribute("currentUser");
		if("1".equals(user.getAuth())) {
			user.setFlag("1");
			userService.save(user);
		}
		
		return mv;
	}
	
}