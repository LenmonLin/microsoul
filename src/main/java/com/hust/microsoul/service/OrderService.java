package com.hust.microsoul.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.hust.microsoul.model.OrderModel;

/**
 * @Description:OrderService.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:18:00 
 * @version 1.0  
 */

@Service
public interface OrderService {

	/**
	 * @Description:买家创建订单
	 * @author: huwentao    
	 * @date:   2018年2月26日 下午3:04:30   
	 * @version V1.0
	 */
	public void buyerCreateOrder(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel,Integer[] goodsId,Integer[] nums);


	/**
	 * @Description:买家取得订单信息列表
	 * @author: huwentao    
	 * @date:   2018年2月26日 下午3:07:06   
	 * @version V1.0
	 */
	public PageInfo<OrderModel> buyerGetOrderList(Integer page, Integer rows,OrderModel orderModel);


	/**
	 * @Description:买家为订单付款
	 * @author: huwentao    
	 * @date:   2018年2月26日 下午3:07:06   
	 * @version V1.0
	 */
	public void buyerPayOrder(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);

	/**
	 * @Description:买家删除订单
	 * @author: huwentao    
	 * @date:   2018年2月26日 下午3:04:30   
	 * @version V1.0
	 */
	public void buyerDeleteOrder(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);

	/**
	 * @Description:买家修改订单状态
	 * @author: huwentao    
	 * @date:   2018年2月26日 下午3:04:30   
	 * @version V1.0
	 */
	public void buyerUpdateOrderState(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);

}
