package com.hust.microsoul.service;


import com.hust.microsoul.model.SellerModel;
import com.hust.microsoul.model.SellerModelExample;
import com.hust.microsoul.util.Msg;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * @author lemonLin
 * @Description :SellerService
 * @date 2018/1/23-10:41
 */

@Service
public interface SellerService {

    public SellerModel sellerLogin(String accountName,String password);

    public void sellerRegister(String accountName,String password);

    public boolean sellerInfo(SellerModel sellerModel);

    public void disableSeller(HttpServletRequest request,HttpServletResponse response);

    public boolean sellerChangePassword(SellerModel sellerModel,String newPassword);

    SellerModel checkSeller(String  accountName);

    void insert(SellerModel record);


    public void HelloWorld(HttpServletRequest request, HttpServletResponse response);
}
