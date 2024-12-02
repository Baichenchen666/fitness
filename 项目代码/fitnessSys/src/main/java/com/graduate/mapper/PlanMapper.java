package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Plan;

/**
 * 健身计划DAO接口
 */
public interface PlanMapper {

	public Plan get(@Param("id") String id);
	
	public List<Plan> findList(@Param("plan") Plan entity);
	
	public int insert(Plan entity);
	
	public int update(Plan entity);
	
	public int delete(@Param("id") String id);
	
}