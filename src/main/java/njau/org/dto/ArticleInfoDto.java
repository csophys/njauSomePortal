package njau.org.dto;

import java.util.Date;

import lombok.Data;

@Data
public class ArticleInfoDto {
	private String title="";
	private String type="";
	private Integer isTopInIndex=0;
	private Date addTime;
	private Date updateTime;
	private String content="";
	
}
