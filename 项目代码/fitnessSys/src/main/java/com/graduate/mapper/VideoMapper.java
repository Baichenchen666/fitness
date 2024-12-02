package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Video;

/**
 * 健身视频DAO接口
 */
public interface VideoMapper {

	public Video get(@Param("id") String id);
	
	public List<Video> findList(@Param("video") Video entity);
	
	public int insert(Video entity);
	
	public int update(Video entity);
	
	public int delete(@Param("id") String id);
	
}