package com.hust.microsoul.action;

import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.service.GoodsService;
import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.CookieUtils;
import com.hust.microsoul.util.JSONCommon;
import com.hust.microsoul.util.JsonUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * @author LemonLin
 * @Description :购物车的相关操作
 * @date 2018/2/24-10:42
 */

@Controller
@RequestMapping("microsoul/cart")
public class CartAction {

    @Value("${CART_KEY}")
    private String CART_KEY;
    @Value("${CART_EXPIER}")
    private Integer CART_EXPIER;

    @Autowired
    private GoodsService goodsService;

    /**
     *@Description 从cookie中获取购物车列表
     *@params
     *@author LemonLin
     *@date  2018/2/24
     */
    private List<GoodsModel> getCartGoodsList(HttpServletRequest request){
        String json = CookieUtils.getCookieValue(request,CART_KEY,true);
        if (StringUtils.isBlank(json)){
            //如果cookie中没有这个对应的KEY,新建列表
            return  new ArrayList<>();
        }
        List<GoodsModel> list = JsonUtils.jsonToList(json,GoodsModel.class);
        return list;
    }

    //购物车总计,放到前端处理
//    private  Integer total;

    @RequestMapping("/addCartItem")
    public void addCartItem(@RequestParam(value = "goodsId") Integer goodsId,
                            @RequestParam(value = "purchaseQuantity") Integer purchaseQuantity,
                            HttpServletResponse response, HttpServletRequest request){

        //从cookie中取购物车列表
        List<GoodsModel>  cartGoodsList = getCartGoodsList(request);
        //判断商品在购物车中存在，增加数量
        boolean flag = false;
        for (GoodsModel goodsModel :cartGoodsList){
            //都是包装数据类型比较的时候比较的是内存地址，当其中一个为值得时候比较得才是值：
            if (goodsModel.getGoodsId() == goodsId.longValue()){
                goodsModel.setPurchaseQuantity(goodsModel.getPurchaseQuantity()+purchaseQuantity);
                flag= true;
                break;
            }
        }
        //如果不存在，就添加一个新的商品
        if (!flag){
            //查询数据库中对应得id得货物信息
            GoodsModel goodsModel = goodsService.selectByPrimaryKey(goodsId);
            //设置购买得数量，
            goodsModel.setPurchaseQuantity(purchaseQuantity);
            //添加到购物车列表中
            //不能放在if的外面，因为当购物车列表中如果存在的话，就不需要重新添加到购物车车列表中。
            cartGoodsList.add(goodsModel);
        }
        //把购物车列表写入cookie中去
        CookieUtils.setCookie(request,response,CART_KEY,JsonUtils.objectToJson(cartGoodsList),
                CART_EXPIER,true);


        JSONCommon.outputResultCodeJson(CommonCode.SUCCESS,response);
    }

    //删除购物车列表中的购物项
    @RequestMapping("/delete")
    public void deleteCartItem(@RequestParam(value = "goodsId")Integer goodsId,
                               HttpServletRequest request,HttpServletResponse response){
        //从cookie中去购物车列表
        List<GoodsModel> goodsModelList = getCartGoodsList(request);
        //寻找到对应的购物项，把它删除，这里用到是列表删除remove

        for (GoodsModel goodsModel : goodsModelList){
            if (goodsModel.getGoodsId() ==goodsId.longValue()){
                //删除商品
                goodsModelList.remove(goodsModel);
                break;
            }
        }
        //重新把列表添加到cookie中去
        CookieUtils.setCookie(request,response,CART_KEY,JsonUtils.objectToJson(goodsModelList),
                CART_EXPIER,true);

        JSONCommon.outputResultCodeJson(CommonCode.SUCCESS,response);
    }


    //修改购物车列表上的数量
    @RequestMapping("update")
    public void updateCartList(@RequestParam(value = "goodsId") Integer goodsId,
                               @RequestParam(value = "purchaseQuantity") Integer purchaseQuantity,
                               HttpServletRequest request,HttpServletResponse response){
        //从cookie中取出购物车列表
        List<GoodsModel> goodsModelList =getCartGoodsList(request);
        //找到对应的购物项，修改数量
        for (GoodsModel goodsModel :goodsModelList){
            if (goodsModel.getGoodsId() == goodsId.longValue()){
                goodsModel.setPurchaseQuantity(purchaseQuantity);
                break;
            }
        }

        //把购物车列表添加到cookie当中去
        CookieUtils.setCookie(request,response,CART_KEY,JsonUtils.objectToJson(goodsModelList),
                CART_EXPIER,true);

        JSONCommon.outputResultCodeJson(CommonCode.SUCCESS,response);
    }

    //显示购物车列表，
    @RequestMapping("/cartList")
    public void showCartList(HttpServletRequest request,HttpServletResponse response){
        //从cookie中取出购物车列表
        List<GoodsModel> goodsModelList = getCartGoodsList(request);
        //存放到request中去，这样前端就能够获得了
        request.setAttribute("goodsModelList",goodsModelList);

        JSONCommon.outputResultCodeJson(CommonCode.SUCCESS,response);
    }
}