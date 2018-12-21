package aijingjing.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aijingjing.domain.Photo;
import aijingjing.mapper.PhotoMapper;
import aijingjing.service.PhotoService;
import aijingjing.utils.MyUtils;

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

	@Override
	public String getPhotos(String images) {
		String[] imgs = images.split(",");
		String photos = "";
		for (String image : imgs) {
			Photo photo = new Photo();
			photo.setPath(image);
			//如果查询不出来就添加
			int msg = selectIdByPath(image);
			if(msg != 0 ) {
				photos = new MyUtils().withDouhao(photos,String.valueOf(msg));
				continue ;
			}
			int id = insertCallbackId(photo);
			id = photo.getId();
			photos = new MyUtils().withDouhao(photos,String.valueOf(id));
		}
		return photos;
	}

}
