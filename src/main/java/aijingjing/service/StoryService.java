package aijingjing.service;

import java.util.List;

import aijingjing.domain.Story;

public interface StoryService {

	int insert(Story story);

	List<Story> select(String param);

	void delete(int i);

	Story selectById(int id);

}
