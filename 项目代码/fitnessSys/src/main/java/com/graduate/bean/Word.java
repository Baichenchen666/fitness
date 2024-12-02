package com.graduate.bean;

/**
 * 留言信息Entity
 */
public class Word{
	
	private String id;
	private String content;		// 留言内容
	private String createtime;		// 留言时间
	private String createid;		// 留言人
	private String createname;		// 留言人
	private String reply;		// 回复内容
	private String replytime;		// 回复时间
	private String replyid;		// 回复人
	private String replyname;		// 回复人
	

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}
	
	public String getCreatetime() {
		return createtime;
	}

	public void setCreatetime(String createtime) {
		this.createtime = createtime;
	}
	
	public String getCreateid() {
		return createid;
	}

	public void setCreateid(String createid) {
		this.createid = createid;
	}
	
	public String getCreatename() {
		return createname;
	}

	public void setCreatename(String createname) {
		this.createname = createname;
	}
	
	public String getReply() {
		return reply;
	}

	public void setReply(String reply) {
		this.reply = reply;
	}
	
	public String getReplytime() {
		return replytime;
	}

	public void setReplytime(String replytime) {
		this.replytime = replytime;
	}
	
	public String getReplyid() {
		return replyid;
	}

	public void setReplyid(String replyid) {
		this.replyid = replyid;
	}
	
	public String getReplyname() {
		return replyname;
	}

	public void setReplyname(String replyname) {
		this.replyname = replyname;
	}
	
}