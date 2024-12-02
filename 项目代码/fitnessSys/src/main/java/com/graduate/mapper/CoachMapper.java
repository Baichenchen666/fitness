package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Coach;

/**
 * 健身教练团体DAO接口
 */
public interface CoachMapper {

	public Coach get(@Param("id") String id);
	
	public List<Coach> findList(@Param("coach") Coach entity);
	
	public int insert(Coach entity);
	
	public int update(Coach entity);
	
	public int delete(@Param("id") String id);
	
}