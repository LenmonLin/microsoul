package com.hust.microsoul.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.hust.microsoul.model.BuyerModel;
import com.hust.microsoul.model.CollectionModel;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.OrderModel;
import com.hust.microsoul.service.BuyerService;
import com.hust.microsoul.service.CollectionService;
import com.hust.microsoul.util.Msg;

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
	
	@Autowired
	private CollectionService collectionService;
	
	Logger logger =LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping("login")
	public void buyerLogin(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel){
		buyerService.buyerLogin(request, response,buyerModel);
		logger.error("1111111");
	}
	
	@RequestMapping("exit")
	public void buyerExit(HttpServletRequest request,HttpServletResponse response){
		buyerService.buyerExit(request, response);
		logger.error("1111111");
	}
	
	@RequestMapping("register")
	public void buyerRegister(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel){
		buyerService.buyerRegister(request, response,buyerModel);
	}
	
	@RequestMapping("modifypsw")
	public void buyerModifyPsw(HttpServletRequest request,HttpServletResponse response,@RequestParam(value = "oldpsw") String oldpsw,
            @RequestParam(value = "newpsw") String newpsw){
		buyerService.buyerModifyPsw(request, response ,oldpsw ,newpsw);
	}
	
	@RequestMapping("updateinfo")
	public void buyerUpdateInfo(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel){
		buyerService.buyerUpdateInfo(request, response,buyerModel);
	}
	
	@RequestMapping("getbuyerinfo")
	public BuyerModel getBuyerInfo(HttpServletRequest request,HttpServletResponse response){
		BuyerModel infoResult=buyerService.getBuyerInfo(request, response);
		return infoResult;
	}
	
	@RequestMapping("addcollection")
	public void addCollection(HttpServletRequest request,HttpServletResponse response, @RequestParam(value = "goodsID")Integer goodsID){
		collectionService.addCollection(request, response, goodsID);
	}
	
	@RequestMapping("deletecollection")
	public void deleteCollection(HttpServletRequest request,HttpServletResponse response, @RequestParam(value = "collectionID")Integer collectionID){
		collectionService.addCollection(request, response, collectionID);
	}
	
	@RequestMapping("showcollectionlist")
	@ResponseBody
	public Msg checkCollection(HttpServletRequest request,HttpServletResponse response,
			@RequestParam(value = "page",defaultValue = "1") Integer page,
			 @RequestParam(value = "rows",defaultValue = "30") Integer rows){
		PageInfo<GoodsModel> collectionList=collectionService.collectionList(request,response,page, rows);
		return Msg.success().add("collectionList",collectionList);
	}
		
}
