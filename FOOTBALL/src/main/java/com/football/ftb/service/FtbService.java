package com.football.ftb.service;

import java.util.Map;



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

}
