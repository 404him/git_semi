package com.git.semi.util.openApi;

import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.List;
import java.util.Map;


@Component
public class NewsApiService {


    private final String BASE_URL = "https://newsapi.org/v2/top-headlines?country=kr";

    private final String API_KEY = "3bcc3f482f5f4563b33d86d397b8e858";



    public void getTopHeadLineNews() {

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("x-api-key", API_KEY);
        headers.add("Content-Type","application/json");

        HttpEntity request = new HttpEntity(headers);
        ResponseEntity<JSONObject> response = restTemplate.exchange(BASE_URL, HttpMethod.GET, request, JSONObject.class);
        JSONObject resultMap = response.getBody();

        System.out.println(response.getBody().toString());
        System.out.println("totalResults = " +  resultMap.toString());

    }


}
