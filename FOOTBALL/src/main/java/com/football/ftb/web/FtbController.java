package com.football.ftb.web;

import java.util.List; 
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.football.ftb.constants.FootballConstants;
import com.football.ftb.service.FtbService;

@Controller
public class FtbController {
	
	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private FtbService ftbService;
	
	/*
	 *	home 화면으로 이동 
	 */	
	@RequestMapping("/home.do")
	public ModelAndView getIndex() throws JsonProcessingException {
		LOGGER.debug("=========== Hello Football ===========");
		ModelAndView mv = new ModelAndView("home");
		return mv; 
	}
	
	/*
	 *	경기 일정 가져오기 
	 *	1. 해당 날짜 DB 조회 
	 *	2. 존재하면 가져와서 보여줌 
	 *	3. 없으면 API 통신 및 DB 저장 
	 */	
	@ResponseBody
	@RequestMapping("/matches/todayMatches.do")
	public ModelAndView todayMatches(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String,Object> inParam) throws Exception {
		LOGGER.debug("=========== todayMatches START ===========");
		LOGGER.debug("=========== todayMatches param: {}", inParam);
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String,Object> result = ftbService.selectMatches(inParam);
		
		mv.addAllObjects(result);
		
		LOGGER.debug("=========== todayMatches END ===========");
		return mv;
	}
	
	
}
