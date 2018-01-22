package com.hust.microsoul.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.hust.microsoul.service.BussinessService;
import com.hust.microsoul.service.BuyerService;

/** 
 * @Description:BussinessAction.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:24:11 
 * @version 1.0     ---
 */
@Controller
@RequestMapping("microsoul/bussiness")
public class BussinessAction {
	
	@Autowired
	private BussinessService bussinessService;
	
	@RequestMapping("login")
	public void bussinessLogin(HttpServletRequest request,HttpServletResponse response){
		
	}
	
	@RequestMapping("register")
	public void bussinessRegister(HttpServletRequest request,HttpServletResponse response){
		
	}
	
	@RequestMapping("info")
	public void bussinessInfo(HttpServletRequest request,HttpServletResponse response){
		
	}
}
