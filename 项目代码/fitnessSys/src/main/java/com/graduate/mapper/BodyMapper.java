package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Body;

/**
 * 会员身体情况记录表DAO接口
 */
public interface BodyMapper {

	public Body get(@Param("id") String id);
	
	public List<Body> findList(@Param("body") Body entity);
	
	public int insert(Body entity);
	
	public int update(Body entity);
	
	public int delete(@Param("id") String id);
	
}