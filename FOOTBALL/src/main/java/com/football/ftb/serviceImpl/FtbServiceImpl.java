package com.football.ftb.serviceImpl;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.net.http.HttpResponse.BodyHandlers;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.football.ftb.config.Configuration.Football;
import com.football.ftb.dao.FtbDao;
import com.football.ftb.service.FtbService;
import com.football.ftb.web.FtbController;

import ch.qos.logback.core.util.FileUtil;


@Service
public class FtbServiceImpl implements FtbService {
	
	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private FtbDao ftbDao;

	@Override
	@SuppressWarnings("unchecked")
	public Map<String, Object> sendFootballApi(String type, Map<String,Object> inParam) {
		Map<String, Object> resultMap = new HashMap<String, Object>();
		String url = Football.FOOTBALL_API_URL;
		
		if("matches".equals(type)) {
			url += String.valueOf(inParam.get("leagueId")) + "/matches?matchday=1";
		}
		
		LOGGER.debug("send url : {}", url);
		
		HttpClient client = HttpClient.newHttpClient();
		HttpRequest request = HttpRequest.newBuilder()
										 .GET()
		                                 .uri(URI.create(url))
		                                 .header("X-Auth-Token", Football.FOOTBALL_API_TOKEN)
		                                 .header("X-Unfold-Goals", "true")
		                                 .build();

		
		HttpResponse<String> response = null;
		try {
			response = client.send(request, BodyHandlers.ofString());
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		LOGGER.debug("response status {}", response.statusCode());
		LOGGER.debug("response body {}", response.body());  
		
		/* 결과 json string --> Map 변환 */
		try {
			resultMap = new ObjectMapper().readValue(response.body(), Map.class);
		} catch (Exception e) {
			e.printStackTrace();
		}
        
		return resultMap;
	}

	@Override
	public Map<String, Object> todayMatches(Map<String, Object> inParam) {
		// 결과값
		Map<String, Object> resultMap = null;
		
		/* 필드값 setting */
		inParam.put("id", "2021");
		
		/* matches API 호출 */
		resultMap = this.sendFootballApi("matches", inParam);
		
		return resultMap;
	}

}
