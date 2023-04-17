package com.yeonoo.sfow.interceptor;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StopWatch;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

public class MonitoringInterceptor implements HandlerInterceptor {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	ThreadLocal<StopWatch> stopWatchLocal = new ThreadLocal<StopWatch>();
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		StopWatch stopWatch = new StopWatch(handler.toString());
		stopWatch.start(handler.toString());  // 타이머 시작
		stopWatchLocal.set(stopWatch);
		
		logger.info("접근경로:" + getURLPath(request));
		logger.info("요청처리 시작 시각:" + getCurrentTime());
		
		return true;
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		logger.info("요청처리 종료 시각:" + getCurrentTime());
	}

	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
	
		// logger.info("MonitoringInterceptor클래스의  afterCompletion()메서드 실행");
		StopWatch stopWatch = stopWatchLocal.get();
		stopWatch.stop(); // 타이머 종료
		
		logger.info("요청처리 소요 시간:" + stopWatch.getTotalTimeMillis()+"ms");
		stopWatchLocal.set(null);
		logger.info("===================================================");
		
	}
	
	// 접근경로 구하기
	private String getURLPath(HttpServletRequest request) {
		
		String currentPath = request.getRequestURI();
		String queryString = request.getQueryString();
		
		// queryString 값이 비어있다면  "" 빈값을 출력
		// queryString 값이 null이 아니면 quertString 앞에 "?" 추가해서 출력
		queryString=(queryString==null) ? "" : "?"+queryString;
		
		return currentPath + queryString;
	}
	
	// 현재 시스템의 시간 구하기
	private String getCurrentTime() {
		
		// 현재시간
		// Date today = new Date();
		Calendar today = Calendar.getInstance();  // Calendar의 객체생성은 new
		
		// 날짜시간패턴
		DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
		today.setTimeInMillis( System.currentTimeMillis() );
		
		// 현재시간에 날짜시간패턴 입히기
		return dateFormat.format(today.getTime());
	}
}
