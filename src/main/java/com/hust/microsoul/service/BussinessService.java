package com.hust.microsoul.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hust.microsoul.model.BussinessModel;

/** 
 * @Description:BussinessService.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:18:33 
 * @version 1.0  
 */
public interface BussinessService {
	/**
	 *@Description
	 *@author LemonLin
	 *@date  2018/1/23
	 */
	public void sellerLogin(HttpServletRequest request, HttpServletResponse response);

	public void sellerRegister(HttpServletRequest request,HttpServletResponse response);

	public void sellerInfo(HttpServletRequest request,HttpServletResponse response);

	public void disableSeller(HttpServletRequest request,HttpServletResponse response);

	public void sellerChangePassword(HttpServletRequest request,HttpServletResponse response);
}
