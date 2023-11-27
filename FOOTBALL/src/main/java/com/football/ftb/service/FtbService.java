package com.football.ftb.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.fasterxml.jackson.core.JsonProcessingException;

public interface FtbService {

	Map<String,Object> sendFootballApi(String type, Map<String,Object> inParam);

	int insertMatchesL(Map<String, Object> inParam);

	Map<String, Object> selectMatches(Map<String, Object> inParam) throws Exception;

}
