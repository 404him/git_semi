package com.git.semi.member.vo;

public class MemberVo {
	
	int mem_idx;
	String mem_id;
	String mem_pwd;
	String mem_name;
	String mem_nickname;
	String mem_phone;
	String mem_img_url;
	String mem_zipcode;
	String mem_addr;
	String mem_birth;
	int mem_lockcount;
	String mem_use;
	String mem_grade;
	String mem_regdate;
	
	
	
	public int getMem_idx() {
		return mem_idx;
	}
	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}
	public String getMem_id() {
		return mem_id;
	}
	public void setMem_id(String mem_id) {
		this.mem_id = mem_id;
	}
	public String getMem_pwd() {
		return mem_pwd;
	}
	public void setMem_pwd(String mem_pwd) {
		this.mem_pwd = mem_pwd;
	}
	public String getMem_name() {
		return mem_name;
	}
	public void setMem_name(String mem_name) {
		this.mem_name = mem_name;
	}
	public String getMem_nickname() {
		return mem_nickname;
	}
	public void setMem_nickname(String mem_nickname) {
		this.mem_nickname = mem_nickname;
	}
	public String getMem_phone() {
		return mem_phone;
	}
	public void setMem_phone(String mem_phone) {
		this.mem_phone = mem_phone;
	}
	public String getMem_img_url() {
		return mem_img_url;
	}
	public void setMem_img_url(String mem_img_url) {
		this.mem_img_url = mem_img_url;
	}
	public String getMem_zipcode() {
		return mem_zipcode;
	}
	public void setMem_zipcode(String mem_zipcode) {
		this.mem_zipcode = mem_zipcode;
	}
	public String getMem_addr() {
		return mem_addr;
	}
	public void setMem_addr(String mem_addr) {
		this.mem_addr = mem_addr;
	}
	public String getMem_birth() {
		return mem_birth;
	}
	public void setMem_birth(String mem_birth) {
		this.mem_birth = mem_birth;
	}
	public int getMem_lockcount() {
		return mem_lockcount;
	}
	public void setMem_lockcount(int mem_lockcount) {
		this.mem_lockcount = mem_lockcount;
	}
	public String getMem_use() {
		return mem_use;
	}
	public void setMem_use(String mem_use) {
		this.mem_use = mem_use;
	}
	public String getMem_grade() {
		return mem_grade;
	}
	public void setMem_grade(String mem_grade) {
		this.mem_grade = mem_grade;
	}
	public String getMem_regdate() {
		return mem_regdate;
	}
	public void setMem_regdate(String mem_regdate) {
		this.mem_regdate = mem_regdate;
	}
	@Override
	public String toString() {
		return "MemberVo [mem_idx=" + mem_idx + ", mem_id=" + mem_id + ", mem_pwd=" + mem_pwd + ", mem_name=" + mem_name
				+ ", mem_nickname=" + mem_nickname + ", mem_phone=" + mem_phone + ", mem_img_url=" + mem_img_url
				+ ", mem_zipcode=" + mem_zipcode + ", mem_addr=" + mem_addr + ", mem_birth=" + mem_birth
				+ ", mem_lockcount=" + mem_lockcount + ", mem_use=" + mem_use + ", mem_grade=" + mem_grade
				+ ", mem_regdate=" + mem_regdate + "]";
	}

	
	
	
	
	
}
