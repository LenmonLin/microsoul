package com.hust.microsoul.action;

import com.hust.microsoul.model.SellerModel;
import com.hust.microsoul.service.SellerService;
import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.JSONCommon;
import com.hust.microsoul.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


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
    public void sellerLogin(HttpServletResponse response){
        //判空，若为空，提示错误
//        if (password ==null || accountName == null){
//            return Msg.success() ;
//        }else {
//            return Msg.success();
//        }
        System.out.println("后台显示");
        //通过登录名，判断，登录名是否已经存在，调用业务层，查询
        JSONCommon.outputResultCodeJson(CommonCode.SUCCESS,response);

    }

    @RequestMapping("register")
//    @ResponseBody
    public void sellerRegister(@RequestParam(value = "password",defaultValue = "1") String password,
                               @RequestParam(value = "accountName",defaultValue = "1") String accountName,
                               HttpServletResponse response){


        //判空，若为空，提示错误
        if (password ==null || accountName == null){
            JSONCommon.outputResultCodeJson(CommonCode.FAIL,response);
        }else {
            //判断登录名是否已经存在，存在的话就不能注册

            System.out.println(accountName);
            SellerModel sellerModel2 = sellerService.checkSeller(accountName);

            if (sellerModel2 != null){
                //登录名查询到用户了，说明登录已经存在，不能注册
                JSONCommon.outputResultCodeJson(CommonCode.FAIL,response);

                System.out.println("sellerModel不为空");
            }else {
                //说明登录不存在，能注册
//                System.out.println("运行到insert");
                SellerModel sellerModel = new SellerModel();
                sellerService.insert(sellerModel);
                JSONCommon.outputResultCodeJson(CommonCode.SUCCESS,response);
            }
        }

    }

    @RequestMapping("info")
    public void sellerInfo(HttpServletRequest request,HttpServletResponse response){

    }
}
