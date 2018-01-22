package com.hust.microsoul.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hust.microsoul.service.BuyerService;

/** 
 * @Description:BuyerAction.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:23:29 
 * @version 1.0     ---
 */
@Controller
@RequestMapping("microsoul/buyer")
public class BuyerAction {
	
	@Autowired
	private BuyerService buyerService;
	
	@RequestMapping("login")
	public void buyerLogin(HttpServletRequest request,HttpServletResponse response){
		
	}
	
	@RequestMapping("register")
	public void buyerRegister(HttpServletRequest request,HttpServletResponse response){
		
	}
	
	@RequestMapping("info")
	public void buyerInfo(HttpServletRequest request,HttpServletResponse response){
		
	}
}
