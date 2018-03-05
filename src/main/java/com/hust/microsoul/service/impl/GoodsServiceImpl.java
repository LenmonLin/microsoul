package com.hust.microsoul.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hust.microsoul.mapper.GoodsModelMapper;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.GoodsModelExample;
import com.hust.microsoul.service.GoodsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * @author LemonLin
 * @Description :GoodsServiceImpl
 * @date 2018/1/23-14:18
 */

@Service
public class GoodsServiceImpl  implements GoodsService{

    //注入dao层
    @Autowired
    private GoodsModelMapper goodsModelMapper;


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
    public GoodsModel  insert(GoodsModel goodsModel) {


        //1、补全goodsModel的属性
/*        goodsModel.setGoodsName(goodsModel.getGoodsName());
        goodsModel.setUnitPrice(goodsModel.getUnitPrice());
        goodsModel.setCategory(goodsModel.getCategory());
        goodsModel.setStore(goodsModel.getStore());
        goodsModel.setSellerId(goodsModel.getSellerId());*/

        //1、判断必须属性是否传入，没有返回空，有的话，返回goodsModel，
        //这里不用重新get之后再set,因为最后插入的是insert(goodsModel)
        //所以model附带进来的属性就都能插入
        if((goodsModel.getGoodsName()==null)||
                (goodsModel.getUnitPrice()==null)||
                (goodsModel.getCategory()==null)||
                (goodsModel.getStore()==null)||
                (goodsModel.getSellerId()==null)){
            return null;
        }
        /*java.sql.Date只包含年月日信息
            java.util.Date 包含年月日时分秒毫秒
        */
        goodsModel.setCreated(new Date());
        goodsModel.setUpdated(new Date());

        //设置商品的状态，1在售2下架3删除
        goodsModel.setStatus(1);

        //2、向商品表插入数据
        goodsModelMapper.insert(goodsModel);
        //3、返回结果

        return goodsModel;
    }

    /**
     *@Description  删除商品记录把商品状态设置为删除即可，不在数据库中做真正的删除操作
     *@params
     *@author LemonLin
     *@date  2018/1/23
     */
    @Override
    public int deleteByPrimaryKeySelective(Integer goodsId) {

        //从数据库中查询到需要删除的商品记录
        GoodsModel goodsModel = goodsModelMapper.selectByPrimaryKey(goodsId);

            /*商品状态1在售2下架3删除*/
            //设置商品状态为3
        goodsModel.setStatus(3);

        //更新数据
        return goodsModelMapper.updateByPrimaryKeySelective(goodsModel);
    }
    /**
     *@Description 更新商品记录方法1，写法繁琐，但是可用于更新用户信息时，不更改密码的情况
     *@params
     *@author LemonLin
     *@date  2018/1/23
     */
    @Override
    public int updateByPrimaryKeySelective(GoodsModel record) {

        //从数据库中搜索对应的商品记录
        GoodsModel goodsModel = goodsModelMapper.selectByPrimaryKey(record.getGoodsId());

        //更新该商品记录的变量
        goodsModel.setGoodsName(record.getGoodsName());
        goodsModel.setTitle(record.getTitle());
        goodsModel.setSellpoint(record.getSellpoint());
        goodsModel.setUnitPrice(record.getUnitPrice());
        goodsModel.setPurchaseQuantity(record.getPurchaseQuantity());
        goodsModel.setBarcode(record.getBarcode());
        goodsModel.setImageUrl(record.getImageUrl());
        goodsModel.setCategory(record.getCategory());
        goodsModel.setStore(record.getStore());
        goodsModel.setDetail(record.getDetail());
        goodsModel.setDiscount(record.getDiscount());
        goodsModel.setStatus(record.getStatus());
        goodsModel.setSellerId(record.getSellerId());
        goodsModel.setUpdated(new Date());
        //更新该记录到数据库
        return goodsModelMapper.updateByPrimaryKeySelective(goodsModel);
    }

    /**
     *@Description 更新商品记录方法2
     *@params
     *@author LemonLin
     *@date  2018/3/1
     */
    public int updateByExampleSelective(GoodsModel record){
        GoodsModelExample goodsModelExample = new GoodsModelExample();

        GoodsModelExample.Criteria criteria = goodsModelExample.createCriteria();

        criteria.andGoodsIdEqualTo(record.getGoodsId());

        return goodsModelMapper.updateByExampleSelective(record,goodsModelExample);
    }

    @Override
    public GoodsModel selectByPrimaryKey(Integer goodsId) {
        return goodsModelMapper.selectByPrimaryKey(goodsId);
    }

    /**
     *@Description 查询商品列表
     *@params  page=当前页，rows=每一页显示的记录数，返回结果的pageInfo已经对goodsModelist进行了包装
     *@author LemonLin
     *@date  2018/2/27
     */
    @Override
    public PageInfo<GoodsModel> showGoodsList(Integer page, Integer rows) {
        //设置分页信息
        PageHelper.startPage(page,rows);
        //执行查询
        GoodsModelExample goodsModelExample = new GoodsModelExample();

        //商品状态为删除的不显示
        GoodsModelExample.Criteria criteria = goodsModelExample.createCriteria();
        criteria.andStatusNotEqualTo(3);

        List<GoodsModel> goodsModelList = goodsModelMapper.selectByExample(goodsModelExample);
        //返回查询结果
        PageInfo pageInfo = new PageInfo(goodsModelList);

        return pageInfo;
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
}
