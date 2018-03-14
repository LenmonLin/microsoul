package com.hust.microsoul.interceptor;

import java.util.Collections;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.HttpHeaderUtil;
import com.hust.microsoul.util.JSONCommon;

/**
 * 
 * @author huwentao ----1111sqsqsq
 *
 */
public class UserLoginInterceptor implements HandlerInterceptor{

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	public void afterCompletion(HttpServletRequest arg0,
			HttpServletResponse arg1, Object arg2, Exception arg3)
			throws Exception {
	}

	public void postHandle(HttpServletRequest arg0, HttpServletResponse arg1,
			Object arg2, ModelAndView arg3) throws Exception {
	}

	@SuppressWarnings("unchecked")
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,
			Object arg2) throws Exception {
		
		Map<String,String[]> paramMap = Collections.unmodifiableMap(request.getParameterMap());
		for (Entry<String, String[]> entry : paramMap.entrySet()) {
			logger.error("参数名:"+entry.getKey()+"；参数值："+entry.getValue()[0]);
		}
		String uri = request.getRequestURI();
		System.out.println("uri-----"+uri);
		if(uri.startsWith("/microsoul")){
			HttpHeaderUtil head = new HttpHeaderUtil(request);
			boolean isAjax = head.isAjax();
			Integer buyerid = (Integer)request.getSession().getAttribute("loginedBuyersID");
			Integer sellerid = (Integer)request.getSession().getAttribute("existUserId");
			if(buyerid==null && sellerid==null) {
				if (isAjax) {
					JSONCommon.outputResultCodeJson(CommonCode.NEED_LOGIN, response);
				} else {
					response.sendRedirect("/login.jsp");
				}
			} else {
				return true;
			}
		} else if(uri.startsWith("/user")){
			return true;
		} else {
			response.sendRedirect("/login.jsp");
		}
		return false;
	}

}
