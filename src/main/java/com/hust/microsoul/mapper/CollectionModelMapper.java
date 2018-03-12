package com.hust.microsoul.mapper;

import com.hust.microsoul.model.CollectionModel;
import com.hust.microsoul.model.CollectionModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface CollectionModelMapper {
    long countByExample(CollectionModelExample example);

    int deleteByExample(CollectionModelExample example);

    int deleteByPrimaryKey(@Param("buyerId") Integer buyerId,@Param("goodsId")Integer goodsId);

    int insert(CollectionModel record);

    int insertSelective(CollectionModel record);

    List<CollectionModel> selectByExample(CollectionModelExample example);

    CollectionModel selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") CollectionModel record, @Param("example") CollectionModelExample example);

    int updateByExample(@Param("record") CollectionModel record, @Param("example") CollectionModelExample example);

    int updateByPrimaryKeySelective(CollectionModel record);

    int updateByPrimaryKey(CollectionModel record);
    
    List<CollectionModel> getcollectionList (CollectionModel collectionModel);
}