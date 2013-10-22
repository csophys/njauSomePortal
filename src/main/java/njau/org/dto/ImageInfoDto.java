package njau.org.dto;

public class ImageInfoDto {
	private String imageTitle="";
	private String tag="";
	private Integer isShowInIndex=0;
	private String imageUrlLink="";
	public String getImageTitle() {
		return imageTitle;
	}
	public void setImageTitle(String imageTitle) {
		this.imageTitle = imageTitle;
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
	}
	public Integer getIsShowInIndex() {
		return isShowInIndex;
	}
	public void setIsShowInIndex(Integer isShowInIndex) {
		this.isShowInIndex = isShowInIndex;
	}
	public String getImageUrlLink() {
		return imageUrlLink;
	}
	public void setImageUrlLink(String imageUrlLink) {
		this.imageUrlLink = imageUrlLink;
	}
	
	
	
}
