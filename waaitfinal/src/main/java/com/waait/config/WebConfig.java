package com.waait.config;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import lombok.RequiredArgsConstructor;

@Configuration
@RequiredArgsConstructor
public class WebConfig implements WebMvcConfigurer {
	
	private final SessionRemoveInterceptorForMail sessionRemoveInterceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		
		registry.addInterceptor(sessionRemoveInterceptor)
			.excludePathPatterns("/mail/**", "/resources/**",  "/app-assets/**"
									, "/assets/**", "/.well-known/**", "/error");

	}
	/*
	 * @Override public void addResourceHandlers(ResourceHandlerRegistry registry) {
	 * registry.addResourceHandler("/resources/**").addResourceLocations(
	 * "/webapp/resources"); }
	 */
}
