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

import org.apache.commons.collections4.MapUtils;
import org.apache.ibatis.util.MapUtil;
import org.apache.tomcat.util.http.fileupload.FileUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.football.ftb.config.Configuration.Football;
import com.football.ftb.constants.FootballConstants;
import com.football.ftb.dao.FtbDao;
import com.football.ftb.service.FtbService;
import com.football.ftb.web.FtbController;
import com.mysql.cj.x.protobuf.MysqlxCrud.Collection;

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
		
		// MATCHES
		if(FootballConstants.MATCHES.equals(type)) {
			String param = "dateFrom=" + String.valueOf(inParam.get("today")) + "&dateTo=" + String.valueOf(inParam.get("today"));
			url += String.valueOf(inParam.get("leagueId")) + "/matches?" + param;
		} 
		// STANDINGS
		else if(FootballConstants.STANDINGS.equals(type)) {
			url += String.valueOf(inParam.get("leagueId")) + "/standings";
		}
		// SCORERS
		else if(FootballConstants.SCORERS.equals(type)) {
			url += String.valueOf(inParam.get("leagueId")) + "/scorers?limit=20";
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
	public int insertMatchesL(Map<String, Object> inParam) {
		return ftbDao.insertMatchesL(inParam);
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> selectMatches(Map<String, Object> inParam) throws Exception {
		/* 해당 일정 DB조회 */
		Map<String,Object> resultMap = ftbDao.selectMatchesList(inParam);
		
		// DB에 없을경우 조회
		if(MapUtils.isEmpty(resultMap)) {
			
			/* matches API 호출 */
			resultMap = this.sendFootballApi(FootballConstants.MATCHES, inParam);
			
			/* 해당 결과 저장 */
			// Football-data.org에서 free티어는 분당 12회 호출이 가능해서 이를 최소하기위해 저장해둠
			// 스케줄러를 통해 해당 데이터 관리 
			Map<String,Object> paramMap = new HashMap<String, Object>();
			paramMap.put("LEAGUE_ID", inParam.get("leagueId"));
			paramMap.put("MATCH_DATE", inParam.get("today")); 
			paramMap.put("MATCH_CN", new ObjectMapper().writeValueAsString(resultMap)); 
			ftbDao.insertMatchesL(paramMap);
			 
		} 
		// 존재하면 가져와서 보여
		else {
			String matchCn = String.valueOf(resultMap.get("MATCH_CN"));
			resultMap = new ObjectMapper().readValue(matchCn, Map.class);
		}
		
		return resultMap;
		
	}

	@Override
	public void deleteFootballData() {
		ftbDao.deleteFootballData();
	}

	@SuppressWarnings("unchecked")
	@Override
	public Map<String, Object> leagueStandings(Map<String, Object> inParam) throws JsonProcessingException {
		/* 해당 일정 DB조회 */
		Map<String,Object> resultMap = null;
		//Map<String,Object> resultMap = ftbDao.selectleagueStandings(inParam);
		
		// DB에 없을경우 조회
		if(MapUtils.isEmpty(resultMap)) {
			
			/* standings API 호출 */
			resultMap = this.sendFootballApi(FootballConstants.STANDINGS, inParam);
			
			/* 해당 결과 저장 */
			//Map<String,Object> paramMap = new HashMap<String, Object>();
			//paramMap.put("LEAGUE_ID", inParam.get("leagueId"));
			//paramMap.put("MATCH_DATE", inParam.get("today")); 
			//paramMap.put("MATCH_CN", new ObjectMapper().writeValueAsString(resultMap)); 
			//ftbDao.insertMatchesL(paramMap);
			 
		} 
		// 존재하면 가져와서 보여
		else {
			//String matchCn = String.valueOf(resultMap.get("MATCH_CN"));
			//resultMap = new ObjectMapper().readValue(matchCn, Map.class);
		}
		
		return resultMap;
	}

	@Override
	public Map<String, Object> getTopScorers(Map<String, Object> inParam) {
		/* 해당 일정 DB조회 */
		Map<String,Object> resultMap = null;
		//Map<String,Object> resultMap = ftbDao.selectleagueStandings(inParam);
		
		// DB에 없을경우 조회
		if(MapUtils.isEmpty(resultMap)) {
			
			/* standings API 호출 */
			resultMap = this.sendFootballApi(FootballConstants.SCORERS, inParam);
			
			/* 해당 결과 저장 */
			//Map<String,Object> paramMap = new HashMap<String, Object>();
			//paramMap.put("LEAGUE_ID", inParam.get("leagueId"));
			//paramMap.put("MATCH_DATE", inParam.get("today")); 
			//paramMap.put("MATCH_CN", new ObjectMapper().writeValueAsString(resultMap)); 
			//ftbDao.insertMatchesL(paramMap);
			 
		} 
		// 존재하면 가져와서 보여
		else {
			//String matchCn = String.valueOf(resultMap.get("MATCH_CN"));
			//resultMap = new ObjectMapper().readValue(matchCn, Map.class);
		}
		
		return resultMap;
	}

}
