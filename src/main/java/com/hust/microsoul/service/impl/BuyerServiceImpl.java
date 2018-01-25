package com.hust.microsoul.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hust.microsoul.model.BuyerModel;
import com.hust.microsoul.service.BuyerService;
import org.springframework.stereotype.Service;

/** 
 * @Description:BuyerServiceImpl.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:20:57 
 * @version 1.0  
 */

@Service
public class BuyerServiceImpl implements BuyerService {

	@Override
	public void buyerLogin(HttpServletRequest request,
			HttpServletResponse response) {
	}

	@Override
	public void buyerRegister(HttpServletRequest request,
			HttpServletResponse response) {
	}

	@Override
	public void buyerInfo(HttpServletRequest request,
			HttpServletResponse response) {
	}

	@Override
	public void disableBuyer(HttpServletRequest request,
			HttpServletResponse response, BuyerModel buyerModel) {
	}

}
