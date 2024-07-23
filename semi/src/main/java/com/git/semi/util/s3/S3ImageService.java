package com.git.semi.util.s3;

import org.springframework.web.multipart.MultipartFile;

import java.util.List;

public interface S3ImageService {

    // 단일 S3 이미지 업로드.
    String uploadS3(MultipartFile image);

    // 다중 S3 이미지 업로드.
    List<String> uploadS3(List<MultipartFile> multipartFiles);

    // 단일 S3 이미지 삭제.
    void deleteImageFromS3(String imageAddress);

    // 다중 S3 이미지 삭제.
    void deleteImageFromS3(List<String> imaStringList);


}
