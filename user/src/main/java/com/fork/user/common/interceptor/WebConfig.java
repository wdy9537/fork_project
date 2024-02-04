package com.fork.user.common.interceptor;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {
	private final LoginInterceptor loginInterceptor;
	private final LicenseInterceptor licenseInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(loginInterceptor).order(1).addPathPatterns("/**").excludePathPatterns("/resources/**/**", "/member/**", "/shopDetail/**/**");
		registry.addInterceptor(licenseInterceptor).order(2).addPathPatterns("/menu", "/sales**", "/statistics", "/*notice*", "/kitchen");
		
	}
}
