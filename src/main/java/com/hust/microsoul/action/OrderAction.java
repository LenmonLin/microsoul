package com.hust.microsoul.action;

import java.io.File;
import java.io.FileOutputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.github.pagehelper.PageInfo;
import com.hust.microsoul.model.BuyerModel;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.OrderModel;
import com.hust.microsoul.model.SellerModel;
import com.hust.microsoul.service.BuyerService;
import com.hust.microsoul.service.OrderService;
import com.hust.microsoul.util.MD5Utils;
import com.hust.microsoul.util.Msg;

/** 
 * @Description:OrderAction.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:23:44 
 * @version 1.0     ---
 */
@Controller
@RequestMapping("microsoul/order")
public class OrderAction {

	@Autowired
	private OrderService orderService;
	
	@Autowired
	private BuyerService buyerService;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	/**
	 * 
	 * @Description:买家下单
	 * @author: huwentao    
	 * @date:   2018年2月27日 下午2:17:30   
	 * @version V1.0
	 */
	@RequestMapping("create")
	public void buyerCreateOrder(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel
			,@RequestParam(value="goodsId",required=false)Integer[] goodsId
			,@RequestParam(value="nums",required=false)Integer[] nums){
		orderService.buyerCreateOrder(request, response, orderModel,goodsId,nums);
	}
	
	@RequestMapping("getOrderList")
	@ResponseBody
	public Msg getOrderList(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel
			,@RequestParam(value = "page",defaultValue = "1") Integer page,
			 @RequestParam(value = "rows",defaultValue = "5") Integer rows){
		try {
			
			Integer buyerId = (Integer)request.getSession().getAttribute("loginedBuyersID");
			
			SellerModel seller = (SellerModel)request.getSession().getAttribute("existUser");
			//orderModel.setBuyerId(buyerId);
			//测试使用
			orderModel.setBuyerId(1);
			//测试使用
//			if(buyerId!=null) {
//				orderModel.setBuyerId(buyerId);
//				
//			} else if(seller!=null){
//				orderModel.setSellerId(seller.getIdSeller());
//			} else {
//				return Msg.fail();
//			}
			PageInfo<OrderModel> orderList = orderService.getOrderList(page, rows, orderModel);
			return Msg.success().add("orderList",orderList);
		} catch (Exception e) {
			e.printStackTrace();
			return Msg.fail();
		}
	}
	
	/**
	 * @Description:买家删除订单
	 * @author: huwentao    
	 * @date:   2018年2月26日 下午3:04:30   
	 * @version V1.0
	 */
	@RequestMapping("delete")
	public void buyerDeleteOrder(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel) {
		orderService.buyerDeleteOrder(request, response, orderModel);
	}

	/**
	 * 
	 * @Description:卖家发货
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:02:38   
	 * @version V1.0
	 */
	@RequestMapping("sellersetlogisticid")
	public void sellerDeliveryGoods(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel) {
		orderService.sellerDeliveryGoods(request, response, orderModel);
	}

	/**
	 * 
	 * @Description:买家确认收货
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:15:11   
	 * @version V1.0
	 */
	@RequestMapping("buyerconfirmreceived")
	public void buyerConfirmReceived(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel) {
		orderService.buyerConfirmReceived(request, response, orderModel);
	}

	/**
	 * 
	 * @Description:买家申请退货
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:02:38   
	 * @version V1.0
	 */
	@RequestMapping("buyerreject")
	public void buyerRejectGoods(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel) {
		orderService.buyerRejectGoods(request, response, orderModel);
	}

	/**
	 * 
	 * @Description:卖家同意退货
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:11:46   
	 * @version V1.0
	 */
	@RequestMapping("sellerconfirmreject")
	public void sellerConfirmRejectGoods(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel) {
		orderService.sellerConfirmRejectGoods(request, response, orderModel);
	}

	/**
	 * 
	 * @Description:买家填写运单号
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:12:59   
	 * @version V1.0
	 */
	@RequestMapping("buyersetrejectlogistics")
	public void buyerSetRejectLogistics(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel) {
		orderService.buyerSetRejectLogistics(request, response, orderModel);
	}

	/**
	 * 
	 * @Description:卖家确认收到退货
	 * @author: huwentao    
	 * @date:   2018年3月5日 下午3:13:53   
	 * @version V1.0
	 */
	@RequestMapping("sellerreceivedrejected")
	public void sellerReceivedRejected(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel) {
		orderService.sellerReceivedRejected(request, response, orderModel);
	}

	@RequestMapping("cancelOrder")
	public void cancelOrder(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel) {
		orderService.cancelOrder(request, response, orderModel);
	}
	
	@RequestMapping("payOrder")
	public void payOrder(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel,SellerModel sellerModel,@RequestParam(value="orderId",required=false)Integer orderId) {
		orderService.buyerPayOrder(request, response, orderModel,sellerModel,orderId);
	}
	
	@RequestMapping("payOrderResult")
	public String payOrderResult(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel,@RequestParam(value="orderId",required=false)Integer orderId) {
		return orderService.payOrderResult(request, response, orderModel,orderId);
	}
	
	@RequestMapping("getOrderDetail")
	@ResponseBody
	public Msg getOrdergoods(HttpServletRequest request,HttpServletResponse response,@RequestParam(value="id")Integer id) {
		
		OrderModel orderModel = orderService.getOrderInfo(request, response, id);

		List<GoodsModel> goods= orderService.getOrdergoods(request, response, orderModel.getOrderId());
		orderModel.setGoods(goods);
		BuyerModel buyerModel = buyerService.getBuyerInfo(request, response);
		return Msg.success().add("orderModel", orderModel).add("buyerInfo", buyerModel);
	}
	
	@RequestMapping("uploadImage")
	public void uploadImage(HttpServletRequest request,HttpServletResponse response,OrderModel orderModel,@RequestParam(value="imgUrl",required = true)MultipartFile file) {
		String upLoadedImgUrl = uploadImageCommon(file,response);
		logger.error(upLoadedImgUrl);
	}
	
	private String uploadImageCommon(MultipartFile file ,HttpServletResponse response){
		String pictureUrl ="";


		try {
			if(null == file){
				return null;
			}
			
			//检测图片的类型是否符合规范
			String fileName = file.getOriginalFilename();
			String imgType = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			
			logger.info(file.getSize() + "--文件的大小");
			if (file.getSize() > 5 * 1024 * 1024) {
				logger.info("文件大小超过5M");
				return null;
			}
			
			fileName = getFileNewName(fileName);
			
			File uploadFile = new File("/WebRoot/pic/"+fileName);
			logger.info("*************************,getAbsolutePath:{}", uploadFile.getAbsolutePath());
			FileOutputStream fos = FileUtils.openOutputStream(uploadFile);
			IOUtils.copy( file.getInputStream(), fos); 
			return uploadFile.getAbsolutePath();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pictureUrl;
	}
	
	private String getFileNewName(String filename){
		
		long time = System.currentTimeMillis();
		
		String fileType = filename.substring(filename.lastIndexOf("."));
		
		MD5Utils md5 = new MD5Utils();
		
		return md5.md5(filename + time) + fileType;
	}
}
