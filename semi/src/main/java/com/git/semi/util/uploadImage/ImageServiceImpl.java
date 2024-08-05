package com.git.semi.util.uploadImage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.amazonaws.services.s3.AmazonS3;

@Service
public class ImageServiceImpl extends S3ImageServiceImpl implements ImageService {

    private final FileUploadDao fileUploadDao;

    @Autowired
    public ImageServiceImpl(FileUploadDao fileUploadDao, AmazonS3 amazonS3) {
        super(amazonS3);
        System.out.println("-- ImageServiceImpl --");
        this.fileUploadDao = fileUploadDao;
    }

    // db에 파일 저장
    public int save(String fileUrl, int news_idx) {
        return this.fileUploadDao.save(fileUrl, news_idx);
    }

    // db에 파일 삭제(fileUrl)
    public void deleteByUrl(String fileUrl) {
        this.fileUploadDao.delete(fileUrl);
    }

    // db에 파일 삭제(fk)
    public int deleteByNewsIdx(int news_idx) {
        return this.fileUploadDao.deleteByNewsIdx(news_idx);
    }

    // db에 파일 조회(pk)
    public List<String> getFileUrlByNewsIdx(int news_idx) {
        return this.fileUploadDao.select(news_idx);
    }


}
