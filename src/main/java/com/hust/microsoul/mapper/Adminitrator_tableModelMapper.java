package com.hust.microsoul.mapper;

import com.hust.microsoul.model.Adminitrator_tableModel;
import com.hust.microsoul.model.Adminitrator_tableModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface Adminitrator_tableModelMapper {
    long countByExample(Adminitrator_tableModelExample example);

    int deleteByExample(Adminitrator_tableModelExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(Adminitrator_tableModel record);

    int insertSelective(Adminitrator_tableModel record);

    List<Adminitrator_tableModel> selectByExample(Adminitrator_tableModelExample example);

    Adminitrator_tableModel selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") Adminitrator_tableModel record, @Param("example") Adminitrator_tableModelExample example);

    int updateByExample(@Param("record") Adminitrator_tableModel record, @Param("example") Adminitrator_tableModelExample example);

    int updateByPrimaryKeySelective(Adminitrator_tableModel record);

    int updateByPrimaryKey(Adminitrator_tableModel record);
}