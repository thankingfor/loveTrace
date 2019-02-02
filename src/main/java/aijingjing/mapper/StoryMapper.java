package aijingjing.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import aijingjing.domain.Story;

@Repository
public interface StoryMapper {

	int insert(Story story);

	List<Story> select(String param);
	
	List<Story> selectActive(String param);

	void delete(int i);
	
	Story selectById(Integer id);
	
	int edit(Story story);

	void active(int id);

}