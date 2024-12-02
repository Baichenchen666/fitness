package com.graduate.controller;

import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.graduate.bean.User;
import com.graduate.service.UserService;

/**
 * 用户信息Controller
 */
@Controller
@RequestMapping(value = "/graduate/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	/**
	 * 
	 * 后台-查看管理员、会员信息
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(User user, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("hou/userPage");
		List<User> datalist = userService.findList(user); 
		mv.addObject("datalist", datalist).addObject("param", user);
		return mv;
	}
	
	/**
	 * 
	 * 后台-新增、修改信息跳转页面
	 */
	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("hou/userForm");
		String id = request.getParameter("id");
		User user = new User();
		user.setAuth(request.getParameter("auth"));
		if(StringUtils.isNotBlank(id)) {
    		user = userService.get(id);
    	}
		mv.addObject("flag", request.getParameter("flag"));
    	mv.addObject("user", user);
		return mv;
	}

	/**
	 * 
	 * 后台-新增、修改  前台-修改个人信息
	 */
	@RequestMapping(value = "save")
	public String save(@RequestParam("uploadfile")CommonsMultipartFile pdfFile, HttpServletRequest request, User user) {
		String id = user.getId();
    	if(pdfFile != null && StringUtils.isNotBlank(pdfFile.getOriginalFilename())){  
    		BASE64Encoder encoder = new BASE64Encoder();
    		String bj = encoder.encode(pdfFile.getBytes());
    		user.setBackground(bj);
        } else if(StringUtils.isNotBlank(user.getId())) {
        	User yuser = userService.get(id);
        	user.setBackground(yuser.getBackground());
        }
		userService.save(user);
		if(StringUtils.isNotBlank(request.getParameter("flag"))) {
			// 若为个人信息，则修改后重新将当前用户加入缓存
			user = userService.get(user.getId());
			request.getSession().setAttribute("currentUser", user);
			return "redirect:/graduate/user/person";
		} else {
			return "redirect:/graduate/user/list?auth="+user.getAuth();
		}
	}
	
	/**
	 * 后台-删除
	 */
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        userService.delete(request.getParameter("id"));
        return "redirect:/graduate/user/list?auth="+request.getParameter("auth");
	}
	
	/**
	 * 后台-重置密码
	 */
	@RequestMapping(value = "reset")
	public String reset(HttpServletRequest request) {
		User user = userService.get(request.getParameter("id"));
		user.setPassword("1234");
		userService.save(user);
        return "redirect:/graduate/user/list?auth="+request.getParameter("auth");
	}
	
	/**
	 * 查看头像
	 */
	@RequestMapping(value = "/uploadImg")
    public void uploadImg(HttpServletRequest request, HttpServletResponse response) {
    	try {
    		String id = request.getParameter("id");
    		User user = userService.get(id);
        	byte[] byteArry = (byte[]) user.getBackground();
        	String data = new String(byteArry, "UTF-8");
        	BASE64Decoder decoder = new BASE64Decoder();
        	byte[] bytes = decoder.decodeBuffer(data);
        	for(int i=0; i<bytes.length; ++i) {
        		if(bytes[i] < 0) {
        			bytes[i] +=256;
        		}
        	}
        	response.setContentType("image/jpeg");
        	ServletOutputStream out = response.getOutputStream();
        	out.write(bytes);
        	out.flush();
        	out.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    }

	/**
	 * 前台-跳转个人信息页面 
	 */
	@RequestMapping(value = "person")
	public String person(HttpServletRequest request) {
		return "qian/person";
	}
	
	/**
	 * 
	 * 前台-VIP会员开通
	 */
	@RequestMapping(value = "vip")
	public ModelAndView vip(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("qian/vip");
		return mv;
	}
	
	
	/**
	 * 
	 * 开通会员
	 */
	@RequestMapping(value = "pay")
	public String pay(HttpServletRequest request, User user) {
		String paytype = user.getPaytype();
		user = userService.get(user.getId());
		user.setPaytype(paytype);
		user.setAuth("2");
		userService.save(user);
		// 若为个人信息，则修改后重新将当前用户加入缓存
		user = userService.get(user.getId());
		request.getSession().setAttribute("currentUser", user);
		return "redirect:/graduate/user/person";
	}
}