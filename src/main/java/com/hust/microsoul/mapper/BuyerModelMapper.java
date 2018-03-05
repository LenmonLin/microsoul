package com.hust.microsoul.mapper;

import com.hust.microsoul.model.BuyerModel;
import com.hust.microsoul.model.BuyerModelExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface BuyerModelMapper {
    long countByExample(BuyerModelExample example);

    int deleteByExample(BuyerModelExample example);

    int deleteByPrimaryKey(Integer buyersId);

    int insert(BuyerModel record);

    int insertSelective(BuyerModel record);

    List<BuyerModel> selectByExample(BuyerModelExample example);

    BuyerModel selectByPrimaryKey(Integer buyersId);

    int updateByExampleSelective(@Param("record") BuyerModel record, @Param("example") BuyerModelExample example);

    int updateByExample(@Param("record") BuyerModel record, @Param("example") BuyerModelExample example);

    int updateByPrimaryKeySelective(BuyerModel record);

    int updateByPrimaryKey(BuyerModel record);
    
    public String buyerLogin(String accountName); 
    
    public BuyerModel checkaccountName(String accountName);
    
    public void buyerRegister(BuyerModel buyerModel) ;
    
    public void modifyBuyersPsw(@Param(value="newpsw")String newpsw,@Param(value="buyersId")Integer buyersId);
    
    public int disableBuyer(Integer buyersId);
		
}