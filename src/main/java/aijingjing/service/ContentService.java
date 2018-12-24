package aijingjing.service;

import java.util.List;

import aijingjing.domain.Content;

public interface ContentService {

	List<Content> select(String sel);

	int insert(Content content);

	void delete(int i);

	Content selectById(int id);

	int edit(Content content);

}
