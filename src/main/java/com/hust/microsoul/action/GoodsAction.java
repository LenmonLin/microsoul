package com.hust.microsoul.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageInfo;
import com.hust.microsoul.model.GoodsDescModel;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.service.GoodsService;
import com.hust.microsoul.util.ImageUploadUtil;
import com.hust.microsoul.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

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
	public  Msg insertGoodsModel(GoodsModel goodsModel,HttpServletRequest request,
								 @RequestParam(value="upLoadedImgUrl",required = false)MultipartFile file,
								 String goodDesc){

		Integer existUserId=(Integer)request.getSession().getAttribute("existUserId");

		//图片上传
		String upLoadedImgUrl = ImageUploadUtil.uploadImageCommon(file);
		System.out.println("url-----"+upLoadedImgUrl);
		if (existUserId==null){
			return Msg.fail();
		}
		int lastInsertId = goodsService.insert(goodsModel,existUserId,upLoadedImgUrl);

		//插入商品详情
		goodsService.insertGoodsDesc(goodDesc,lastInsertId);
		if (lastInsertId == 0){
			return Msg.fail();
		}

		return Msg.success();
	}


	/**
	 *@Description  插入商品记录不添加图片
	 *@params
	 *@author LemonLin
	 *@date  2018/2/28
	 */
	@RequestMapping("insertGoodsModelnotImg")
	@ResponseBody
	public  Msg insertGoodsModel(GoodsModel goodsModel,HttpServletRequest request){

		Integer existUserId=(Integer)request.getSession().getAttribute("existUserId");

		if (existUserId==null){
			return Msg.fail();
		}
		GoodsModel exitGoods = goodsService.insert(goodsModel,existUserId);
		if (exitGoods == null){
			return Msg.fail();
		}

		return Msg.success();
	}

	/**
	 *@Description  删除商品记录把商品状态设置为删除即可，不在数据库中做真正的删除操作
	 *@params
	 *@author LemonLin
	 *@date  2018/1/23
	 */
	@RequestMapping("deleteGoodsModel")
	@ResponseBody
	public Msg deleteByPrimaryKey(Integer goodsId) {
		goodsService.deleteByPrimaryKeySelective(goodsId);
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
	public Msg updateByExampleSelective(GoodsModel record,
										@RequestParam(value="upLoadedImgUrl",required = false)MultipartFile file) {
//		goodsService.updateByPrimaryKeySelective(record);

		//修改图片
		String upLoadedImgUrl = ImageUploadUtil.uploadImageCommon(file);
		goodsService.updateByExampleSelective(record,upLoadedImgUrl);
		return Msg.success();
	}

	@RequestMapping("testImgUpload")
	@ResponseBody
	public Msg testImgUpload(@RequestParam(value="imgUrl",required = true)MultipartFile file){
		String upLoadedImgUrl = ImageUploadUtil.uploadImageCommon(file);
		System.out.println(upLoadedImgUrl);
		return Msg.success();
	}


	@RequestMapping("showGoodsList")
	@ResponseBody
	public Msg showGoodsList(@RequestParam(value = "page",defaultValue = "1") Integer page,
							 @RequestParam(value = "rows",defaultValue = "30") Integer rows){

		PageInfo<GoodsModel> goodsModelList = goodsService.showGoodsList(page,rows);

		return Msg.success().add("goodsModelList",goodsModelList);
	}


	/**
	 *@Description 商品详情页的展示
	 *@params
	 *@author LemonLin
	 *@date  2018/3/6
	 */
	@RequestMapping("goodDesc")
	@ResponseBody
	public Msg showGoodsDesc(@RequestParam(value = "goodsId") Integer goodsId){

		//商品详情
		GoodsDescModel goodsDescById = goodsService.getGoodsDescById(goodsId);
		System.out.println("获取商品详情"+goodsDescById);
		//商品信息
		GoodsModel goodsModel = goodsService.selectByPrimaryKey(goodsId);

		return Msg.success().add("goodsModel",goodsModel).add("goodsDescById",goodsDescById);
	}


	/**
	 *@Description 商品搜索功能
	 *@params
	 *@author LemonLin
	 *@date  2018/3/6
	 */
	@RequestMapping("search")
	@ResponseBody
	public Msg searchGoodsList (@RequestParam(value = "page",defaultValue = "1") Integer page,
								@RequestParam(value = "title") String title){

		PageInfo<GoodsModel> goodsModelPageInfo = goodsService.searchGoods(title, page);
		return Msg.success().add("goodsModelPageInfo",goodsModelPageInfo);
	}

	/**
	 *@Description 商品分类搜索功能
	 *@params
	 *@author LemonLin
	 *@date  2018/3/6
	 */
	@RequestMapping("searchCategory")
	@ResponseBody
	public Msg searchGoodsList (@RequestParam(value = "page",defaultValue = "1") Integer page,
								@RequestParam(value = "category") Integer category){

		PageInfo<GoodsModel> goodsModelPageInfo = goodsService.searchGoodsByCategoryId(category,page);
		return Msg.success().add("goodsModelPageInfo",goodsModelPageInfo);
	}

}
