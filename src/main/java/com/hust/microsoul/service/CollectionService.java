package com.hust.microsoul.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import com.github.pagehelper.PageInfo;
import com.hust.microsoul.model.CollectionModel;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.OrderModel;

@Service
public interface CollectionService {

	public void addCollection(HttpServletRequest request,HttpServletResponse response, Integer goodsID);
	
	public void deleteCollection(HttpServletRequest request,HttpServletResponse response,Integer goodsId);
	
	public PageInfo<GoodsModel> collectionList(HttpServletRequest request,HttpServletResponse response,Integer page, Integer rows);
}
