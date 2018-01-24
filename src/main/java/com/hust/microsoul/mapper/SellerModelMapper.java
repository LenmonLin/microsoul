package com.hust.microsoul.mapper;

import com.hust.microsoul.model.SellerModel;
import com.hust.microsoul.model.SellerModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface SellerModelMapper {
    long countByExample(SellerModelExample example);

    int deleteByExample(SellerModelExample example);

    int deleteByPrimaryKey(Integer idSeller);

    int insert(SellerModel record);

    int insertSelective(SellerModel record);

    List<SellerModel> selectByExample(SellerModelExample example);

    SellerModel selectByPrimaryKey(Integer idSeller);

    int updateByExampleSelective(@Param("record") SellerModel record, @Param("example") SellerModelExample example);

    int updateByExample(@Param("record") SellerModel record, @Param("example") SellerModelExample example);

    int updateByPrimaryKeySelective(SellerModel record);

    int updateByPrimaryKey(SellerModel record);
}