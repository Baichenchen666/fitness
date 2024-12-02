package com.graduate.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;
import com.graduate.bean.Plan;
import com.graduate.mapper.PlanMapper;

/**
 * 健身计划Service
 */
@Service
public class PlanService{

	@Autowired
    private PlanMapper planMapper;
    
    // 通过id获取Plan
	public Plan get(String id) {
		return planMapper.get(id);
	}
	
	// 通过参数获取Plan列表
	public List<Plan> findList(Plan plan) {
		return planMapper.findList(plan);
	}
	
	public int save(Plan plan) {
		if(StringUtils.isBlank(plan.getId())) {
			// 当id为空时，操作为新增，获取唯一标识id
    		plan.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		return planMapper.insert(plan);
    	} else {
    		// 当id不为空是，操作为修改
    		return planMapper.update(plan);
    	}
	}
	
	public int delete(String id) {
		return planMapper.delete(id);
	}
	
}