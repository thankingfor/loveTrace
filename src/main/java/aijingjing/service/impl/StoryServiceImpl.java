package aijingjing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aijingjing.domain.Photo;
import aijingjing.domain.Story;
import aijingjing.mapper.PhotoMapper;
import aijingjing.mapper.StoryMapper;
import aijingjing.service.StoryService;

@Service
public class StoryServiceImpl implements StoryService {

	@Autowired
	private PhotoMapper photoMapper;
	
	@Autowired
	private StoryMapper storyMapper;
	
	@Override
	public int insert(Story story) {
		return storyMapper.insert(story);
	}

	@Override
	public List<Story> select(String param) {
		List<Story> list = storyMapper.select("%"+param+"%");
		for (Story story : list) {
			//通过id字符串查询
			String[] ids = story.getPhotos().split(",");
			List<Photo> listPhoto = photoMapper.selectByIds(ids);
			story.setList(listPhoto);
		}
		return list;
	}

	@Override
	public void delete(int i) {
		storyMapper.delete(i);
	}

	@Override
	public Story selectById(int id) {
		Story story = storyMapper.selectById(id);
		String[] ids = story.getPhotos().split(",");
		List<Photo> listPhoto = photoMapper.selectByIds(ids);
		story.setList(listPhoto);
		return story;
	}

	@Override
	public int edit(Story story) {
		return storyMapper.edit(story);
	}

	@Override
	public void locked(int id) {
		storyMapper.delete(id);
	}

	@Override
	public void active(int id) {
		storyMapper.active(id);
	}

}
