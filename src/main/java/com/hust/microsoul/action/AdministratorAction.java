package com.hust.microsoul.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hust.microsoul.model.AdministratorModel;
import com.hust.microsoul.model.BussinessModel;
import com.hust.microsoul.model.BuyerModel;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.service.AdministratorService;
import com.hust.microsoul.service.BussinessService;
import com.hust.microsoul.service.BuyerService;
import com.hust.microsoul.service.GoodsService;

/** 
 * @Description:AdministratorAction.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:22:46 
 * @version 1.0   ---11111212312
 */
@Controller
@RequestMapping("microsoul/admin")
public class AdministratorAction {
	
	@Autowired
	public AdministratorService administratorService;
	
	@Autowired
	public BuyerService buyerService;

	@Autowired
	public BussinessService bussinessService;
	
	@Autowired
	public GoodsService goodsService;
	
	@RequestMapping("login")
	public void adminLogin(HttpServletRequest request,HttpServletResponse response,AdministratorModel administratorModel){
		
	}
	
	@RequestMapping("disableBuyer")
	public void disableBuyer(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel){
		
	}
	
	@RequestMapping("authorizationBussiness")
	public void authorizationBussiness(HttpServletRequest request,HttpServletResponse response,BussinessModel bussinessModel){
		
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
}
