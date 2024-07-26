package com.git.semi.s3Test.controller;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.git.semi.util.s3.S3ImageService;

@Controller
@RequestMapping("/s3/")
public class S3TestController {

    // 생성자 주입을 위한 필드(인터페이스 선언)
    private final S3ImageService s3ImageService;

    @Autowired
    public S3TestController(S3ImageService s3ImageService) {
        this.s3ImageService = s3ImageService;
    }

    /**
     * 단순 포워딩
     * @return : s3Test.jsp
     */
    @RequestMapping("uploadS3Form.do")
    public String uploadS3Form() {
        return "/s3Test/uploadS3Test";
    }


    /**
     * S3에 이미지 업로드 test api
     */
    @RequestMapping(value="uploadS3.do", produces="application/json; charset=utf-8;")
    @ResponseBody
    public String uploadS3(MultipartFile image) {

        // s3에 업로드 후 url 받아오기.
        String imageUrl = s3ImageService.uploadS3(image);


       
        
        JSONObject json = new JSONObject();
		json.put("imageUrl", imageUrl); // {"imageUrl": imageUrl }
		
		return json.toString();
    }


}
