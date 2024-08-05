package com.git.semi.report.vo;

public class ReportVo {
	
	int  rep_idx;
	int rep_reporter_idx;
	String rep_type;
	int news_idx;
	int mem_idx;
	int rpy_idx;
	int idx;	// 타입에 따른 idx
	int count;	// 타입에 따른 idx의 갯수
	
	
	// 기본 생성자
	public ReportVo() {
		
	}
	
	//
	public ReportVo(int news_idx, int mem_idx, int rpy_idx) {
		super();
		this.news_idx = news_idx;
		this.mem_idx = mem_idx;
		this.rpy_idx = rpy_idx;
	}
	
	
	

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public int getRep_idx() {
		return rep_idx;
	}

	public void setRep_idx(int rep_idx) {
		this.rep_idx = rep_idx;
	}

	public int getRep_reporter_idx() {
		return rep_reporter_idx;
	}

	public void setRep_reporter_idx(int rep_reporter_idx) {
		this.rep_reporter_idx = rep_reporter_idx;
	}

	public String getRep_type() {
		return rep_type;
	}

	public void setRep_type(String rep_type) {
		this.rep_type = rep_type;
	}

	public int getNews_idx() {
		return news_idx;
	}

	public void setNews_idx(int news_idx) {
		this.news_idx = news_idx;
	}

	public int getMem_idx() {
		return mem_idx;
	}

	public void setMem_idx(int mem_idx) {
		this.mem_idx = mem_idx;
	}

	public int getRpy_idx() {
		return rpy_idx;
	}

	public void setRpy_idx(int rpy_idx) {
		this.rpy_idx = rpy_idx;
	}



	
	
	
	
	
	
	
	
	
	
	
	

}
