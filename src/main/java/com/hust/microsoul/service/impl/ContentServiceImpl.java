package com.hust.microsoul.service.impl;

import com.hust.microsoul.mapper.ContentsModelMapper;
import com.hust.microsoul.model.ContentsModel;
import com.hust.microsoul.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;

/**
 * @author LemonLin
 * @Description :ContentServiceImpl
 * @date 2018/3/3-17:43
 */

@Service
public class ContentServiceImpl  implements ContentService{

    @Autowired
    private ContentsModelMapper contentsModelMapper;

    @Override
    public ContentsModel addContent(ContentsModel contentsModel) {
        //补全model的属性；主键自增长，不用管，只要补全前端不会传过来的代码即可
        if (contentsModel.getCategoryId()==null){
            return null;
        }

        contentsModel.setCreated(new Date());
        contentsModel.setUpdated(new Date());

        //插入到内容表当中

        contentsModelMapper.insert(contentsModel);
        return contentsModel;
    }
}
