package com.hust.microsoul.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.OrderModel;
import com.hust.microsoul.service.OrderService;
import com.hust.microsoul.util.Msg;

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
	public void buyerCreateOrder(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel
			,@RequestParam(value="goodsId",required=false)Integer[] goodsId
			,@RequestParam(value="nums",required=false)Integer[] nums){
		orderService.buyerCreateOrder(request, response, orderModel,goodsId,nums);
	}
	
	@RequestMapping("getOrderList")
	@ResponseBody
	public Msg getOrderList(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel
			,@RequestParam(value = "page",defaultValue = "1") Integer page,
			 @RequestParam(value = "rows",defaultValue = "30") Integer rows){
		PageInfo<OrderModel> orderList = orderService.buyerGetOrderList(page, rows, orderModel);

		return Msg.success().add("orderList",orderList);
	}
}
