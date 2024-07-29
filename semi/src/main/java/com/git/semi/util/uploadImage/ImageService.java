package com.git.semi.util.uploadImage;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ImageService {

    /**
     * DB Service
     */
    // db에 이미지 저장(fileUrl)
    int save(String imageUrl,int news_idx);

    // db에 이미지 삭제(fileUrl)
    void deleteByUrl(String fileUrl);

    // 이미지 db에 이미지 삭제(FK)
    int deleteByNewsIdx(int news_idx);

    // db에 뉴스 이미지등 조회(FK)
    List<String> getFileUrlByNewsIdx(int news_idx);

    /**
     * S3 Service
     */
    // S3에 이미지 단일 업로드(image)
    String uploadS3(MultipartFile image);

    // S3에 이미지 다중 업로드(images)
    List<String> uploadS3(List<MultipartFile> images);

    // S3에 이미지 삭제(imageUrl)
    void deleteImageFromS3(String imageUrl);

}
