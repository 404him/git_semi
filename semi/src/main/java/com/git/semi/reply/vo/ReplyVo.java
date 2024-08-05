package com.git.semi.reply.vo;

public class ReplyVo {
	
	int rpy_idx;
	String rpy_content;
	String rpy_regdate;
	String rpy_modify;
	int mem_idx;
	int news_idx;
	String mem_nickname;
	String mem_img_url;
	
	
	
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_img_url() {
		return mem_img_url;
	}
	public void setMem_img_url(String mem_img_url) {
		this.mem_img_url = mem_img_url;
	}
	public int getRpy_idx() {
		return rpy_idx;
	}
	public void setRpy_idx(int rpy_idx) {
		this.rpy_idx = rpy_idx;
	}
	public String getRpy_content() {
		return rpy_content;
	}
	public void setRpy_content(String rpy_content) {
		this.rpy_content = rpy_content;
	}
	public String getRpy_regdate() {
		return rpy_regdate;
	}
	public void setRpy_regdate(String rpy_regdate) {
		this.rpy_regdate = rpy_regdate;
	}
	public String getRpy_modify() {
		return rpy_modify;
	}
	public void setRpy_modify(String rpy_modify) {
		this.rpy_modify = rpy_modify;
	}
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public int getNews_idx() {
		return news_idx;
	}
	public void setNews_idx(int news_idx) {
		this.news_idx = news_idx;
	}
	
}
