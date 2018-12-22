package aijingjing.service;

import java.util.List;

import aijingjing.domain.Photo;

public interface PhotoService {

	/**
	 * 	插入图片  返回主键id
	 * @param photo
	 * @return
	 */
	int insertCallbackId(Photo photo);

	int selectIdByPath(String image);

	/**
	 * 通过图片字符串返回id字符串
	 * @param images
	 * @return
	 */
	String getPhotos(String images);
	
	/**
	 * 	通过id字符串返回Photo 的list
	 * @param ids
	 * @return
	 */
	List<Photo> getPhotoList(String ids);

	List<Photo> select(String param);

	int editPhotos(Photo photo, String ids);

	void locked(int id);

	void active(int id);

	Photo selectById(int id);

	/**
	 * 	查询没有被禁用的图片
	 * @param param
	 * @return
	 */
	List<Photo> selectActive(String param);

}
