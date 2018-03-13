package com.hust.microsoul.mapper;

import com.hust.microsoul.model.GoodsDescModel;
import com.hust.microsoul.model.GoodsDescModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface GoodsDescModelMapper {
    long countByExample(GoodsDescModelExample example);

    int deleteByExample(GoodsDescModelExample example);

    int deleteByPrimaryKey(Integer goodDescId);

    int insert(GoodsDescModel record);

    int insertSelective(GoodsDescModel record);

    List<GoodsDescModel> selectByExampleWithBLOBs(GoodsDescModelExample example);

    List<GoodsDescModel> selectByExample(GoodsDescModelExample example);

    GoodsDescModel selectByPrimaryKey(Integer goodDescId);

    int updateByExampleSelective(@Param("record") GoodsDescModel record, @Param("example") GoodsDescModelExample example);

    int updateByExampleWithBLOBs(@Param("record") GoodsDescModel record, @Param("example") GoodsDescModelExample example);

    int updateByExample(@Param("record") GoodsDescModel record, @Param("example") GoodsDescModelExample example);

    int updateByPrimaryKeySelective(GoodsDescModel record);

    int updateByPrimaryKeyWithBLOBs(GoodsDescModel record);

    int updateByPrimaryKey(GoodsDescModel record);
}