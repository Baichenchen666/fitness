package com.graduate.mapper;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.graduate.bean.User;

/**
 * 用户信息DAO接口
 */
public interface UserMapper {

	public User get(@Param("id") String id);
	
	public List<User> findList(@Param("user") User entity);
	
	public int insert(User entity);
	
	public int update(User entity);
	
	public int delete(@Param("id") String id);
	
    public List<User> identity(@Param("user") User entity);
}