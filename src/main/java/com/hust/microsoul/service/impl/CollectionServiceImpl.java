package com.hust.microsoul.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hust.microsoul.mapper.CollectionModelMapper;
import com.hust.microsoul.mapper.GoodsModelMapper;
import com.hust.microsoul.model.CollectionModel;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.OrderModel;
import com.hust.microsoul.service.CollectionService;
import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.JSONCommon;

import java.util.Date;
import java.util.List;

@Service
public class CollectionServiceImpl implements CollectionService {
	@Autowired
	private CollectionModelMapper collectionModelMapper;
	@Autowired
	private GoodsModelMapper goodsModelMapper;
	
	@Override
    public void addCollection(HttpServletRequest request,HttpServletResponse response, Integer goodsID) {
		HttpSession session = request.getSession();
		Integer loginedBuyersID = (Integer)session.getAttribute("loginedBuyersID");
		if(loginedBuyersID==null) {
			JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
		}
		else {
		CollectionModel collectionModel=new CollectionModel();
		collectionModel.setBuyerId(loginedBuyersID);
		collectionModel.setGoodsId(goodsID);
		collectionModel.setCreatetime(new Date());
		Integer result=collectionModelMapper.insert(collectionModel);
		if(result!=null)
			JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
		}
	}
	
	@Override
	public void deleteCollection(HttpServletRequest request,HttpServletResponse response, Integer collectionID) {
		collectionModelMapper.deleteByPrimaryKey(collectionID);
	}
	
	@Override
	public PageInfo<GoodsModel> collectionList(Integer page, Integer rows,CollectionModel collectionModel){
		  PageHelper.startPage(page,rows);
	        List<GoodsModel> collectionList = goodsModelMapper.getcollectionList(collectionModel);
	        //返回查询结果
	        PageInfo pageInfo = new PageInfo(collectionList);

	        return pageInfo;
		
	}
	

}
