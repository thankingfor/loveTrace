package aijingjing.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import aijingjing.domain.Photo;

@Repository
public interface PhotoMapper {

	int insertCallbackId(Photo photo);

	int selectIdByPath(String image);

	List<Photo> selectByIds(String[] ids);

	List<Photo> select(String param);

	List<Photo> getPhotoList(String[] idArray);

	int editPhotos(Photo photo);
	
}