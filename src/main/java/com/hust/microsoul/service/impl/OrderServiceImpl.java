package com.hust.microsoul.service.impl;

import com.alibaba.fastjson.JSONObject;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hust.microsoul.mapper.GoodsModelMapper;
import com.hust.microsoul.mapper.OrderGoodsMapper;
import com.hust.microsoul.mapper.OrderMapper;
import com.hust.microsoul.mapper.SellerModelMapper;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.OrderGoodsModel;
import com.hust.microsoul.model.OrderModel;
import com.hust.microsoul.model.SellerModel;
import com.hust.microsoul.service.OrderService;
import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.JSONCommon;
import com.hust.microsoul.util.OrderStateCode;
import com.hust.microsoul.util.PaymentUtil;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/** 
 * @Description:OrderServiceImpl.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:19:55 
 * @version 1.0  
 */

@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderMapper orderMapper;
	
	@Autowired
	private SellerModelMapper sellerModelMapper;
	
	@Autowired
	private OrderGoodsMapper orderGoodsMapper;
	
	@Autowired
	private GoodsModelMapper goodsModelMapper;
	
	private Logger Logger = LoggerFactory.getLogger(this.getClass());
	/**
	 * @Description:
	 * @author:huwentao
	 * @date:2018年2月26日
	 * @param:     
	 * @return:
	 * @version 1.0  
	 */
	@Override
	public void buyerCreateOrder(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel,Integer[] goodsId,Integer[] nums) {
		try {
			Integer buyerId = (Integer)request.getSession().getAttribute("loginedBuyersID");
			
			//测试使用
			orderModel.setBuyerId(buyerId);
			Logger.error(":"+orderModel.getBuyerId());
			orderModel.setOrderTime(new Date(System.currentTimeMillis()));
			orderModel.setState(OrderStateCode.UNPAID);
			Logger.error(":"+(orderMapper==null));
			int insertResult = orderMapper.buyerCreateOrder(orderModel);
			
			System.out.println("自增id是："+orderModel.getOrderId());
			if(insertResult>0) {
				Logger.error("插入订单成功！");
				OrderGoodsModel orderGoodsModel = new OrderGoodsModel();
				Integer id = null;
				for (int i = 0; i < goodsId.length; i++) {
					orderGoodsModel.setGoodsId(goodsId[i]);
					orderGoodsModel.setNum(nums[i]);
					orderGoodsModel.setOrderId(orderModel.getOrderId());
					id = orderGoodsMapper.insertOrderGoods(orderGoodsModel);
				}
				JSONObject jsonObject = new JSONObject();
				jsonObject.put("orderId", id);
				JSONCommon.outputResultDataJson(CommonCode.SUCCESS, response, jsonObject);
			} else {
				JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
			}
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
		}
		
	}
	/**
	 * @Description:买家和卖家查询订单列表
	 * @author:huwentao
	 * @date:2018年2月26日
	 * @param:     
	 * @return:
	 * @version 1.0  
	 */
	@Override
	public PageInfo<OrderModel> getOrderList(Integer page, Integer rows,OrderModel orderModel){
		
		 //设置分页信息
        PageHelper.startPage(page,rows);
        //执行查询
        List<OrderModel> orderList = orderMapper.getOrderList(orderModel);
        
        for (OrderModel order : orderList) {
			List<GoodsModel> goods = goodsModelMapper.getOrderGoodsList(order.getOrderId());
			order.setGoods(goods);
		}
        //返回查询结果
        PageInfo pageInfo = new PageInfo(orderList);

        return pageInfo;
	}
	/**
	 * @Description:
	 * @author:huwentao
	 * @date:2018年2月26日
	 * @param:     
	 * @return:
	 * @version 1.0  
	 */
	@Override
	public void buyerPayOrder(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel,SellerModel sellerModel,Integer[] orderIds) {
		
		SellerModel sellerModel2  = sellerModelMapper.selectByPrimaryKey(sellerModel.getIdSeller());
		String ids ="";
		for (int i = 0; i < orderIds.length; i++) {
			if(i<orderIds.length-1) {
				ids +=orderIds[i]+",";
			}else {
				ids +=orderIds[i];
			}
		}
		String 	p0_Cmd="Buy",
		p1_MerId=sellerModel2.getMerid(),
		p2_Order="",
		p3_Amt=orderModel.getTotalPrice().toString(),
		p4_Cur="CNY",
		p5_Pid="",
		p6_Pcat="",	
		p7_Pdesc="",
		p8_Url="http://localhost:8080/microsoul/order/payOrderResult.do?"+"orderIds="+ids,
		p9_SAF="",
		pa_MP="",
		pd_FrpId=request.getParameter("pd_FrpId"),
		pr_NeedResponse="1";
		String keyValue=sellerModel2.getMerkey();
		String hmac=PaymentUtil.buildHmac(p0_Cmd, p1_MerId, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, keyValue);
		String url="https://www.yeepay.com/app-merchant-proxy/node?"+
		"&p0_Cmd="+p0_Cmd+
		"&p1_MerId="+p1_MerId+
		"&p2_Order="+p2_Order+
		"&p3_Amt="+p3_Amt+
		"&p4_Cur="+p4_Cur+
		"&p5_Pid="+p5_Pid+
		"&p6_Pcat="+p6_Pcat+
		"&p7_Pdesc="+p7_Pdesc+
		"&p8_Url="+p8_Url+
		"&p9_SAF="+p9_SAF+
		"&pa_MP="+pa_MP+
		"&pd_FrpId="+pd_FrpId+
		"&pr_NeedResponse="+pr_NeedResponse+
		"&hmac="+hmac;
		try {
			response.sendRedirect(url);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * @Description:
	 * @author:huwentao
	 * @date:2018年2月26日
	 * @param:     
	 * @return:
	 * @version 1.0  
	 */
	@Override
	@Transactional
	public void buyerDeleteOrder(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		try {
			OrderGoodsModel orderGoodsModel = new OrderGoodsModel();
			orderGoodsModel.setGoodsId(orderModel.getOrderId());
			orderGoodsMapper.deleteOrderGoods(orderGoodsModel);
			orderMapper.deleteOrder(orderModel);
			JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
		}
		
	}

	/**
	 * @Description:
	 * @author:huwentao
	 * @date:2018年2月26日
	 * @param:     
	 * @return:
	 * @version 1.0  
	 */
	@Override
	public void buyerUpdateOrderState(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		try {
			orderModel.setState(OrderStateCode.UNDELIVERY);
			
			int updateResult = orderMapper.updateOrderState(orderModel);
			
			if(updateResult>0) {
				JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
			} else {
				JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
			}
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
		}
		
	}
	@Override
	public void sellerDeliveryGoods(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		try {
			orderModel.setState(OrderStateCode.UNRECEIVE);
			orderModel.setDeliverTime(new Date(System.currentTimeMillis()));
			int updateResult = orderMapper.setLogisticId(orderModel);
			if(updateResult>0) {
				JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
			} else {
				JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
			}
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
		}
	}
	@Override
	public void buyerConfirmReceived(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		try {
			orderModel.setState(OrderStateCode.DONE);
			
			int updateResult = orderMapper.updateOrderState(orderModel);
			
			if(updateResult>0) {
				JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
			} else {
				JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
			}
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
		}
	}
	@Override
	public void buyerRejectGoods(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		try {
			orderModel.setState(OrderStateCode.BUYERREJECTE);
			
			int updateResult = orderMapper.updateOrderState(orderModel);
			
			if(updateResult>0) {
				JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
			} else {
				JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
			}
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
		}
	}
	
	@Override
	public void sellerConfirmRejectGoods(HttpServletRequest request, HttpServletResponse response,
			OrderModel orderModel) {
		try {
			orderModel.setState(OrderStateCode.SELLER_CONFIRM_REJECTED);
			
			int updateResult = orderMapper.updateOrderState(orderModel);
			
			if(updateResult>0) {
				JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
			} else {
				JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
			}
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
		}
	}
	@Override
	public void buyerSetRejectLogistics(HttpServletRequest request, HttpServletResponse response,
			OrderModel orderModel) {
		try {
			orderModel.setState(OrderStateCode.BUYERREJECTED);
			
			int updateResult = orderMapper.setLogisticIdReject(orderModel);
			
			if(updateResult>0) {
				JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
			} else {
				JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
			}
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
		}
	}
	@Override
	public void sellerReceivedRejected(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		try {
			orderModel.setState(OrderStateCode.DONE);
			
			int updateResult = orderMapper.updateOrderState(orderModel);
			
			if(updateResult>0) {
				JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
			} else {
				JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
			}
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
		}
	}
	@Override
	public void cancelOrder(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel) {
		try {
			orderModel.setState(OrderStateCode.CANCEL);
			
			int updateResult = orderMapper.updateOrderState(orderModel);
			
			if(updateResult>0) {
				JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
			} else {
				JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
			}
		} catch (Exception e) {
			JSONCommon.outputResultCodeJson(CommonCode.SERVER_ERROR, response);
			e.printStackTrace();
		}
	}
	@Override
	public String payOrderResult(HttpServletRequest request, HttpServletResponse response, OrderModel orderModel,String orderIds) {
		try {
			String[] ids = orderIds.split(",");
			for (int i = 0; i < ids.length; i++) {
				orderModel.setState(OrderStateCode.UNDELIVERY);
				orderModel.setPayId(request.getParameter("r6_Order"));
				orderModel.setOrderId(Integer.parseInt(ids[i]));
				orderMapper.updateOrderState(orderModel);
			}
			return "paysuccess";
		} catch (Exception e) {
			e.printStackTrace();
			return "payfail";
		}
	}

}
