package com.hust.microsoul.mapper;

import com.hust.microsoul.model.CollectionModel;
import com.hust.microsoul.model.CollectionModelExample;
import com.hust.microsoul.model.CollectionModelKey;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CollectionModelMapper {
    long countByExample(CollectionModelExample example);

    int deleteByExample(CollectionModelExample example);

    int deleteByPrimaryKey(CollectionModelKey key);

    int insert(CollectionModel record);

    int insertSelective(CollectionModel record);

    List<CollectionModel> selectByExample(CollectionModelExample example);

    CollectionModel selectByPrimaryKey(CollectionModelKey key);

    int updateByExampleSelective(@Param("record") CollectionModel record, @Param("example") CollectionModelExample example);

    int updateByExample(@Param("record") CollectionModel record, @Param("example") CollectionModelExample example);

    int updateByPrimaryKeySelective(CollectionModel record);

    int updateByPrimaryKey(CollectionModel record);
}