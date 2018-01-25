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

/**
 *@Description  登录通过登录名和密码做校验，先给密码加密，再查询
 *@params
 *@author LemonLin
 *@date  2018/1/25
 */
    @Override
    public SellerModel sellerLogin(String accountName,String password) {
        //加密
        String pwd = MD5Utils.md5(password);

        SellerModelExample sellerModelExample = new SellerModelExample();

        SellerModelExample.Criteria criteriaSeller = sellerModelExample.createCriteria();

        criteriaSeller.andAccountNameEqualTo(accountName);
        criteriaSeller.andPasswordEqualTo(pwd);

        List<SellerModel> sellerModels = sellerModelMapper.selectByExample(sellerModelExample);

        if (sellerModels != null && sellerModels.size()>0){
            return sellerModels.get(0);
        }
        return null;
    }
    /**
     *@Description 把注册的设置从action搬到service,使action看上去更简洁
     *@params
     *@author LemonLin
     *@date  2018/1/25
     */
    @Override
    public void sellerRegister(String accountName,String password) {
        SellerModel sellerModel = new SellerModel();
        sellerModel.setAccountName(accountName);
        //给密码加密
        sellerModel.setPassword(MD5Utils.md5(password));
        //用户的状态默认为1状态
        sellerModel.setState(1);

        //暂时测试使用，OrderSeller是外键的暂时设置
        sellerModel.setOrderSellerId(1);
        sellerModel.setRealName("hello");
        //调用持久层
        sellerModelMapper.insert(sellerModel);
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
    @Transactional //加事务
    public void insert(SellerModel sellerModel) {
//        System.out.println("运行到service的 insert");
//        if(sellerModel ==null){
//            System.out.println("sellerModel为空");
//        }
//        System.out.println(sellerModel.getAccountName());
//        System.out.println("运行到1");
//        sellerModel.setAccountName("hell");
//        System.out.println("运行到2");
//        String pwd = sellerModel.getPassword();
//        System.out.println("运行到3");
//        //给密码加密
//        sellerModel.setPassword(MD5Utils.md5(pwd));
//        //用户的状态默认师1状态
//        System.out.println("运行到4");
//        sellerModel.setState(1);
//        System.out.println("运行到5");
//        //暂时测试使用
//        sellerModel.setOrderSellerId(1);
//        System.out.println("运行到6");
//        sellerModel.setRealName("hello");
//        System.out.println("运行到7");
//        System.out.println("要调用持久层了");
         //调用持久层

        //以上代码注销原因：是因为插入代码不运行在service，否则就要insert需要
        //传入很多的参数，才能运行,这样麻烦，直接在control层设置参数更快
        //sellerModelMapper.insert(sellerModel);
    }

    @Override
    public void HelloWorld(HttpServletRequest request, HttpServletResponse response) {

    }


}
