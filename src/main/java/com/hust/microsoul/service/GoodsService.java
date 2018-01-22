package com.hust.microsoul.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestMapping;

/** 
 * @Description:GoodsService.java
 * @author  huwentao 
 * @date 创建时间：2018年1月17日 下午4:45:15 
 * @version 1.0  
 */
@Service
public interface GoodsService {
	
	//测试
	public void HelloWorld(HttpServletRequest request,HttpServletResponse response);
	
	/**
	 * 
	 * @Description:管理员查看商品信息
	 * @author  huwentao 
	 * @date 创建时间：2018年1月22日 下午3:37:51
	 * @param
	 * @return
	 */
	public void goodsInfo(HttpServletRequest request,HttpServletResponse response);
	
	/**
	 * 
	 * @Description:封禁异常商品
	 * @author  huwentao 
	 * @date 创建时间：2018年1月22日 下午3:40:43
	 * @param
	 * @return
	 */
	public void disableGoods(HttpServletRequest request,HttpServletResponse response);
	
	/**
	 * 
	 * @Description:推荐商品到广告位
	 * @author  huwentao 
	 * @date 创建时间：2018年1月22日 下午3:40:49
	 * @param
	 * @return
	 */
	public void recommendGoods(HttpServletRequest request,HttpServletResponse response);
}
