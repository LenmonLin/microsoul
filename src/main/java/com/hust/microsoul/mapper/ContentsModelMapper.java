package com.hust.microsoul.mapper;

import com.hust.microsoul.model.ContentsModel;
import com.hust.microsoul.model.ContentsModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface ContentsModelMapper {
    long countByExample(ContentsModelExample example);

    int deleteByExample(ContentsModelExample example);

    int deleteByPrimaryKey(Integer contentId);

    int insert(ContentsModel record);

    int insertSelective(ContentsModel record);

    List<ContentsModel> selectByExampleWithBLOBs(ContentsModelExample example);

    List<ContentsModel> selectByExample(ContentsModelExample example);

    ContentsModel selectByPrimaryKey(Integer contentId);

    int updateByExampleSelective(@Param("record") ContentsModel record, @Param("example") ContentsModelExample example);

    int updateByExampleWithBLOBs(@Param("record") ContentsModel record, @Param("example") ContentsModelExample example);

    int updateByExample(@Param("record") ContentsModel record, @Param("example") ContentsModelExample example);

    int updateByPrimaryKeySelective(ContentsModel record);

    int updateByPrimaryKeyWithBLOBs(ContentsModel record);

    int updateByPrimaryKey(ContentsModel record);
}