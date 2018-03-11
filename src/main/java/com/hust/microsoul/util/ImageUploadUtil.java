package com.hust.microsoul.util;

import java.io.File;
import java.io.FileOutputStream;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

/**
 * @Description:
 * @author:huwentao
 * @date:2018年3月11日
 * @version 1.0  
 */
public class ImageUploadUtil {

	static Logger logger = LoggerFactory.getLogger(ImageUploadUtil.class);
	
	public static String uploadImageCommon(MultipartFile file){
		String pictureUrl ="";


		try {
			if(null == file){
				return null;
			}
			
			//检测图片的类型是否符合规范
			String fileName = file.getOriginalFilename();
			String imgType = fileName.substring(fileName.lastIndexOf(".") + 1).toLowerCase();
			
			logger.info(file.getSize() + "--文件的大小");
			if (file.getSize() > 5 * 1024 * 1024) {
				logger.info("文件大小超过5M");
				return null;
			}
			
			fileName = getFileNewName(fileName);
			pictureUrl = "/pic/"+fileName;
			File uploadFile = new File(System.getProperty("user.dir")+"/WebRoot/pic/"+fileName);
			logger.info("*************************,getAbsolutePath:{}", uploadFile.getAbsolutePath());
			FileOutputStream fos = FileUtils.openOutputStream(uploadFile);
			IOUtils.copy( file.getInputStream(), fos); 
			return pictureUrl;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return pictureUrl;
	}
	
	private static String getFileNewName(String filename){
		
		long time = System.currentTimeMillis();
		
		String fileType = filename.substring(filename.lastIndexOf("."));
		
		MD5Utils md5 = new MD5Utils();
		
		return md5.md5(filename + time) + fileType;
	}
}

