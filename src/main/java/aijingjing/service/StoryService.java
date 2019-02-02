package aijingjing.service;

import java.util.List;

import aijingjing.domain.Story;

public interface StoryService {

	int insert(Story story);

	List<Story> select(String param);
	
	List<Story> selectActive(String param);

	void delete(int i);

	Story selectById(int id);

	int edit(Story story);

	void locked(int id);

	void active(int id);

}
