package com.git.semi.util.uploadImage;

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
    public int save(String fileUrl) {

        return this.sqlSession.insert("s3attechment.s3attechment_insert",fileUrl);
    }

    // db에 이미지 삭제(fileUrl)
    public void delete(String fileUrl) {
        this.sqlSession.delete("s3attechment.s3attechment_delete_fileUrl",fileUrl);
    }

    // db에 이미지 삭제(fileNo)
    public int delete(int fileNo) {
        return this.sqlSession.delete("s3attechment.s3attechment_delete_fileNo", fileNo);
    }

    public String select(int fileNo) {
        return this.sqlSession.selectOne("s3attechment.s3attechment_select_fileNo", fileNo);
    }
}
