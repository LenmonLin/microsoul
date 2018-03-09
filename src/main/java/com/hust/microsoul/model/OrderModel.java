package com.hust.microsoul.model;

import java.util.Date;
import java.util.List;

/** 
 * @Description:OrderModel.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:13:22 
 * @version 1.0  
 */
public class OrderModel {
	
    private Integer orderId;

    private Integer state;

    private Integer logisticId;
    
    private Integer logisticIdReject;
    
    private Integer buyerId;

    private Integer sellerId;
    
    private Float totalPrice;
    
    private String payId;
    
    private String sellerName;

    private List<GoodsModel> goods;
    
    private Date orderTime;

    private Date payTime;

    private Date deliverTime;

	public Integer getOrderId() {
		return orderId;
	}

	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	public Integer getState() {
		return state;
	}

	public void setState(Integer state) {
		this.state = state;
	}

	public Integer getLogisticId() {
		return logisticId;
	}

	public void setLogisticId(Integer logisticId) {
		this.logisticId = logisticId;
	}

	public Integer getBuyerId() {
		return buyerId;
	}

	public void setBuyerId(Integer buyerId) {
		this.buyerId = buyerId;
	}

	public Integer getSellerId() {
		return sellerId;
	}

	public void setSellerId(Integer sellerId) {
		this.sellerId = sellerId;
	}

	public Date getOrderTime() {
		return orderTime;
	}

	public void setOrderTime(Date orderTime) {
		this.orderTime = orderTime;
	}

	public Date getPayTime() {
		return payTime;
	}

	public void setPayTime(Date payTime) {
		this.payTime = payTime;
	}

	public Date getDeliverTime() {
		return deliverTime;
	}

	public void setDeliverTime(Date deliverTime) {
		this.deliverTime = deliverTime;
	}

	public List<GoodsModel> getGoods() {
		return goods;
	}

	public void setGoods(List<GoodsModel> goods) {
		this.goods = goods;
	}

	public Integer getLogisticIdReject() {
		return logisticIdReject;
	}

	public void setLogisticIdReject(Integer logisticIdReject) {
		this.logisticIdReject = logisticIdReject;
	}

	public String getSellerName() {
		return sellerName;
	}

	public void setSellerName(String sellerName) {
		this.sellerName = sellerName;
	}

	public Float getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(Float totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getPayId() {
		return payId;
	}

	public void setPayId(String payId) {
		this.payId = payId;
	}
}
