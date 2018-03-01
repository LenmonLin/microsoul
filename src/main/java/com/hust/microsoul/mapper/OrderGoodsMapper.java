package com.hust.microsoul.mapper;

import org.springframework.stereotype.Repository;

import com.hust.microsoul.model.OrderGoodsModel;

@Repository
public interface OrderGoodsMapper {
	public Integer insertOrderGoods(OrderGoodsModel orderGoodsModel);
}