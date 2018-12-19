package aijingjing.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import aijingjing.domain.Content;

@Repository
public interface ContentMapper {

	Content selectById(Integer id);
	
	List<Content> select(String param);

	int insert(Content content);
	
	int delete(Integer id);
	
	int edit(Content content);
	
}
