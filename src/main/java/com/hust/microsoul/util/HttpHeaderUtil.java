package com.hust.microsoul.util;

import javax.servlet.http.HttpServletRequest;

/**
 * @Description:
 * @author:huwentao
 * @date:2018年3月14日
 * @version 1.0  
 */
public class HttpHeaderUtil {
	
	public HttpServletRequest request;
	
	public HttpHeaderUtil(HttpServletRequest request){
		this.request = request;
	}
	public boolean isAjax()
	  {
	    String ajax = this.request.getHeader("X-Requested-With");
	    if ((ajax != null) && ("XMLHttpRequest".equalsIgnoreCase(ajax))) {
	      return Boolean.TRUE.booleanValue();
	    }
	    return Boolean.FALSE.booleanValue();
	  }

}

