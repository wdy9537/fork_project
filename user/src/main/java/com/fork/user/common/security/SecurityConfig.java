package com.fork.user.common.security;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
public class SecurityConfig {
	 @Bean
	    public BCryptPasswordEncoder bCryptPasswordEncoder() {
	        return new BCryptPasswordEncoder();
	    }
	 
	 @Bean
		public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {
			http.cors().disable()			//cors 방지
				.csrf().disable()			//csrf 방지
				.formLogin().disable()		//기본 로그인페이지 없애기
				.headers().frameOptions().disable();
	 
			return http.build();
		}
}
