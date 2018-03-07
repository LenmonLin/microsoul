package com.hust.microsoul.service.impl;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.JSONCommon;
import com.hust.microsoul.util.MD5Utils;
import com.hust.microsoul.mapper.BuyerModelMapper;
import com.hust.microsoul.model.BuyerModel;
import com.hust.microsoul.model.BuyerModelExample;
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
			HttpServletResponse response,BuyerModel buyerModel) {
    	String pwd = MD5Utils.md5(buyerModel.getPassword());
    	BuyerModelExample buyerModelExample = new BuyerModelExample();
    	BuyerModelExample.Criteria criteriaBuyer = buyerModelExample.createCriteria();
    	criteriaBuyer.andAccountNameEqualTo(buyerModel.getAccountName());
    	criteriaBuyer.andPasswordEqualTo(pwd);
    	List<BuyerModel> buyerModels = buyerModelMapper.selectByExample(buyerModelExample);
    	if(buyerModels!=null&&buyerModels.size()>0) {
    		Integer loginedBuyersID = buyerModels.get(0).getBuyersId();
    		request.getSession().setAttribute("loginedBuyersID",loginedBuyersID);
    		JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
    		
    	}else {
    		JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
    	}
	}

	@Override
	public void buyerRegister(HttpServletRequest request,
			HttpServletResponse response,BuyerModel buyerModel) {
		BuyerModel checkResult = buyerModelMapper.checkaccountName(buyerModel.getAccountName());
		System.out.println(buyerModel.getPassword());
		if(checkResult != null) {	
			JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
		}
		else {
			buyerModel.setPassword(MD5Utils.md5(buyerModel.getPassword()));
			buyerModelMapper.buyerRegister(buyerModel);
			JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
		}
	}
	
	//修改密码
	public void buyerModifyPsw(HttpServletRequest request,HttpServletResponse response,String oldpsw,String newpsw) {
		HttpSession session = request.getSession();
		Integer loginedBuyersID = (Integer)session.getAttribute("loginedBuyersID");
		BuyerModel buyerModel=buyerModelMapper.selectByPrimaryKey(loginedBuyersID);
		oldpsw=MD5Utils.md5(oldpsw);
		System.out.println(oldpsw+newpsw);
		if (buyerModel.getPassword().equals(oldpsw)) {
			buyerModelMapper.modifyBuyersPsw(MD5Utils.md5(newpsw),loginedBuyersID);
			JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
		}
		else JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
	}

	@Override
	public void buyerUpdateInfo(HttpServletRequest request,
			HttpServletResponse response,BuyerModel buyerModel) {
		/*
		 * 先从session中取出当前用户ID，然后更新买家信息
		 */
		HttpSession session = request.getSession();
		Integer loginedBuyersID = (Integer)session.getAttribute("loginedBuyersID");
		buyerModel.setBuyersId(loginedBuyersID);
		int infoResult=buyerModelMapper.updateByPrimaryKeySelective(buyerModel);
		/*
		 * 若修改成功
		 */
		if(infoResult != 0) {	
			JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
		}
		else JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
	} 
	
    @Override
	public void buyerSelectInfo(HttpServletRequest request,HttpServletResponse response) {
    	HttpSession session = request.getSession();
		Integer loginedBuyersID = (Integer)session.getAttribute("loginedBuyersID");
		BuyerModel buyerModel=buyerModelMapper.selectByPrimaryKey(loginedBuyersID);
		String zhifubaoAccount=buyerModel.getZhifubaoAccount();
    }
    
    
	@Override
	public void disableBuyer(HttpServletRequest request,
			HttpServletResponse response, BuyerModel buyerModel) {
		Integer buyersID=buyerModel.getBuyersId();
		if(buyersID!=0) {
			buyerModelMapper.disableBuyer(buyersID);
			JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
		}
		else
			JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
	}

}
