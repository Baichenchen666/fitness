package com.graduate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.graduate.bean.Coach;
import com.graduate.bean.User;
import com.graduate.bean.Video;
import com.graduate.service.CoachService;
import com.graduate.service.UserService;
import com.graduate.service.VideoService;
import com.graduate.util.JsonMsg;

@Controller
@RequestMapping(value = "/graduate")
public class LoginController {

	@Autowired
    private UserService userService;
	@Autowired
	private CoachService coachService;
	@Autowired
	private VideoService videoService;
	
	/**
     * 主页
     * @return
     */
    @RequestMapping(value = "/index")
    public String index(){
        return "qian/index";
    }
    
    /**
     * 前端：跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/userlogin")
    public String userlogin(){
        return "qian/userlogin";
    }
    
    /**
     * 前端：退出登录：从主页面跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/userlogout")
    public String userlogout(HttpServletRequest request){
    	request.getSession().removeAttribute("currentUser");
        return "qian/userlogin";
    }
	
	/**
     * 登录：跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/login")
    public String login(){
        return "hou/login";
    }
    /**
     * 普通用户登录
     * @param request
     * @return
     */
    @RequestMapping(value = "/dologin")
    @ResponseBody
    public JsonMsg dologin(HttpServletRequest request){
        String name = request.getParameter("username");
        String password = request.getParameter("password");
        String phone = request.getParameter("phone");
        User param = new User();
        param.setPassword(password);
        param.setName(name);
        param.setPhone(phone);
        User user = userService.identity(param);
        if (user == null || user.getId() == null){
            return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
        }
        // 后台登录
        if(StringUtils.isNotBlank(name) && !"0".equals(user.getAuth())) {
        	return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
    	}
        // 前台登录
        if(StringUtils.isNotBlank(phone) && !"1".equals(user.getAuth()) && !"2".equals(user.getAuth())) {
        	return JsonMsg.fail().addInfo("login_error", "输入账号用户名与密码不匹配，请重新输入！");
    	}
        request.getSession().setAttribute("currentUser", user);
        return JsonMsg.success().addInfo(user);
    }

    /**
     * 退出登录：从主页面跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/logout")
    public String logout(HttpServletRequest request){
    	request.getSession().removeAttribute("currentUser");
        return "hou/login";
    }

    /**
     * 注册页面
     * @return
     */
    @RequestMapping(value = "/register")
    public ModelAndView register() {
    	ModelAndView mv = new ModelAndView("qian/register");
    	return mv;
    }
    
    /**
     * 注册
     * @return
     */
    @RequestMapping(value = "/doRegister")
    @ResponseBody
    public JsonMsg doRegister(User user, HttpServletRequest request){
    	try {
    		User param = new User();
    		param.setPhone(user.getPhone());
    		List<User> list = userService.findList(param);
    		if(list != null && !list.isEmpty()) {
    			return JsonMsg.fail("该手机号已注册，请登录！");
    		}
    		String id = userService.save(user);
            if (StringUtils.isNotBlank(id)){
            	request.getSession().setAttribute("currentUser", userService.get(id));
                return JsonMsg.success();
            }else {
                return JsonMsg.fail();
            }
		} catch (Exception e) {
			e.printStackTrace();
			return JsonMsg.fail();
		}
    }
    
    /**
     * 退出登录：从主页面跳转到登录页面
     * @return
     */
    @RequestMapping(value = "/total")
    public ModelAndView total(HttpServletRequest request){
    	ModelAndView mv = new ModelAndView("hou/total");
    	Gson gson = new Gson();
		mv.addObject("coachlist", gson.toJson(coachService.total(new Coach())));
		mv.addObject("videolist", gson.toJson(videoService.total(new Video())));
    	return mv;
    }
}
