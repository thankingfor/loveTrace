package aijingjing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aijingjing.domain.Photo;
import aijingjing.mapper.PhotoMapper;
import aijingjing.service.PhotoService;

@Service
public class PhotoServiceImpl implements PhotoService{

	@Autowired
	private PhotoMapper photoMapper;
	
	@Override
	public int insertCallbackId(Photo photo) {
		return photoMapper.insertCallbackId(photo);
	}

	@Override
	public int selectIdByPath(String image) {
		return photoMapper.selectIdByPath(image);
	}

}
