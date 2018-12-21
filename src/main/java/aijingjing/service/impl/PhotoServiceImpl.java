package aijingjing.service.impl;

import java.util.List;

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

	@Override
	public List<Photo> select(String param) {
		return photoMapper.select("%"+param+"%");
	}

	@Override
	public List<Photo> getPhotoList(String ids) {
		String[] idArray = ids.split(",");
		return photoMapper.getPhotoList(idArray);
	}

	@Override
	public int editPhotos(Photo photo, String ids) {
		String[] idArray = ids.split(",");
		int i = 0;
		for (String id : idArray) {
			photo.setId(Integer.valueOf(id));
			i += photoMapper.editPhotos(photo);
		}
		return i;
	}

}
