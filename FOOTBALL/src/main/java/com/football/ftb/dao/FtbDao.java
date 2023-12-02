package com.football.ftb.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface FtbDao {

	int insertMatchesL(Map<String, Object> inParam);

	Map<String, Object> selectMatchesList(Map<String, Object> inParam);

	void deleteFootballData();

	Map<String, Object> selectleagueStandings(Map<String, Object> inParam);

}
