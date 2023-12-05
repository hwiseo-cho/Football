package com.football.ftb.scheduler;

import java.util.List; 
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.football.ftb.constants.FootballConstants;
import com.football.ftb.service.FtbService;

@Component
public class FtbScheduler {
	
	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());
	
	@Autowired
	private FtbService ftbService;
	
	/*
	 *	매 1분 마다 경기 일정 검색 데이터 삭제 스케줄러
	 * */
	@Scheduled(cron="0 0/1 * * * *")
	public void deleteFootballData() {
		LOGGER.info("########### deleteFootballData START ###########");
		
		try {
			ftbService.deleteFootballData();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		LOGGER.info("########### deleteFootballData END ###########");
	}
	
	/*
	 *	매 1시간 마다 순위 데이터 삭제 스케줄러
	 * */
	@Scheduled(cron="0 0 0/1 * * *")
	public void deleteStandingsData() {
		LOGGER.info("########### deleteStandingsData START ###########");
		
		try {
			ftbService.deleteStandingsData();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		LOGGER.info("########### deleteStandingsData END ###########");
	}
	
	
}
