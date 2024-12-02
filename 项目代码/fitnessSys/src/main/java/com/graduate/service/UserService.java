package com.graduate.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;

import com.graduate.bean.User;
import com.graduate.mapper.UserMapper;

/**
 * 用户信息Service
 */
@Service
public class UserService{

	@Autowired
    private UserMapper userMapper;
    
	public User get(String id) {
		return userMapper.get(id);
	}
	
	public List<User> findList(User user) {
		return userMapper.findList(user);
	}
	
	public String save(User user) {
		if(StringUtils.isBlank(user.getId())) {
    		user.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		userMapper.insert(user);
    		return user.getId();
    	} else {
    		userMapper.update(user);
    		return user.getId();
    	}
	}
	
	public int delete(String id) {
		return userMapper.delete(id);
	}
	
	public User identity(User user) {
    	List<User> list = userMapper.identity(user);
    	if(list != null && !list.isEmpty()) {
    		return list.get(0);
    	}
    	return new User();
    }
}