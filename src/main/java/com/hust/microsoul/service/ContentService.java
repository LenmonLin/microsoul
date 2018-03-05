package com.hust.microsoul.service;

import com.hust.microsoul.model.ContentsModel;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @author LemonLin
 * @Description :ContentService
 * @date 2018/3/3-17:38
 */
@Service
public interface ContentService {
    ContentsModel addContent(ContentsModel contentsModel);

    //通过cid获取内容
    List<ContentsModel> selectContentVByCid(Integer cid);
}
