package com.football.ftb.service;

import java.util.Map;

import com.fasterxml.jackson.core.JsonProcessingException;



public interface FtbService {

	/**
	 * 
	 * @param type(API 종류) 
	 * @param inParam(통신에 필요한 파라미터)
	 * @return 경기일정 
	 */
	Map<String,Object> sendFootballApi(String type, Map<String,Object> inParam);

	/**
	 * API 경기일정 결과 저
	 * @param inParam(리그 키값, 경기 일정, 해당날짜)
	 * @return
	 */
	int insertMatchesL(Map<String, Object> inParam);

	/**
	 * 경기 일정 가져오기 
	 * 1. 해당 날짜 DB 조회 
	 * 2. 존재하면 가져와서 보여줌 
	 * 3. 없으면 API 통신 및 DB 저장 
	 * @param today(날짜)
	 * @param leageId(리그 키값)
	 * @return 해당하는 경기 일정
	 */	
	Map<String, Object> selectMatches(Map<String, Object> inParam) throws Exception;

	/**
	 * 경기일정 데이터 삭제 배치
	 */
	void deleteFootballData();

	/**
	 * 리그 순위 가져오기
	 * 1. 해당 날짜 DB 조회 
	 * 2. 존재하면 가져와서 보여줌 
	 * 3. 없으면 API 통신 및 DB 저장 
	 * @param leageId(리그 키값)
	 * @return 해당하는 리그 순위
	 * @throws JsonProcessingException 
	 */	
	Map<String, Object> leagueStandings(Map<String, Object> inParam) throws JsonProcessingException;

	/**
	 * 개인 득점 순위 가져오기
	 * 1. 해당 날짜 DB 조회 
	 * 2. 존재하면 가져와서 보여줌 
	 * 3. 없으면 API 통신 및 DB 저장 
	 * @param leageId(리그 키값)
	 * @return 해당하는 리그 개인 득점 순위
	 * @throws JsonProcessingException 
	 */	
	Map<String, Object> getTopScorers(Map<String, Object> inParam) throws JsonProcessingException;

	/**
	 * 순위 데이터 삭제 배치
	 */
	void deleteStandingsData();

}
