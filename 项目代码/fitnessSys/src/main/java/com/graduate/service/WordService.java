package com.graduate.service;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.apache.commons.lang3.StringUtils;
import com.graduate.bean.Word;
import com.graduate.mapper.WordMapper;

/**
 * 留言信息Service
 */
@Service
public class WordService{

	@Autowired
    private WordMapper wordMapper;
    
    // 通过id获取Word
	public Word get(String id) {
		return wordMapper.get(id);
	}
	
	// 通过参数获取Word列表
	public List<Word> findList(Word word) {
		return wordMapper.findList(word);
	}
	
	public int save(Word word) {
		if(StringUtils.isBlank(word.getId())) {
			// 当id为空时，操作为新增，获取唯一标识id
    		word.setId(UUID.randomUUID().toString().replace("-", "").toLowerCase());
    		return wordMapper.insert(word);
    	} else {
    		// 当id不为空是，操作为修改
    		return wordMapper.update(word);
    	}
	}
	
	public int delete(String id) {
		return wordMapper.delete(id);
	}
	
	public int reply(Word word) {
		return wordMapper.reply(word);
	}
	
}