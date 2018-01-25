package com.hust.microsoul.mapper;

import com.hust.microsoul.model.Order_goods_tableModel;
import com.hust.microsoul.model.Order_goods_tableModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface Order_goods_tableModelMapper {
    long countByExample(Order_goods_tableModelExample example);

    int deleteByExample(Order_goods_tableModelExample example);

    int deleteByPrimaryKey(Integer orderGoodsId);

    int insert(Order_goods_tableModel record);

    int insertSelective(Order_goods_tableModel record);

    List<Order_goods_tableModel> selectByExample(Order_goods_tableModelExample example);

    Order_goods_tableModel selectByPrimaryKey(Integer orderGoodsId);

    int updateByExampleSelective(@Param("record") Order_goods_tableModel record, @Param("example") Order_goods_tableModelExample example);

    int updateByExample(@Param("record") Order_goods_tableModel record, @Param("example") Order_goods_tableModelExample example);

    int updateByPrimaryKeySelective(Order_goods_tableModel record);

    int updateByPrimaryKey(Order_goods_tableModel record);
}