package com.hust.microsoul.mapper;

import java.util.List;

import com.hust.microsoul.model.OrderModel;

public interface OrderMapper {

    public Integer buyerCreateOrder(OrderModel orderModel);
    
    public Integer deleteOrder(OrderModel orderModel);

    public Integer setLogisticId(OrderModel orderModel);
    
    public Integer updateOrderState(OrderModel orderModel);
    
    public Integer setLogisticIdReject(OrderModel orderModel);
    
    public List<OrderModel> getOrderList(OrderModel orderModel);
    
}