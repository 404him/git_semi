package com.git.semi.util.openApi;

import com.fasterxml.jackson.core.JsonParser;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;


@Component
public class NewsApiService {


    private final String BASE_URL = "https://newsapi.org/v2/top-headlines?country=kr";

    private final String API_KEY = "3bcc3f482f5f4563b33d86d397b8e858";


    public List<NewsApiVo> getTopHeadLineNews() {

        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Content-Type", "application/json");

        String url = BASE_URL + "&apikey=" + API_KEY;

        HttpEntity request = new HttpEntity(headers);
        ResponseEntity<String> response = restTemplate.exchange(url, HttpMethod.GET, request, String.class);


        JSONObject jsonObject = new JSONObject(response.getBody());

        JSONArray articles = (JSONArray) jsonObject.get("articles");

        System.out.println(articles);

        List<NewsApiVo> list = new ArrayList<>();

        for (Object o : articles) {
            JSONObject article = (JSONObject) o;
            NewsApiVo vo = new NewsApiVo();
            vo.setAuthor(article.get("author").toString());
            vo.setTitle(article.get("title").toString());
            vo.setDescription(article.get("description").toString());
            vo.setUrl(article.get("url").toString());
            vo.setUrlToImage(article.get("urlToImage").toString());
            vo.setPublishedAt(article.get("publishedAt").toString());

            list.add(vo);
        }

        return list;

    }
}
