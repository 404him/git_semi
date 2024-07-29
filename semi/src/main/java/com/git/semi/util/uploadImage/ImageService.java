package com.git.semi.util.uploadImage;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface ImageService {

    /**
     * DB Service
     */
    // db에 이미지 저장(fileUrl)
    int save(String fileUrl);

    // db에 이미지 삭제(fileUrl)
    void deleteByUrl(String fileUrl);

    // db에 이미지 삭제(PK)
    int deleteById(int fileNo);

    // db에 이미지 1개 조회(PK)
    String getFileUrlById(int fileNo);

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
