package com.graduate.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.lang3.StringUtils;

import com.graduate.bean.User;
import com.graduate.bean.Word;
import com.graduate.service.WordService;
import com.graduate.util.DateUtils;

/**
 * 留言信息Controller
 */
@Controller
@RequestMapping(value = "/graduate/word")
public class WordController {

	@Autowired
	private WordService wordService;
	
	/**
	 * 1、使用@RequestMapping注解来映射请求的URL
	 * 2、使用ModelAndView类用来存储处理完后的结果数据，以及显示该数据的视图。
	 * 3、word为查询参数
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Word word, HttpServletRequest request, HttpServletResponse response) {
		// ModelAndView构造方法可以指定返回的页面名称-wordPage
		ModelAndView mv = new ModelAndView("hou/wordPage");
		// 通过调取service获取留言信息列表
		List<Word> datalist = wordService.findList(word); 
		// 使用addObject()设置需要返回的值
		mv.addObject("datalist", datalist).addObject("param", word);
		// 让该ModelAndView返回Spring MVC框架去处理
		return mv;
	}

	/**
	 * 跳转新增/修改页面
	 */
	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("qian/wordForm");
		String id = request.getParameter("id");
		Word word = new Word();
		// 如果id不为空，则获取留言信息，从而进行修改
		if(StringUtils.isNotBlank(id)) {
    		word = wordService.get(id);
    	}
    	mv.addObject("word", word);
		return mv;
	}

	/**
	 * 新增/修改
	 */
	@RequestMapping(value = "save")
	public String save(HttpServletRequest request, Word word) {
		User user = (User) request.getSession().getAttribute("currentUser");
		word.setCreateid(user.getId());
		word.setCreatename(user.getName());
		word.setCreatetime(DateUtils.getDateTime());
		wordService.save(word);
		return "redirect:/graduate/word/index";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        wordService.delete(request.getParameter("id"));
        String flag = request.getParameter("flag");
        if(StringUtils.isNotBlank(flag)) {
        	return "redirect:/graduate/word/index";
        }
        return "redirect:/graduate/word/list";
	}

	 /**
     * 回复信息
     * @param id
     * @param word
     * @return
     */
    @RequestMapping(value ="/reply")
    public String updateResult(Word word, HttpServletRequest request){
    	User currentUser = (User) request.getSession().getAttribute("currentUser");
    	word.setReplyid(currentUser.getId());
    	word.setReplyname(currentUser.getName());
    	word.setReplytime(DateUtils.getDateTime());
        wordService.reply(word);
        return "redirect:/graduate/word/list";
    }
    
    @RequestMapping(value = "/getReply")
    public ModelAndView getResForm(HttpServletRequest request){
    	ModelAndView mv = new ModelAndView("hou/wordReply");
    	String id = request.getParameter("id");
    	if(StringUtils.isNotBlank(id)) {
    		Word word = wordService.get(id);
    		mv.addObject("word", word);
    	}
        return mv;
    }
    
    /**
	 * 前台留言板
	 */
	@RequestMapping(value = "/index")
	public ModelAndView index(Word word, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("qian/wordIndex");
		User user = (User) request.getSession().getAttribute("currentUser");
		word.setCreateid(user.getId());
		List<Word> datalist = wordService.findList(word); 
		mv.addObject("datalist", datalist);
		return mv;
	}
}