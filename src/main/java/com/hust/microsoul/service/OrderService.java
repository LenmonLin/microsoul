package com.hust.microsoul.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.hust.microsoul.model.OrderModel;
import com.hust.microsoul.model.SellerModel;

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
	 * @Description:买家或卖家根据订单类型取得订单信息列表
	 * @author: huwentao    
	 * @date:   2018年2月26日 下午3:07:06   
	 * @version V1.0
	 */
	public PageInfo<OrderModel> getOrderList(Integer page, Integer rows,OrderModel orderModel);


	/**
	 * @Description:买家为订单付款
	 * @author: huwentao    
	 * @date:   2018年2月26日 下午3:07:06   
	 * @version V1.0
	 */
	public void buyerPayOrder(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel,SellerModel sellerModel);

	/**
	 * @Description:买家为订单付款后的结果
	 * @author: huwentao    
	 * @date:   2018年2月26日 下午3:07:06   
	 * @version V1.0
	 */
	public String payOrderResult(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);
	
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

	/**
	 * 
	 * @Description:卖家发货
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:02:38   
	 * @version V1.0
	 */
	public void sellerDeliveryGoods(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);

	/**
	 * 
	 * @Description:买家确认收货
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:15:11   
	 * @version V1.0
	 */
	public void buyerConfirmReceived(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);

	/**
	 * 
	 * @Description:买家申请退货
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:02:38   
	 * @version V1.0
	 */
	public void buyerRejectGoods(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);

	/**
	 * 
	 * @Description:卖家同意退货
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:11:46   
	 * @version V1.0
	 */
	public void sellerConfirmRejectGoods(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);

	/**
	 * 
	 * @Description:买家填写运单号
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:12:59   
	 * @version V1.0
	 */
	public void buyerSetRejectLogistics(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);

	/**
	 * 
	 * @Description:卖家确认收到退货
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:13:53   
	 * @version V1.0
	 */
	public void sellerReceivedRejected(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);

	/**
	 * 
	 * @Description:买家取消订单
	 * @author: huwentao    
	 * @date:   2018年3月8日 上午9:14:16   
	 * @version V1.0
	 */
	public void cancelOrder(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel);
}
