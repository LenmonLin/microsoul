package com.hust.microsoul.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hust.microsoul.mapper.OrderGoodsMapper;
import com.hust.microsoul.mapper.OrderMapper;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.GoodsModelExample;
import com.hust.microsoul.model.OrderGoodsModel;
import com.hust.microsoul.model.OrderModel;
import com.hust.microsoul.service.OrderService;
import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.JSONCommon;
import com.hust.microsoul.util.OrderStateCode;

import java.util.Date;
import java.util.List;

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
	
	@Autowired
	private OrderGoodsMapper orderGoodsMapper;
	
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
	public void buyerCreateOrder(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel,Integer[] goodsId,Integer[] nums) {
		try {
			Logger.error(":"+orderModel.getBuyerId());
			orderModel.setOrderTime(new Date(System.currentTimeMillis()));
			orderModel.setState(OrderStateCode.UNPAID);
			Logger.error(":"+(orderMapper==null));
			int insertResult = orderMapper.buyerCreateOrder(orderModel);
			
			System.out.println("自增id是："+orderModel.getOrderId());
			if(insertResult>0) {
				Logger.error("插入订单成功！");
				OrderGoodsModel orderGoodsModel = new OrderGoodsModel();
				
				for (int i = 0; i < goodsId.length; i++) {
					orderGoodsModel.setGoodsId(goodsId[i]);
					orderGoodsModel.setNum(nums[i]);
					orderGoodsModel.setOrderId(orderModel.getOrderId());
					orderGoodsMapper.insertOrderGoods(orderGoodsModel);
				}
				JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
			} else {
				JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
			}
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
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
	public PageInfo<OrderModel> buyerGetOrderList(Integer page, Integer rows,OrderModel orderModel){
		 //设置分页信息
        PageHelper.startPage(page,rows);
        //执行查询
        List<OrderModel> orderList = orderMapper.getOrderList(orderModel);
        //返回查询结果
        PageInfo pageInfo = new PageInfo(orderList);

        return pageInfo;
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
