package com.football.ftb.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.multipart.MultipartHttpServletRequest;

public interface FtbService {

	Map<String,Object> sendFootballApi(String type, Map<String,Object> inParam);

	Map<String, Object> todayMatches(Map<String, Object> inParam);

}
