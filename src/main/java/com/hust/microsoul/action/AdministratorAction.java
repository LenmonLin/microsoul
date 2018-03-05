package com.hust.microsoul.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.alibaba.fastjson.JSONArray;
import com.hust.microsoul.service.GoodsService;
import com.hust.microsoul.service.SellerService;
import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.JSONCommon;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hust.microsoul.model.AdministratorModel;
import com.hust.microsoul.model.Adminitrator_tableModel;
import com.hust.microsoul.model.AdvertisementModel;
import com.hust.microsoul.model.BuyerModel;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.service.AdministratorService;
import com.hust.microsoul.service.BuyerService;

/**
 * @Description:AdministratorAction.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:22:46 
 * @version 1.0   ---11111212312wdqwdqwdqw1111111
 */
@Controller
@RequestMapping("microsoul/admin")
public class AdministratorAction {

	@Autowired
	public AdministratorService administratorService;
	
	@Autowired
	public BuyerService buyerService;

	@Autowired
	public SellerService sellerService;
	
	@Autowired
	public GoodsService goodsService;

	@RequestMapping("adminlogin")
	public void adminLogin(HttpServletRequest request,HttpServletResponse response,Adminitrator_tableModel adminitrator_tableModel){
		administratorService.adminLogin(request, response, adminitrator_tableModel);
	}
	
	@RequestMapping("disableBuyer")
	public void disableBuyer(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel){
		buyerService.disableBuyer(request, response, buyerModel);
	}
	
	@RequestMapping("authorizationBussiness")
	public void authorizationBussiness(HttpServletRequest request,HttpServletResponse response,SellerService sellerService){
		
	}
	
	@RequestMapping("disableGoods")
	public void disableGoods(HttpServletRequest request,HttpServletResponse response,GoodsModel goodsModel){
		
	}
	
	@RequestMapping("recommendGoods")
	public void recommendGoods(HttpServletRequest request,HttpServletResponse response,GoodsModel goodsModel){
		
	}
	
	@RequestMapping("goodsInfo")
	public void goodsInfo(HttpServletRequest request,HttpServletResponse response,GoodsModel goodsModel){
		
	}
	@RequestMapping("addAdvertise")
	public void addAdvertise(HttpServletRequest request,HttpServletResponse response,AdvertisementModel advertisementModel){
		
	}
}
