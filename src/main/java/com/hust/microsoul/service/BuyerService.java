package com.hust.microsoul.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hust.microsoul.model.BuyerModel;
import org.springframework.stereotype.Service;

/** 
 * @Description:BuyerService.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:18:13 
 * @version 1.0  
 */

@Service
public interface BuyerService {
	
	/**
	 * 
	 * @Description:TODO
	 * @author  huwentao 
	 * @date 创建时间：2018年1月22日 下午3:21:55
	 * @param
	 * @return
	 */
	public void buyerLogin(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel);
	
	/**
	 * 
	 * @Description:TODO
	 * @author  huwentao 
	 * @date 创建时间：2018年1月22日 下午3:22:00
	 * @param
	 * @return
	 */
	public void buyerRegister(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel);
	
	/**
	 * 
	 * @Description:TODO
	 * @author  huwentao 
	 * @date 创建时间：2018年1月22日 下午3:22:07
	 * @param
	 * @return
	 */
	public void buyerModifyPsw(HttpServletRequest request,HttpServletResponse response,String oldpsw,String newpsw);
		
	
		
	public void buyerUpdateInfo(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel);
	
	/**
	 * 
	 * @Description:TODO
	 * @author  huwentao 
	 * @date 创建时间：2018年1月22日 下午3:46:51
	 * @param
	 * @return
	 */
	public void buyerSelectInfo(HttpServletRequest request,HttpServletResponse response);
	
	
	public void disableBuyer(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel);
	
	public BuyerModel getBuyerInfo(HttpServletRequest request,HttpServletResponse response);

}
