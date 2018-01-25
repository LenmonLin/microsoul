package com.hust.microsoul.mapper;

import com.hust.microsoul.model.Ad_info_tableModel;
import com.hust.microsoul.model.Ad_info_tableModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface Ad_info_tableModelMapper {
    long countByExample(Ad_info_tableModelExample example);

    int deleteByExample(Ad_info_tableModelExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Ad_info_tableModel record);

    int insertSelective(Ad_info_tableModel record);

    List<Ad_info_tableModel> selectByExample(Ad_info_tableModelExample example);

    Ad_info_tableModel selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Ad_info_tableModel record, @Param("example") Ad_info_tableModelExample example);

    int updateByExample(@Param("record") Ad_info_tableModel record, @Param("example") Ad_info_tableModelExample example);

    int updateByPrimaryKeySelective(Ad_info_tableModel record);

    int updateByPrimaryKey(Ad_info_tableModel record);
}