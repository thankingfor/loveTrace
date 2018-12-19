package aijingjing.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import aijingjing.domain.Content;
import aijingjing.mapper.ContentMapper;
import aijingjing.service.ContentService;

@Service
public class ContentServiceImpl implements ContentService {

	@Autowired
	private ContentMapper contentMapper;
	
	@Override
	public List<Content> select(String param) {
		List<Content> list  = contentMapper.select("%"+param+"%");
		return list;
	}

	@Override
	public int insert(Content content) {
		return contentMapper.insert(content);
	}

	@Override
	public void delete(int i) {
		contentMapper.delete(i);
	}

	@Override
	public Content selectById(int id) {
		return contentMapper.selectById(id);
	}

}
