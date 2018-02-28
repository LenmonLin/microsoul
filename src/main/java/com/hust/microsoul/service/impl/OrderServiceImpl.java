package com.hust.microsoul.service.impl;

import com.hust.microsoul.mapper.OrderMapper;
import com.hust.microsoul.model.OrderModel;
import com.hust.microsoul.service.OrderService;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** 
 * @Description:OrderServiceImpl.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:19:55 
 * @version 1.0  
 */

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	private Logger Logger = LoggerFactory.getLogger(this.getClass());
	/**
	 * @Description:
	 * @author:huwentao
	 * @date:2018年2月26日
	 * @param:     
	 * @return:
	 * @version 1.0  
	 */
	@Override
	public void buyerCreateOrder(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel,Integer[] goodsId) {
		try {
			Logger.error(":"+orderModel.getBuyerId());
			orderModel.setOrderTime(new Date(System.currentTimeMillis()));
			Logger.error(":"+(orderMapper==null));
			int insertResult = orderMapper.buyerCreateOrder(orderModel);
			
			if(insertResult>0) {
				Logger.error("插入成功！");
			}
		} catch (Exception e) {
		}
		
	}
	/**
	 * @Description:
	 * @author:huwentao
	 * @date:2018年2月26日
	 * @param:     
	 * @return:
	 * @version 1.0  
	 */
	@Override
	public void buyerGetOrderList(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		
		
	}
	/**
	 * @Description:
	 * @author:huwentao
	 * @date:2018年2月26日
	 * @param:     
	 * @return:
	 * @version 1.0  
	 */
	@Override
	public void buyerPayOrder(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		
		
	}
	/**
	 * @Description:
	 * @author:huwentao
	 * @date:2018年2月26日
	 * @param:     
	 * @return:
	 * @version 1.0  
	 */
	@Override
	public void buyerDeleteOrder(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		
		
	}

	/**
	 * @Description:
	 * @author:huwentao
	 * @date:2018年2月26日
	 * @param:     
	 * @return:
	 * @version 1.0  
	 */
	@Override
	public void buyerUpdateOrderState(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		
		
	}

}
