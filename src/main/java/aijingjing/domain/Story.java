package aijingjing.domain;

import java.util.Date;
import java.util.List;

import aijingjing.utils.MyUtils;

public class Story {
    private Integer id;

    private String name;

    private String datetime;
    
    private String article;

    private String photos;

    private Date create;

    private Integer state;

    List<Photo> list;
    
    public String getFontContent() {
		String con = article.replaceAll("[^\u4E00-\u9FA5]", "");
		if(con.length()<=180) {
			return con;
		}
		return con.substring(0, 180)+"...";
	}
    
    public String getOnePage() {
		if(list.size() > 0) {
			return list.get(0).getPath();
		}
		return null;
	}
    
    public String getPaths() {
    	String str = "";
    	for (Photo photo : list) {
			str = new MyUtils().withDouhao(str, photo.getPath());
		}
    	return str;
    }
    
    public List<Photo> getList() {
		return list;
	}

	public void setList(List<Photo> list) {
		this.list = list;
	}

	public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getDatetime() {
        return datetime;
    }

    public void setDatetime(String datetime) {
        this.datetime = datetime == null ? null : datetime.trim();
    }

    public Date getCreate() {
        return create;
    }

    public void setCreate(Date create) {
        this.create = create;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

	public String getArticle() {
		return article;
	}

	public void setArticle(String article) {
		this.article = article;
	}

	public String getPhotos() {
		return photos;
	}

	public void setPhotos(String photos) {
		this.photos = photos;
	}

	@Override
	public String toString() {
		return "Story [id=" + id + ", name=" + name + ", datetime=" + datetime + ", article=" + article + ", photos="
				+ photos + ", create=" + create + ", state=" + state + "]";
	}

}