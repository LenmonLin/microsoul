package com.hust.microsoul.mapper;

import com.hust.microsoul.model.CollectionModel;
import com.hust.microsoul.model.GoodsModel;
import com.hust.microsoul.model.GoodsModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GoodsModelMapper {
    long countByExample(GoodsModelExample example);

    int deleteByExample(GoodsModelExample example);

    int deleteByPrimaryKey(Integer goodsId);

    int insert(GoodsModel record);

    int insertSelective(GoodsModel record);

    List<GoodsModel> selectByExample(GoodsModelExample example);

    GoodsModel selectByPrimaryKey(Integer goodsId);

    int updateByExampleSelective(@Param("record") GoodsModel record, @Param("example") GoodsModelExample example);

    int updateByExample(@Param("record") GoodsModel record, @Param("example") GoodsModelExample example);

    int updateByPrimaryKeySelective(GoodsModel record);

    int updateByPrimaryKey(GoodsModel record);
    
    List<GoodsModel> getcollectionList (CollectionModel collectionModel);
    
    List<GoodsModel>  getOrderGoodsList(@Param(value = "orderId")Integer orderId);
}