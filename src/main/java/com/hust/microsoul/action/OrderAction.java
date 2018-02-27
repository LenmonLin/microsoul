package com.hust.microsoul.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hust.microsoul.model.OrderModel;
import com.hust.microsoul.service.OrderService;

/** 
 * @Description:OrderAction.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:23:44 
 * @version 1.0     ---
 */
@Controller
@RequestMapping("microsoul/order")
public class OrderAction {

	@Autowired
	private OrderService orderService;
	
	private Logger Logger = LoggerFactory.getLogger(this.getClass());
	/**
	 * 
	 * @Description:买家下单
	 * @author: huwentao    
	 * @date:   2018年2月27日 下午2:17:30   
	 * @version V1.0
	 */
	@RequestMapping("create")
	public void buyerCreateOrder(HttpServletRequest request,HttpServletResponse response 
			,OrderModel orderModel,@RequestParam(value="goodsId",required=false)Integer[] goodsId){
		Logger.error("进来了！");
		orderService.buyerCreateOrder(request, response, orderModel,goodsId);
	}
	
}
