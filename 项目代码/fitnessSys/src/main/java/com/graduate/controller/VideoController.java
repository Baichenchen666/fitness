package com.graduate.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.apache.commons.lang3.StringUtils;

import com.graduate.bean.User;
import com.graduate.bean.Video;
import com.graduate.service.VideoService;

/**
 * 健身视频Controller
 */
@Controller
@RequestMapping(value = "/graduate/video")
public class VideoController {

	@Autowired
	private VideoService videoService;
	
	private String basedir = "D:/fitnessSys/video/";
	
	/**
	 * 1、使用@RequestMapping注解来映射请求的URL
	 * 2、使用ModelAndView类用来存储处理完后的结果数据，以及显示该数据的视图。
	 * 3、video为查询参数
	 */
	@RequestMapping(value = "/list")
	public ModelAndView list(Video video, HttpServletRequest request, HttpServletResponse response) {
		// ModelAndView构造方法可以指定返回的页面名称-videoPage
		ModelAndView mv = new ModelAndView("hou/videoPage");
		// 通过调取service获取健身视频列表
		List<Video> datalist = videoService.findList(video); 
		// 使用addObject()设置需要返回的值
		mv.addObject("datalist", datalist).addObject("param", video);
		// 让该ModelAndView返回Spring MVC框架去处理
		return mv;
	}

	/**
	 * 跳转新增/修改页面
	 */
	@RequestMapping(value = "form")
	public ModelAndView form(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("hou/videoForm");
		String id = request.getParameter("id");
		Video video = new Video();
		// 如果id不为空，则获取健身视频，从而进行修改
		if(StringUtils.isNotBlank(id)) {
    		video = videoService.get(id);
    	}
    	mv.addObject("video", video);
		return mv;
	}

	/**
	 * 新增/修改
	 */
	@RequestMapping(value = "save")
	public String save(@RequestParam("uploadfile")CommonsMultipartFile pdfFile, @RequestParam("uploadfile2")CommonsMultipartFile pdfFile2,HttpServletRequest request, Video video) {
		try {
			// 保存完整视频路径
			if(pdfFile != null && StringUtils.isNotBlank(pdfFile.getOriginalFilename())){ 
				String filename = pdfFile.getOriginalFilename();	
				//本地保存路径
				String fileLocalPath = basedir + filename;
				fileLocalPath = fileLocalPath.replaceAll("\\\\", "/").replaceAll("///", "/");
				//创建目录
				File saveDirFile = new File(fileLocalPath);
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}
			  	pdfFile.transferTo(saveDirFile);
				video.setFull(filename);
	        }
			// 保存部分视频路径
			if(pdfFile2 != null && StringUtils.isNotBlank(pdfFile2.getOriginalFilename())){ 
				String filename = pdfFile2.getOriginalFilename();	
				//本地保存路径
				String fileLocalPath = basedir + filename;
				fileLocalPath = fileLocalPath.replaceAll("\\\\", "/").replaceAll("///", "/");
				//创建目录
				File saveDirFile = new File(fileLocalPath);
				if (!saveDirFile.exists()) {
					saveDirFile.mkdirs();
				}
			  	pdfFile2.transferTo(saveDirFile);
				video.setPartial(filename);
	        }
			videoService.save(video);
		
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/graduate/video/list";
	}
	
	/**
	 * 删除
	 */
	@RequestMapping(value = "delete")
	public String delete(HttpServletRequest request) {
        videoService.delete(request.getParameter("id"));
        return "redirect:/graduate/video/list";
	}

	@RequestMapping(value = "/seeFile")
    public void seeFile(HttpServletRequest request, HttpServletResponse response) {
		User user = (User) request.getSession().getAttribute("currentUser");
		Video video = videoService.get(request.getParameter("id"));
		byte[] buffer = new byte[1024*8];
        FileInputStream fis = null;
        BufferedInputStream bis = null;
        OutputStream os = null;
    	try {
    		String fileName = video.getPartial();
    		if(user != null && ("2".equals(user.getAuth()) || "1".equals(request.getParameter("flag")))) {
    			fileName = video.getFull();
    		}
    		if(StringUtils.isNotBlank(request.getParameter("viewflag"))) {
    			video.setNum(Integer.parseInt(video.getNum())+1+"");
    			videoService.save(video);
    		}
    		/*if(request.getHeader("User-Agent").toUpperCase().indexOf("MSIE") > 0) {  
        		fileName = URLEncoder.encode(fileName, "UTF-8");  
        	} else {  
        		fileName = new String(fileName.getBytes("UTF-8"), "ISO8859-1");  
        	}*/
        	File file = new File(basedir+fileName);
        	response.setCharacterEncoding("UTF-8");	// 设置编码格式
        	response.setContentType("application/force-download");// 设置强制下载不打开
        	response.addHeader("Content-Disposition","attachment;fileName=" + fileName);// 设置文件名
            fis = new FileInputStream(file);
            bis = new BufferedInputStream(fis);
            os = response.getOutputStream();
            int i = bis.read(buffer);
            while (i != -1) {
                os.write(buffer, 0, i);
                i = bis.read(buffer);
            }
            bis.close();
            fis.close();
            os.flush();  
            os.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
    	
    }
	
	/**
	 * 批量删除
	 */
	@RequestMapping(value = "deleteCheck")
	public String deleteCheck(HttpServletRequest request) {
		String ids = request.getParameter("ids");
		String[] idsarr = ids.split(",");
		for(int i=0;i<idsarr.length;i++ ) {
			 videoService.delete(idsarr[i]);
		}
        return "redirect:/graduate/video/list";
	}
	
	@RequestMapping(value = "/index")
	public ModelAndView index(Video video, HttpServletRequest request, HttpServletResponse response) {
		ModelAndView mv = new ModelAndView("qian/videoIndex");
		List<Video> datalist = videoService.findList(video); 
		mv.addObject("datalist", datalist).addObject("param", video);
		return mv;
	}
}