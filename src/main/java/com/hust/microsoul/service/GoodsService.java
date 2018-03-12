package com.hust.microsoul.service;


import com.github.pagehelper.PageInfo;
import com.hust.microsoul.model.GoodsDescModel;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.GoodsModelExample;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author lemonLin
 * @Description :GoodsService
 * @date 2018/1/23-11:02
 */

@Service
public interface GoodsService {

    /**
     *@Description 添加商品图片上传
     *@params
     *@author LemonLin
     *@date  2018/2/28
     */
    public GoodsModel insert(GoodsModel record,Integer sellerId,String upLoadedImgUrl);


    //添加商品不上传图片
    public GoodsModel insert(GoodsModel record,Integer sellerId);
    public List<GoodsModel> selectByCriteria(GoodsModelExample example);

    public  int deleteByPrimaryKeySelective(Integer goodsId);

    public int updateByPrimaryKeySelective(GoodsModel record);


    public int updateByExampleSelective(GoodsModel record);

    GoodsModel selectByPrimaryKey(Integer goodsId);

    public void HelloWorld(HttpServletRequest request, HttpServletResponse response);

    /**
     *@Description 查询商品列表
     *@params  page=当前页，rows=每一页显示的记录数
     *@author LemonLin
     *@date  2018/2/27
     */
    public PageInfo<GoodsModel> showGoodsList(Integer page, Integer rows);

    //商品详情页的展示
    public GoodsDescModel getGoodsDescById(long goodsId);


    public PageInfo<GoodsModel> searchGoods(String title,Integer page);

    public PageInfo<GoodsModel> searchGoodsByCategoryId(Integer category,Integer page);
}
