package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Food;

/**
 * 食物三大元素对照表DAO接口
 */
public interface FoodMapper {

	public Food get(@Param("id") String id);
	
	public List<Food> findList(@Param("food") Food entity);
	
	public int insert(Food entity);
	
	public int update(Food entity);
	
	public int delete(@Param("id") String id);
	
}