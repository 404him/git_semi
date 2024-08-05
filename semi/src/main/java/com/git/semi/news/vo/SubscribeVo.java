package com.git.semi.news.vo;

public class SubscribeVo {
	
	int subscribe_idx;
	int reporter_idx;
    int mem_idx;


    public int getSubscribe_idx() {
		return subscribe_idx;
	}

	public void setSubscribe_idx(int subscribe_idx) {
		this.subscribe_idx = subscribe_idx;
	}

    public int getReporter_idx() {
		return reporter_idx;
	}

	public void setReporter_idx(int reporter_idx) {
		this.reporter_idx = reporter_idx;
	}

	public int getMem_idx() {
        return mem_idx;
    }

    public void setMem_idx(int mem_idx) {
        this.mem_idx = mem_idx;
    }
}
