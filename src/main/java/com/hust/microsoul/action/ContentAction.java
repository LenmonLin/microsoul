package com.hust.microsoul.action;

import com.github.pagehelper.PageInfo;
import com.hust.microsoul.model.ContentsModel;
import com.hust.microsoul.service.ContentService;
import com.hust.microsoul.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author LemonLin
 * @Description :ContentAction
 * @date 2018/3/3-17:52
 */


@Controller
@RequestMapping("/microsoul/content")
public class ContentAction {

    @Autowired
    private ContentService contentService;


    @RequestMapping("insert")
    @ResponseBody
    public Msg insert(ContentsModel contentsModel){

        ContentsModel exitContents = contentService.addContent(contentsModel);

        if (exitContents == null){
            return Msg.fail();
        }
        return Msg.success();
    }

    /**
     *@Description 管理员后台分页显示商品首页内容
     *@params
     *@author LemonLin
     *@date  2018/3/5
     */
    @RequestMapping("showsList")
    @ResponseBody
    public Msg showContentsList(@RequestParam(value = "page",defaultValue = "1") Integer page,
                             @RequestParam(value = "rows",defaultValue = "30") Integer rows){

        PageInfo<ContentsModel> contentsList = contentService.showContentsList(page,rows);

        return Msg.success().add("contentsList",contentsList);
    }
}
