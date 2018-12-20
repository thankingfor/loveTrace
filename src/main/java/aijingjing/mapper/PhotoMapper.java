package aijingjing.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import aijingjing.domain.Photo;

@Repository
public interface PhotoMapper {

	int insertCallbackId(Photo photo);

	int selectIdByPath(String image);

	List<Photo> selectByIds(String[] ids);
	
}