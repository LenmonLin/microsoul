package com.hust.microsoul.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hust.microsoul.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Description:GoodsAction.java
 * @author  huwentao
 * @date 创建时间：2018年1月17日 下午4:49:56
 * @version 1.0     ---
 */
@Controller
@RequestMapping("microsoul/goods")
public class GoodsAction {

	@Autowired
	private GoodsService goodsService;

	@RequestMapping("hello")
	public String HelloWorld(HttpServletRequest request,HttpServletResponse response) {
		goodsService.HelloWorld(request, response);
		return "WEB-INF/login";
	}
}
