package com.hust.microsoul.service.impl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.hust.microsoul.mapper.Adminitrator_tableModelMapper;
import com.hust.microsoul.model.AdministratorModel;
import com.hust.microsoul.model.Adminitrator_tableModel;
import com.hust.microsoul.service.AdministratorService;
import com.hust.microsoul.util.CommonCode;
import com.hust.microsoul.util.JSONCommon;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/** 
 * @Description:AdministratorServiceImpl.java
 * @author  huwentao 
 * @date 创建时间：2018年1月22日 下午2:22:23 
 * @version 1.0  
 */
@Service
public class AdministratorServiceImpl implements AdministratorService {
	@Autowired
	Adminitrator_tableModelMapper adminitrator_tableModelMapper;
	@Override
	public void adminLogin(HttpServletRequest request,
			HttpServletResponse response, Adminitrator_tableModel adminitrator_tableModel) {
		Adminitrator_tableModel result= adminitrator_tableModelMapper.selectByPrimaryKey(adminitrator_tableModel.getId());
		if(result==null)
			JSONCommon.outputResultCodeJson(CommonCode.SUCCESS, response);
		else 
			JSONCommon.outputResultCodeJson(CommonCode.FAIL, response);
	}


}
