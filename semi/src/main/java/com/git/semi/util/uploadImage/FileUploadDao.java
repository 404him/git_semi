package com.git.semi.util.uploadImage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class FileUploadDao {

    private final SqlSession sqlSession;

    @Autowired
    public FileUploadDao(SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }


    // db에 이미지 url 저장
    public int save(String imageUrl, int news_idx) {
    	Map<String, Object> map = new HashMap<>();
    	map.put("imageUrl", imageUrl);
    	map.put("news_idx", news_idx);
    	
        return this.sqlSession.insert("s3attechment.s3attechment_insert",map);
    }

    // db에 이미지 삭제(fileUrl)
    public void delete(String fileUrl) {
        this.sqlSession.delete("s3attechment.s3attechment_delete_fileUrl",fileUrl);
    }

    // db에 이미지 삭제(fileNo)
    public int deleteByNewsIdx(int news_idx) {
        return this.sqlSession.delete("s3attechment.s3attechment_delete_news_idx", news_idx);
    }

    public List<String> select(int news_idx) {
        return this.sqlSession.selectList("s3attechment.s3attechment_select_news_idx", news_idx);
    }
}
