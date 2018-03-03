package com.hust.microsoul.action;

import com.hust.microsoul.model.ContentsModel;
import com.hust.microsoul.service.ContentService;
import com.hust.microsoul.util.Msg;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
}
