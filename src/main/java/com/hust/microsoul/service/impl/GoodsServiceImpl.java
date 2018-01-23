package com.hust.microsoul.service.impl;

import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.GoodsModelExample;
import com.hust.microsoul.service.GoodsService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author LemonLin
 * @Description :GoodsServiceImpl
 * @date 2018/1/23-14:18
 */
public class GoodsServiceImpl  implements GoodsService{


    @Override
    public void HelloWorld(HttpServletRequest request, HttpServletResponse response) {

    }

    /**
     *@Description 插入商品记录
     *@params
     *@author LemonLin
     *@date  2018/1/23
     */
    @Override
    public int insert(GoodsModel record) {
        return 0;
    }

    /**
     *@Description 搜索商品
     *@params
     *@author LemonLin
     *@date  2018/1/23
     */
    @Override
    public List<GoodsModel> selectByCriteria(GoodsModelExample example) {
        return null;
    }

    /**
     *@Description  删除商品记录
     *@params
     *@author LemonLin
     *@date  2018/1/23
     */
    @Override
    public int deleteByPrimaryKey(Integer goodsId) {
        return 0;
    }
    /**
     *@Description 更新商品记录
     *@params
     *@author LemonLin
     *@date  2018/1/23
     */
    @Override
    public int updateByPrimaryKey(GoodsModel record) {
        return 0;
    }



}
