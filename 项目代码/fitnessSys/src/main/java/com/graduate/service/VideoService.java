package com.graduate.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;

import com.graduate.bean.Video;
import com.graduate.mapper.VideoMapper;

/**
 * 健身视频Service
 */
@Service
public class VideoService{

	@Autowired
    private VideoMapper videoMapper;
    
    // 通过id获取Video
	public Video get(String id) {
		return videoMapper.get(id);
	}
	
	// 通过参数获取Video列表
	public List<Video> findList(Video video) {
		return videoMapper.findList(video);
	}
	
	public int save(Video video) {
		if(StringUtils.isBlank(video.getId())) {
			// 当id为空时，操作为新增，获取唯一标识id
    		video.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		video.setNum("0");
    		return videoMapper.insert(video);
    	} else {
    		// 当id不为空是，操作为修改
    		return videoMapper.update(video);
    	}
	}
	
	public int delete(String id) {
		return videoMapper.delete(id);
	}
	
	// 通过参数获取Video列表
	public List<Video> total(Video video) {
		List<Video> datalist = new ArrayList<Video>();
		List<Video> list = videoMapper.findList(video);
		for(Video vi : list) {
			Video data = new Video();
			data.setNum(vi.getNum());
			data.setTitle(vi.getTitle());
			datalist.add(data);
		}
		return datalist;
	}
}