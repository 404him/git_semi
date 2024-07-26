package com.git.semi.news.vo;

public class NewsVo {

    int news_idx;
    String news_title;
    String news_thumbnail_image;
    String news_content;
    int news_count;
    String news_createAt;
    String news_updateAt;
    int mem_idx;
    String mem_name;
    int category_idx;
    String category_name;
    int news_like_count;


    public String getNews_thumbnail_image() {
        return news_thumbnail_image;
    }

    public void setNews_thumbnail_image(String news_thumbnail_image) {
        this.news_thumbnail_image = news_thumbnail_image;
    }

    public String getMem_name() {
        return mem_name;
    }

    public void setMem_name(String mem_name) {
        this.mem_name = mem_name;
    }


    public int getNews_like_count() {
        return news_like_count;
    }

    public void setNews_like_count(int news_like_count) {
        this.news_like_count = news_like_count;
    }

    public int getNews_idx() {
        return news_idx;
    }

    public void setNews_idx(int news_idx) {
        this.news_idx = news_idx;
    }

    public String getNews_title() {
        return news_title;
    }

    public void setNews_title(String news_title) {
        this.news_title = news_title;
    }

    public String getNews_content() {
        return news_content;
    }

    public void setNews_content(String news_content) {
        this.news_content = news_content;
    }

    public int getNews_count() {
        return news_count;
    }

    public void setNews_count(int news_count) {
        this.news_count = news_count;
    }

    public String getNews_createAt() {
        return news_createAt;
    }

    public void setNews_createAt(String news_createAt) {
        this.news_createAt = news_createAt;
    }

    public String getNews_updateAt() {
        return news_updateAt;
    }

    public void setNews_updateAt(String news_updateAt) {
        this.news_updateAt = news_updateAt;
    }

    public int getMem_idx() {
        return mem_idx;
    }

    public void setMem_idx(int mem_idx) {
        this.mem_idx = mem_idx;
    }

    public int getCategory_idx() {
        return category_idx;
    }

    public void setCategory_idx(int category_idx) {
        this.category_idx = category_idx;
    }

    public String getCategory_name() {
        return category_name;
    }

    public void setCategory_name(String category_name) {
        this.category_name = category_name;
    }
}
