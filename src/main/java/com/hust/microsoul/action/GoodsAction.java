package com.hust.microsoul.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.PageInfo;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.service.GoodsService;
import com.hust.microsoul.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	/**
	 *@Description  插入商品记录
	 *@params
	 *@author LemonLin
	 *@date  2018/2/28
	 */
	@RequestMapping("insertGoodsModel")
	@ResponseBody
	public  Msg insertGoodsModel(GoodsModel goodsModel){

		goodsService.insert(goodsModel);

		return Msg.success();
	}

	/**
	 *@Description 更新商品记录
	 *@params
	 *@author LemonLin
	 *@date  2018/3/1
	 */
	@RequestMapping("updateGoodsModel")
	@ResponseBody
	public Msg updateByExampleSelective(GoodsModel record) {
//		goodsService.updateByPrimaryKeySelective(record);
		goodsService.updateByExampleSelective(record);
		return Msg.success();
	}

	@RequestMapping("showGoodsList")
	@ResponseBody
	public Msg showGoodsList(@RequestParam(value = "page",defaultValue = "1") Integer page,
							 @RequestParam(value = "rows",defaultValue = "30") Integer rows){

		PageInfo<GoodsModel> goodsModelList = goodsService.showGoodsList(page,rows);

		return Msg.success().add("goodsModelList",goodsModelList);
	}
}
