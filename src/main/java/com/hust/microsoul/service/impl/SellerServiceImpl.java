package com.hust.microsoul.service.impl;

import com.hust.microsoul.mapper.SellerModelMapper;
import com.hust.microsoul.model.SellerModel;
import com.hust.microsoul.model.SellerModelExample;
import com.hust.microsoul.service.SellerService;
import com.hust.microsoul.util.MD5Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author lemonLin
 * @Description :SellerServiceImpl
 * @date 2018/1/23-10:41
 */

@Service
public class SellerServiceImpl implements SellerService{

    @Autowired
    SellerModelMapper sellerModelMapper;


    @Override
    public void sellerLogin(HttpServletRequest request, HttpServletResponse response) {


    }

    @Override
    public void sellerRegister(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void sellerInfo(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void disableSeller(HttpServletRequest request, HttpServletResponse response) {

    }

    @Override
    public void sellerChangePassword(HttpServletRequest request, HttpServletResponse response) {

    }

    /**
     *@Description 判断用户名是否数据中已经存在
     *@params
     *@author LemonLin
     *@date  2018/1/24
     */
    @Override
    public SellerModel checkSeller(String accountName) {

        SellerModelExample sellerModelExample = new SellerModelExample();

        SellerModelExample.Criteria criteriaSeller = sellerModelExample.createCriteria();

        criteriaSeller.andAccountNameEqualTo(accountName);

        List<SellerModel> sellerModels = sellerModelMapper.selectByExample(sellerModelExample);

        if (sellerModels != null && sellerModels.size()>0){
            return sellerModels.get(0);
        }
        return null;
    }

    /**
     *@Description 保存用户，密码需要加密
     *@params
     *@author LemonLin
     *@date  2018/1/24
     */
    @Override
    //@Transactional //加事物
    public void insert(SellerModel sellerModel) {
        String pwd = sellerModel.getPassword();

        //给密码加密
        sellerModel.setPassword(MD5Utils.md5(pwd));
        //用户的状态默认师1状态
        sellerModel.setState(1);

        //暂时测试使用
        sellerModel.setOrderSellerId(1);
        sellerModel.setRealName("hello");


         //调用持久层
        sellerModelMapper.insert(sellerModel);
    }

    @Override
    public void HelloWorld(HttpServletRequest request, HttpServletResponse response) {

    }


}
