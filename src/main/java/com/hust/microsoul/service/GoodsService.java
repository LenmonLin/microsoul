package com.hust.microsoul.service;


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

    public int insert(GoodsModel record);

    public List<GoodsModel> selectByCriteria(GoodsModelExample example);

    public  int deleteByPrimaryKey(Integer goodsId);

    public int updateByPrimaryKey(GoodsModel record);

    public void HelloWorld(HttpServletRequest request, HttpServletResponse response);
}
