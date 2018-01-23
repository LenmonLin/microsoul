package com.hust.microsoul.service;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @author lemonLin
 * @Description :SellerService
 * @date 2018/1/23-10:41
 */
public interface SellerService {

    public void sellerLogin(HttpServletRequest request, HttpServletResponse response);

    public void sellerRegister(HttpServletRequest request,HttpServletResponse response);

    public void sellerInfo(HttpServletRequest request,HttpServletResponse response);

    public void disableSeller(HttpServletRequest request,HttpServletResponse response);

    public void sellerChangePassword(HttpServletRequest request,HttpServletResponse response);
}
