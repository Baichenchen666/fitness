package com.graduate.controller;

import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.lang3.StringUtils;

import sun.misc.BASE64Decoder;
import sun.misc.BASE64Encoder;

import com.graduate.bean.Coach;
import com.graduate.service.CoachService;

/**
 * 健身教练团体Controller
 */
@Controller
@RequestMapping(value = "/graduate/coach")
public class CoachController {

	@Autowired
	private CoachService coachService;
	
	/**
	 * 1、使用@RequestMapping注解来映射请求的URL
	 * 2、使用ModelAndView类用来存储处理完后的结果数据，以及显示该数据的视图。
	 * 3、coach为查询参数
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Coach coach, HttpServletRequest request, HttpServletResponse response) {
		// ModelAndView构造方法可以指定返回的页面名称-coachPage
		ModelAndView mv = new ModelAndView("hou/coachPage");
		// 通过调取service获取健身教练团体列表
		List<Coach> datalist = coachService.findList(coach); 
		// 使用addObject()设置需要返回的值
		mv.addObject("datalist", datalist).addObject("param", coach);
		// 让该ModelAndView返回Spring MVC框架去处理
		return mv;
	}

	/**
	 * 跳转新增/修改页面
	 */
	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("hou/coachForm");
		String id = request.getParameter("id");
		Coach coach = new Coach();
		// 如果id不为空，则获取健身教练团体，从而进行修改
		if(StringUtils.isNotBlank(id)) {
    		coach = coachService.get(id);
    	}
    	mv.addObject("coach", coach);
		return mv;
	}

	/**
	 * 新增/修改
	 */
	@RequestMapping(value = "save")
	public String save(@RequestParam("uploadfile")CommonsMultipartFile pdfFile, @RequestParam("uploadfile2")CommonsMultipartFile pdfFile2, HttpServletRequest request, Coach coach) {
		String id = coach.getId();
    	if(pdfFile != null && StringUtils.isNotBlank(pdfFile.getOriginalFilename())){  
    		BASE64Encoder encoder = new BASE64Encoder();
    		String bj = encoder.encode(pdfFile.getBytes());
    		coach.setBackground(bj);
        } else if(StringUtils.isNotBlank(coach.getId())) {
        	Coach ycoach = coachService.get(id);
        	coach.setBackground(ycoach.getBackground());
        }
    	if(pdfFile2 != null && StringUtils.isNotBlank(pdfFile2.getOriginalFilename())){  
    		BASE64Encoder encoder = new BASE64Encoder();
    		String bj = encoder.encode(pdfFile2.getBytes());
    		coach.setQrcode(bj);
        } else if(StringUtils.isNotBlank(coach.getId())) {
        	Coach ycoach = coachService.get(id);
        	coach.setQrcode(ycoach.getQrcode());
        }
		coachService.save(coach);
		return "redirect:/graduate/coach/list";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        coachService.delete(request.getParameter("id"));
        return "redirect:/graduate/coach/list";
	}

	/**
	 * 查看头像
	 */
	@RequestMapping(value = "/uploadImg")
    public void uploadImg(HttpServletRequest request, HttpServletResponse response) {
    	try {
    		String id = request.getParameter("id");
    		Coach coach = coachService.get(id);
        	byte[] byteArry = (byte[]) coach.getBackground();
        	if(StringUtils.isNotBlank(request.getParameter("flag"))) {		// 若标志不为空，则返回二维码图片
        		byteArry = (byte[]) coach.getQrcode();
        	}
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
	
	@RequestMapping(value = "/index")
	public ModelAndView index(Coach coach, HttpServletRequest request, HttpServletResponse response) {
		// ModelAndView构造方法可以指定返回的页面名称-coachPage
		ModelAndView mv = new ModelAndView("qian/coachIndex");
		// 通过调取service获取健身教练团体列表
		List<Coach> datalist = coachService.findList(coach); 
		// 使用addObject()设置需要返回的值
		mv.addObject("datalist", datalist).addObject("param", coach);
		// 让该ModelAndView返回Spring MVC框架去处理
		return mv;
	}
	
	/**
	 * 跳转查看页面
	 */
	@RequestMapping(value = "view")
	public ModelAndView view(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("qian/coachView");
    	Coach coach = coachService.get(request.getParameter("id"));
    	// 修改受欢迎度
    	coach.setNum(Integer.parseInt(coach.getNum())+1+"");
		coachService.save(coach);
    	mv.addObject("coach", coach);
		return mv;
	}
	
	@RequestMapping(value = "/vip")
	public ModelAndView vip(Coach coach, HttpServletRequest request, HttpServletResponse response) {
		// ModelAndView构造方法可以指定返回的页面名称-coachPage
		ModelAndView mv = new ModelAndView("qian/coachVip");
		// 通过调取service获取健身教练团体列表
		List<Coach> datalist = coachService.findList(coach); 
		// 使用addObject()设置需要返回的值
		mv.addObject("datalist", datalist).addObject("param", coach);
		// 让该ModelAndView返回Spring MVC框架去处理
		return mv;
	}
}