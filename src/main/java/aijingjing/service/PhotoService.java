package aijingjing.service;

import aijingjing.domain.Photo;

public interface PhotoService {

	/**
	 * 	插入图片  返回主键id
	 * @param photo
	 * @return
	 */
	int insertCallbackId(Photo photo);

	int selectIdByPath(String image);

	String getPhotos(String images);

}
