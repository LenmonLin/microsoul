package com.hust.microsoul.mapper;

import com.hust.microsoul.model.Order_tableModel;
import com.hust.microsoul.model.Order_tableModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface Order_tableModelMapper {
    long countByExample(Order_tableModelExample example);

    int deleteByExample(Order_tableModelExample example);

    int deleteByPrimaryKey(Integer orderId);

    int insert(Order_tableModel record);

    int insertSelective(Order_tableModel record);

    List<Order_tableModel> selectByExample(Order_tableModelExample example);

    Order_tableModel selectByPrimaryKey(Integer orderId);

    int updateByExampleSelective(@Param("record") Order_tableModel record, @Param("example") Order_tableModelExample example);

    int updateByExample(@Param("record") Order_tableModel record, @Param("example") Order_tableModelExample example);

    int updateByPrimaryKeySelective(Order_tableModel record);

    int updateByPrimaryKey(Order_tableModel record);
}