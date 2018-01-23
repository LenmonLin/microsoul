package com.hust.microsoul.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hust.microsoul.model.AdministratorModel;
import com.hust.microsoul.model.AdvertisementModel;

/** 
 * @Description:AdvertisementService.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:18:55 
 * @version 1.0  
 */
public interface AdvertisementService {
	/**
	 * 增加新广告
	 * @param request
	 * @param response
	 * @param advertisementModel
	 */
	public void addAdvertise(HttpServletRequest request,
			HttpServletResponse response, AdvertisementModel advertisementModel) ;

	/**
	 * 删除广告
	 * @param request
	 * @param response
	 * @param advertisementModel
	 */
    public void delAdvertise(HttpServletRequest request,
			HttpServletResponse response, AdvertisementModel advertisementModel) ;
	
    /**
	 * 查找广告
	 * @param request
	 * @param response
	 * @param advertisementModel
	 */
    public void selectAdvertise(HttpServletRequest request,
			HttpServletResponse response, AdvertisementModel advertisementModel) ;
}