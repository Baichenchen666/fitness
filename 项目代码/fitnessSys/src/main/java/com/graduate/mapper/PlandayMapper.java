package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Planday;

/**
 * 每项健身计划DAO接口
 */
public interface PlandayMapper {

	public Planday get(@Param("id") String id);
	
	public List<Planday> findList(@Param("planday") Planday entity);
	
	public int insert(Planday entity);
	
	public int update(Planday entity);
	
	public int delete(@Param("id") String id);
	
}