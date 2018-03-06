package com.hust.microsoul.util;

/**
 * @Description:
 * @author:huwentao
 * @date:2018年2月26日
 * @version 1.0  
 */
public interface OrderStateCode {
	/*
	 * 买家未付款
	 */
	public static final Integer UNPAID = 0;
	
	/*
	 * 已付款，卖家未发货
	 */
	public static final Integer UNDELIVERY = 1;
	
	/*
	 * 已发货，买家未收货
	 */
	public static final Integer UNRECEIVE = 2;
	
	/*
	 * 买家收到货
	 */
	public static final Integer RECEIVED = 3;
	
	/*
	 * 买家申请退货
	 */
	public static final Integer BUYERREJECTE = 4;
	
	/*
	 * 卖家同意退货
	 */
	public static final Integer SELLER_CONFIRM_REJECTED = 5;
	
	/*
	 * 买家已填写退货单号
	 */
	public static final Integer BUYERREJECTED = 6;
	
	/*
	 * 完成订单
	 */
	public static final Integer DONE = 9;
}

