package com.graduate.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduate.bean.Coach;
import com.graduate.mapper.CoachMapper;

/**
 * 健身教练团体Service
 */
@Service
public class CoachService{

	@Autowired
    private CoachMapper coachMapper;
    
    // 通过id获取Coach
	public Coach get(String id) {
		return coachMapper.get(id);
	}
	
	// 通过参数获取Coach列表
	public List<Coach> findList(Coach coach) {
		return coachMapper.findList(coach);
	}
	
	public int save(Coach coach) {
		if(StringUtils.isBlank(coach.getId())) {
			// 当id为空时，操作为新增，获取唯一标识id
    		coach.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		coach.setNum("0");
    		return coachMapper.insert(coach);
    	} else {
    		// 当id不为空是，操作为修改
    		return coachMapper.update(coach);
    	}
	}
	
	public int delete(String id) {
		return coachMapper.delete(id);
	}
	
	// 通过参数获取Coach列表
	public List<Coach> total(Coach coach) {
		List<Coach> datalist = new ArrayList<Coach>();
		List<Coach> list = coachMapper.findList(coach);
		for(Coach co : list) {
			Coach data = new Coach();
			data.setNum(co.getNum());
			data.setName(co.getName());
			datalist.add(data);
		}
		return datalist;
	}
}