package com.graduate.service;

import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.graduate.bean.Planday;
import com.graduate.mapper.PlandayMapper;

/**
 * 每项健身计划Service
 */
@Service
public class PlandayService{

	@Autowired
    private PlandayMapper plandayMapper;
    
    // 通过id获取Planday
	public Planday get(String id) {
		return plandayMapper.get(id);
	}
	
	// 通过参数获取Planday列表
	public List<Planday> findList(Planday planday) {
		return plandayMapper.findList(planday);
	}
	
	public int save(Planday planday) {
		if(StringUtils.isBlank(planday.getId())) {
			// 当id为空时，操作为新增，获取唯一标识id
    		planday.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		return plandayMapper.insert(planday);
    	} else {
    		// 当id不为空是，操作为修改
    		return plandayMapper.update(planday);
    	}
	}
	
	public int delete(String id) {
		return plandayMapper.delete(id);
	}
	
	// 通过参数获取Planday列表
	public List<Planday> findList1(Planday planday) {
		List<Planday> datalist = new ArrayList<Planday>();
		List<Planday> list = plandayMapper.findList(planday);
		for(int i=0;i<list.size();i++) {
			Planday pd = list.get(i);
			datalist.add(pd);
			if(i==list.size()-1 || !pd.getDay().equals(list.get(i+1).getDay())) {
				datalist.add(new Planday());
			}
		}
		return datalist;
	}
}