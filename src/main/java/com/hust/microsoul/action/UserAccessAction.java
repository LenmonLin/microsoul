package com.hust.microsoul.action;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.hust.microsoul.model.BuyerModel;
import com.hust.microsoul.model.SellerModel;
import com.hust.microsoul.service.BuyerService;
import com.hust.microsoul.service.SellerService;
import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.JSONCommon;

/**
 * @Description:
 * @author:huwentao
 * @date:2018年3月14日
 * @version 1.0  
 */
@Controller
@RequestMapping("user")
public class UserAccessAction {
	
	@Autowired
	private BuyerService buyerService;
	
    @Autowired
    private SellerService sellerService;

	Logger logger =LoggerFactory.getLogger(this.getClass());

	@RequestMapping("buyer/login")
	public void buyerLogin(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel){
		buyerService.buyerLogin(request, response,buyerModel);
		logger.error("1111111");
	}
	
	@RequestMapping("buyer/exit")
	public void buyerExit(HttpServletRequest request,HttpServletResponse response){
		buyerService.buyerExit(request, response);
		logger.error("1111111");
	}
	
	@RequestMapping("buyer/register")
	public void buyerRegister(HttpServletRequest request,HttpServletResponse response,BuyerModel buyerModel){
		buyerService.buyerRegister(request, response,buyerModel);
	}
    /**
     *@Description 卖家登录功能
     *@params
     *@author LemonLin
     *@date  2018/1/24
     */
    @RequestMapping("seller/login")
//    @ResponseBody
//    public Msg sellerLogin(@RequestParam String password, @RequestParam String accountName){
    public void sellerLogin(@RequestParam(value = "password") String password,
                            @RequestParam(value = "accountName") String accountName,HttpServletResponse response,HttpServletRequest request){

        //查询数据库中是否已经存在这个用户
        SellerModel existUser = sellerService.sellerLogin(accountName,password);

        //判断，登录名或者密码错误了
        if(existUser == null){
            JSONCommon.outputResultCodeJson(CommonCode.FAIL,response);
        }else {
            //登录成功,存放到session中去

             request.getSession().setAttribute("existUser",existUser);
             //查看卖家用户信息的时候使用
             Integer existUserId = existUser.getIdSeller();
             request.getSession().setAttribute("existUserId",existUserId);

            JSONCommon.outputResultCodeJson(CommonCode.SUCCESS,response);

             //测试后台遍历session获取里面的值

            String FileName="";
            Enumeration enumeration =request.getSession().getAttributeNames();//获取session中所有的键值对
            //遍历enumeration中的键值对
            String[] names=request.getSession().getValueNames();
            for(int i=0;i<names.length;i++){
                if(names[i].equals("existUser")){
                    FileName+=request.getSession().getValue(names[i])+"@";
                    System.out.println(FileName);
                }
            }

        }
    }

    /**
     *@Description  退出功能
     *@params
     *@author LemonLin
     *@date  2018/1/26
     */
    @RequestMapping("seller/exit")
    public void sellerExit(HttpServletRequest request,HttpServletResponse response){
        //移除session中的用户即可
        request.getSession().removeAttribute("existUser");
        request.getSession().removeAttribute("existUserId");

        JSONCommon.outputResultCodeJson(CommonCode.SUCCESS,response);

        //测试后台遍历session获取里面的值

        String FileName="";
        Enumeration enumeration =request.getSession().getAttributeNames();//获取session中所有的键值对
        //遍历enumeration中的键值对
        String[] names=request.getSession().getValueNames();
        for(int i=0;i<names.length;i++){
            if(names[i].equals("existUser")){
                FileName+=request.getSession().getValue(names[i])+"@";
                System.out.println(FileName);
            }
        }
    }

    @RequestMapping("seller/register")
//    @ResponseBody
    public void sellerRegister(@RequestParam(value = "password") String password,
                               @RequestParam(value = "accountName") String accountName,
                               HttpServletResponse response){


        //判空，若为空，提示错误
        if (password ==null || accountName == null){
            JSONCommon.outputResultCodeJson(CommonCode.FAIL,response);
        }else {
            //判断登录名是否已经存在，存在的话就不能注册
            SellerModel sellerModel1 = sellerService.checkSeller(accountName);

            if (sellerModel1 != null){
                //登录名查询到用户了，说明登录已经存在，不能注册
                JSONCommon.outputResultCodeJson(CommonCode.FAIL,response);
            }else {

                //说明登录不存在，能注册
                sellerService.sellerRegister(accountName,password);

                JSONCommon.outputResultCodeJson(CommonCode.SUCCESS,response);
            }
        }

    }

}

