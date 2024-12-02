package com.graduate.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;
import com.graduate.bean.Body;
import com.graduate.mapper.BodyMapper;

/**
 * 会员身体情况记录表Service
 */
@Service
public class BodyService{

	@Autowired
    private BodyMapper bodyMapper;
    
    // 通过id获取Body
	public Body get(String id) {
		return bodyMapper.get(id);
	}
	
	// 通过参数获取Body列表
	public List<Body> findList(Body body) {
		return bodyMapper.findList(body);
	}
	
	public int save(Body body) {
		if(StringUtils.isBlank(body.getId())) {
			// 当id为空时，操作为新增，获取唯一标识id
    		body.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		return bodyMapper.insert(body);
    	} else {
    		// 当id不为空是，操作为修改
    		return bodyMapper.update(body);
    	}
	}
	
	public int delete(String id) {
		return bodyMapper.delete(id);
	}
	
}