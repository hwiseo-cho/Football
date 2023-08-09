package com.football.ftb.config;

import javax.sql.DataSource;

import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.jdbc.DataSourceBuilder;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.view.json.MappingJackson2JsonView;

@Configuration
public class DataSourceConfig {

	@ConfigurationProperties(prefix="spring.datasource")
	@Bean
	public DataSource dataSource() {
		return DataSourceBuilder.create().build();
		
	}
	
	@Bean(name="jsonView")
    public MappingJackson2JsonView jsonView() {
        return new MappingJackson2JsonView();
    }
}
