package com.git.semi.util.uploadImage;

import com.amazonaws.services.s3.AmazonS3;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
    public int save(String fileUrl) {
        return this.fileUploadDao.save(fileUrl);
    }

    // db에 파일 삭제(fileUrl)
    public void deleteByUrl(String fileUrl) {
        this.fileUploadDao.delete(fileUrl);
    }

    // db에 파일 삭제(pk)
    public int deleteById(int fileNo) {
        return this.fileUploadDao.delete(fileNo);
    }

    // db에 파일 조회(pk)
    public String getFileUrlById(int fileNo) {
        return this.fileUploadDao.select(fileNo);
    }

}
