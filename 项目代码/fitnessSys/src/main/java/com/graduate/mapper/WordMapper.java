package com.graduate.mapper;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import com.graduate.bean.Word;

/**
 * 留言信息DAO接口
 */
public interface WordMapper {

	public Word get(@Param("id") String id);
	
	public List<Word> findList(@Param("word") Word entity);
	
	public int insert(Word entity);
	
	public int update(Word entity);
	
	public int reply(Word entity);
	
	public int delete(@Param("id") String id);
	
}