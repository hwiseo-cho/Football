package com.football.ftb.config;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.ApplicationListener;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Component;

@Component
public class Configuration implements ApplicationListener<ApplicationStartedEvent> {

	@Value("${football.api.url}")
	private String FOOTBALL_API_URL;

	@Value("${football.api.token}")
	private String FOOTBALL_API_TOKEN;
	
	public static class Football {
		public static String FOOTBALL_API_URL = "";
		public static String FOOTBALL_API_TOKEN = "";
	}

	@Override
	public void onApplicationEvent(ApplicationStartedEvent event) {
		/* properties 값 초기화 */
		Football.FOOTBALL_API_URL = this.FOOTBALL_API_URL;
		Football.FOOTBALL_API_TOKEN = this.FOOTBALL_API_TOKEN;
	}
	
}
