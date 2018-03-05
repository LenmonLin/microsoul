package com.hust.microsoul.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.hust.microsoul.mapper.ContentsModelMapper;
import com.hust.microsoul.model.ContentsModel;
import com.hust.microsoul.model.ContentsModelExample;
import com.hust.microsoul.service.ContentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;

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

    @Override
    public PageInfo<ContentsModel> showContentsList(Integer page, Integer rows) {
        //设置分页信息
        PageHelper.startPage(page,rows);
        //查询数据库
        ContentsModelExample contentsModelExample = new ContentsModelExample();

        List<ContentsModel> contentModels = contentsModelMapper.selectByExample(contentsModelExample);
        //返回结果
        PageInfo pageInfo = new PageInfo(contentModels);
        return pageInfo;
    }


    //通过分类方法获取内容列表
    @Override
    public List<ContentsModel> selectContentVByCid(Integer cid) {
        ContentsModelExample example = new ContentsModelExample();
        ContentsModelExample.Criteria criteria = example.createCriteria();
        //设置查询条件
        criteria.andCategoryIdEqualTo(cid);

        //从数据库中查询
        List<ContentsModel> list = contentsModelMapper.selectByExample(example);
        return list;
    }
}
