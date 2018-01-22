package com.hust.microsoul.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.hust.microsoul.service.GoodsService;

/** 
 * @Description:GoodsServiceImpl.java
 * @author  huwentao 
 * @date 创建时间：2018年1月17日 下午4:46:02 
 * @version 1.0  
 */
@Service
public class GoodsServiceImpl implements GoodsService {
	/**
	 * 日志记录
	 */
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	
	public void HelloWorld(HttpServletRequest request,
			HttpServletResponse response) {
		logger.error("HelloWorld!");
	}

	@Override
	public void goodsInfo(HttpServletRequest request,
			HttpServletResponse response) {
	}

	@Override
	public void disableGoods(HttpServletRequest request,
			HttpServletResponse response) {
	}

	@Override
	public void recommendGoods(HttpServletRequest request,
			HttpServletResponse response) {
	}

}
