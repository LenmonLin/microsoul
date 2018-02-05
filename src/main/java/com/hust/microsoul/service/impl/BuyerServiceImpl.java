package com.hust.microsoul.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.JSONCommon;
import com.hust.microsoul.util.MD5Utils;
import com.hust.microsoul.mapper.BuyerModelMapper;
import com.hust.microsoul.model.BuyerModel;
import com.hust.microsoul.service.BuyerService;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** 
 * @Description:BuyerServiceImpl.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:20:57 
 * @version 1.0  
 */

@Service
public class BuyerServiceImpl implements BuyerService {
    @Autowired
    private BuyerModelMapper buyerModelMapper;
	
    @Override
	public void buyerLogin(HttpServletRequest request,
			HttpServletResponse response,String accountName) {
    	String loginResult=buyerModelMapper.buyerLogin(accountName);
    	String psw=request.getParameter("password");
    	if(loginResult.equals(psw)) {
    		JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
    		
    	}else {
    		JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
    	}
	}

	@Override
	public void buyerRegister(HttpServletRequest request,
			HttpServletResponse response,BuyerModel buyerModel) {
		BuyerModel checkResult = buyerModelMapper.checkaccountName(buyerModel.getAccountName());
		if(checkResult != null) {	
			JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
		}
		else {
			buyerModel.setPassword(MD5Utils.md5(buyerModel.getPassword()));
			buyerModelMapper.buyerRegister(buyerModel);
			JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
		}
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
