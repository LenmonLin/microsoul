package com.hust.microsoul.service;

import com.hust.microsoul.model.ContentsModel;
import org.springframework.stereotype.Service;

/**
 * @author LemonLin
 * @Description :ContentService
 * @date 2018/3/3-17:38
 */
@Service
public interface ContentService {
    ContentsModel addContent(ContentsModel contentsModel);
}
