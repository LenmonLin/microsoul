package com.hust.microsoul.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hust.microsoul.model.AdministratorModel;

/** 
 * @Description:AdministratorService.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:19:15 
 * @version 1.0  
 */
public interface AdministratorService {
	/**
	 * 
	 * @Description:TODO
	 * @author  huwentao 
	 * @date 创建时间：2018年1月22日 下午3:44:45
	 * @param
	 * @return
	 */
	public void adminLogin(HttpServletRequest request,HttpServletResponse response,AdministratorModel administratorModel);
}
