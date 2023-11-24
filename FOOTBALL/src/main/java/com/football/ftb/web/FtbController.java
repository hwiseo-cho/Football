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
import com.football.ftb.service.FtbService;

@Controller
public class FtbController {
	
	private final Logger LOGGER = LoggerFactory.getLogger(this.getClass());

	@Autowired
	private FtbService ftbService;
	
	@RequestMapping("/home.do")
	public ModelAndView getIndex() throws JsonProcessingException {
		LOGGER.debug("=========== Hello Football ===========");
		ModelAndView mv = new ModelAndView("home");
		return mv; 
	}
	
	@ResponseBody
	@RequestMapping("/matches/todayMatches.do")
	public ModelAndView todayMatches(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String,Object> inParam) {
		LOGGER.debug("=========== todayMatches START ===========");
		LOGGER.debug("=========== todayMatches param: {}", inParam);
		ModelAndView mv = new ModelAndView("jsonView");
		
		Map<String,Object> result = ftbService.selectMatches(inParam);
		
		mv.addAllObjects(result);
		
		LOGGER.debug("=========== todayMatches END ===========");
		return mv;
	}
	
	@ResponseBody
	@RequestMapping("/matches/insertMatchesL.do")
	public ModelAndView insertMatchesL(HttpServletRequest request, HttpServletResponse response, @RequestParam Map<String,Object> inParam) {
		LOGGER.debug("=========== insertMatchesL START ===========");
		ModelAndView mv = new ModelAndView("jsonView");
		
		ftbService.insertMatchesL(inParam);
		
		LOGGER.debug("=========== todayMatches END ===========");
		return mv;
	}
	
	
}
