package com.hust.microsoul.action;

import com.hust.microsoul.model.SellerModel;
import com.hust.microsoul.service.SellerService;
import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.JSONCommon;
import com.hust.microsoul.util.MD5Utils;
import com.hust.microsoul.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.Enumeration;


/**
 * @author LemonLin
 * @Description :SellerAction
 * @date 2018/1/24-16:36
 */

@Controller
@RequestMapping("microsoul/seller")
public class SellerAction {


    @Autowired
    private SellerService sellerService;

/**
 *@Description 测试代码
 *@params
 *@author LemonLin
 *@date  2018/1/25
 */
    @RequestMapping("hello")
    public String HelloWorld(HttpServletRequest request,HttpServletResponse response) {
        sellerService.HelloWorld(request, response);
        return "WEB-INF/login";
    }

    /**
     *@Description 卖家登录功能
     *@params
     *@author LemonLin
     *@date  2018/1/24
     */
    @RequestMapping("login")
//    @ResponseBody
//    public Msg sellerLogin(@RequestParam String password, @RequestParam String accountName){
    public void sellerLogin(@RequestParam(value = "password") String password,
                            @RequestParam(value = "accountName") String accountName,HttpServletResponse response,HttpServletRequest request){
        SellerModel existUser = sellerService.sellerLogin(accountName,password);

        //判断，登录名或者密码错误了
        if(existUser == null){
            JSONCommon.outputResultCodeJson(CommonCode.FAIL,response);
        }else {
            //登录成功,存放到session中去

             request.getSession().setAttribute("existUser",existUser);

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
    @RequestMapping("exit")
    public void sellerExit(HttpServletRequest request,HttpServletResponse response){
        //移除session中的用户即可
        request.getSession().removeAttribute("existUser");

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


    @RequestMapping("register")
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
    //测试版本
    @RequestMapping("info")
    public void sellerInfo(HttpServletRequest request,HttpServletResponse response){

    }
}
