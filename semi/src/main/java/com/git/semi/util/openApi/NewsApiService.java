package com.git.semi.util.openApi;

import org.json.JSONArray;
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
        headers.add("Content-Type","application/json");

        String url = BASE_URL+"&apikey="+API_KEY;

        HttpEntity request = new HttpEntity(headers);
        ResponseEntity<Map> response = restTemplate.exchange(url, HttpMethod.GET, request, Map.class);
        Map resultMap = response.getBody();
        List<Object> articles = (List<Object>) resultMap.get("articles");

        // 1.반복문 돌려서 vo에 set하고 다 set 하면 list에 add 하기.
        // 2. jackson readTree mapper 로 해보기.


        System.out.println(articles.toString());
        System.out.println("resultMap = " +  resultMap.toString());

    }


}
