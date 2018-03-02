package com.hust.microsoul.mapper;

import java.util.List;

import com.hust.microsoul.model.OrderModel;

public interface OrderMapper {

    public Integer buyerCreateOrder(OrderModel orderModel);
    
    public List<OrderModel> getOrderList(OrderModel orderModel);
    
}