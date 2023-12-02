package com.football.ftb.web;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.collections4.MapUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory; 
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.football.ftb.service.FtbService;
/**
 *	첫 화면 및 API관련 컨트롤러
 *	
 *	@author hwiseo
 *	@version 1.0
 *	@since 2023-11-28
 */
@Controller
public class FtbController {
	
	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private FtbService ftbService;
	
	/**
	 *	home 화면으로 이동 
	 */	
	@RequestMapping("/home.do")
	public ModelAndView getIndex(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String,Object> inParam) throws JsonProcessingException {
		LOGGER.debug("=========== Hello Football ===========");
		ModelAndView mav = new ModelAndView("home");
		
		// 리그 키값 없으면 PL 디폴트
		if(inParam.containsKey("leagueId")) {
			mav.addObject("leagueId", inParam.get("leagueId"));
		} else {
			mav.addObject("leagueId", "2021");
		}
		
		return mav;
	}
	
	/**
	 *	경기 일정 가져오기 
	 *
	 *	@param today(날짜)
	 *  @param leageId(리그 키값)
	 *	@return 해당하는 경기 일정
	 */	
	@ResponseBody
	@RequestMapping("/ftb/todayMatches.do")
	public ModelAndView todayMatches(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String,Object> inParam) throws Exception {
		LOGGER.debug("=========== todayMatches START ===========");
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String,Object> result = ftbService.selectMatches(inParam);
		
		mv.addAllObjects(result);
		
		LOGGER.debug("=========== todayMatches END ===========");
		return mv;
	}
	
	/**
	 *	리그 순위 페이지 이동
	 *
	 *	@return 리그 순위 페이지
	 */
	@RequestMapping("/ftb/moveTablesPage.do")
	public ModelAndView moveTablesPage(HttpServletRequest request, HttpServletResponse response) {
		LOGGER.debug("=========== moveTablesPage START ===========");
		ModelAndView mav = new ModelAndView("tbl/tables");
		LOGGER.debug("=========== moveTablesPage END ===========");
		return mav;
	}
	
	/**
	 *	리그 순위 가져오기
	 *
	 *  @param leageId(리그 키값)
	 *	@return 해당하는 리그 순
	 */	
	@ResponseBody
	@RequestMapping("/ftb/leagueStandings.do")
	public ModelAndView leagueStandings(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String,Object> inParam) throws Exception {
		LOGGER.debug("=========== leagueStandings START ===========");
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String,Object> result = ftbService.leagueStandings(inParam);
		
		mv.addAllObjects(result);
		
		LOGGER.debug("=========== leagueStandings END ===========");
		return mv;
	}
	
	
}
