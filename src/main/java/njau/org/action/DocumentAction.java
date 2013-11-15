package njau.org.action;

import java.util.Date;
import java.util.List;

import lombok.Getter;
import lombok.Setter;
import njau.org.dto.AnnounceInfoDto;
import njau.org.dto.ArticleInfoDto;
import njau.org.dto.ImageInfoDto;
import njau.org.dto.ResponseDto;
import njau.org.entity.Announce;
import njau.org.entity.Document;
import njau.org.entity.Image;
import njau.org.entity.User;
import njau.org.service.DocumentService;

import org.apache.struts2.ServletActionContext;

/**
 * @author csophys
 *
 */
public class DocumentAction extends BaseAction{

	private static final long serialVersionUID = -7028538474431723271L;
	
	private int currentTab=0;
	private int id;
	@Getter
	private String msg;
	
	public ArticleInfoDto articleInfoDto;
	
	public ImageInfoDto imageInfoDto;
	
	public AnnounceInfoDto announceInfoDto;
	
	@Getter
	public List<Document> documentList;
	
	DocumentService documentService;
	
	@Setter @Getter
	public Document document;
	@Setter @Getter	
	public Image image;
	
	@Setter @Getter	
	public Announce announce;
	
	@Getter
	@Setter
	public User user;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public DocumentAction() {
		documentService=new DocumentService();
	}
	
	public ArticleInfoDto getArticleInfoDto() {
		return articleInfoDto;
	}

	public void setArticleInfoDto(ArticleInfoDto articleInfoDto) {
		this.articleInfoDto = articleInfoDto;
	}

	public ImageInfoDto getImageInfoDto() {
		return imageInfoDto;
	}

	public void setImageInfoDto(ImageInfoDto imageInfoDto) {
		this.imageInfoDto = imageInfoDto;
	}

	public AnnounceInfoDto getAnnounceInfoDto() {
		return announceInfoDto;
	}

	public void setAnnounceInfoDto(AnnounceInfoDto announceInfoDto) {
		this.announceInfoDto = announceInfoDto;
	}

	public int getCurrentTab() {
		return currentTab;
	}

	public void setCurrentTab(int currentTab) {
		this.currentTab = currentTab;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public String uploadArticle(){
		document.setAddTime(new Date());
		document.setMemo(getCurrentUsernameFromSession());
		documentService.save(document);
		return SUCCESS;
	}
	
	
	public String updateArticle(){
		documentService.update(document);
		return SUCCESS;
	}
	
	public String updateAnnounce(){
		currentTab = 2;
		documentService.update(announce);
		return SUCCESS;
	}
	
	public String updateImage(){
		currentTab = 1;
		documentService.update(image);
		return SUCCESS;
	}
	
	
	public String uploadAnnounce(){
		announce.setAddTime(new Date());
		documentService.save(announce);
		currentTab = 2;
		return SUCCESS;
	}
	
	public String uploadImage(){
		image.setAddTime(new Date());
		image.setImageTag("default");
		documentService.save(image);
		currentTab = 1;
		return SUCCESS;
	}
	
	//新增和编辑文章action
	public String initArticle(){
		if(document!=null){
			document=documentService.getDocumentById(document.getDocumentId());
		}
		return SUCCESS;
	}
	
	public String initAnnounce(){
		if(announce!=null){
			announce = (Announce)documentService.getObjectById("Announce", announce.getId());
		}
		return SUCCESS;
	}
	
	public String initImage(){
		if(image!=null){
			image = (Image)documentService.getObjectById("Image", image.getImageId());
		}
		return SUCCESS;
	}
	
	public void findDocument(){
		documentService.findList(articleInfoDto,pageNo,pageSize).sendJson();
	}
	
	
	public void findAnnounce(){
		documentService.findAnnounceList(pageNo,pageSize).sendJson();		
	}
	
	public void findImage(){
		documentService.findImageList(pageNo, pageSize, false).sendJson();
	}
	
	public String findDocumentList(){
		if (articleInfoDto.getType().equals("xmgg")) {
			articleInfoDto.setType("项目公告");
			invokeFindDocumentList();
			return "news";
		} else if (articleInfoDto.getType().equals("xsdt")) {
			articleInfoDto.setType("学术动态");
			invokeFindDocumentList();
			return "news";
		} else if (articleInfoDto.getType().equals("tpxw")) {
			articleInfoDto.setType("图片新闻");
			invokeFindDocumentList();
			return "news";
		} else if (articleInfoDto.getType().equals("xmsm")) {
			articleInfoDto.setType("项目说明");
			invokeFindDocumentList();
			return "projectInfo";
		} else if (articleInfoDto.getType().equals("xmzgc")) {
			articleInfoDto.setType("项目组构成");
			invokeFindDocumentList();
			return "projectInfo";
		} else if (articleInfoDto.getType().equals("xglwyj")) {
			articleInfoDto.setType("相关论文研究");
			invokeFindDocumentList();
			return "projectInfo";
		} else if (articleInfoDto.getType().equals("yjdw")) {
			articleInfoDto.setType("研究队伍");
			invokeFindDocumentList();
			return "projectInfo";
		} else if (articleInfoDto.getType().equals("xglwyje")) {
			articleInfoDto.setType("相关论文研究（英文）");
			invokeFindDocumentList();
			return "projectInfo";
		} else if (articleInfoDto.getType().equals("xjyjpaperz")) {
			articleInfoDto.setType("水稻细菌性病害研究论文（中文）");
			invokeFindDocumentList();
			return "paper";
		} else if (articleInfoDto.getType().equals("xjxwpaperz")) {
			articleInfoDto.setType("水稻细菌性病害学位论文（中文）");
			invokeFindDocumentList();
			return "paper";
		} else if (articleInfoDto.getType().equals("specialPaper")) {
			articleInfoDto.setType("相标注(nyhyzx07-056)支持的论文");
			invokeFindDocumentList();
			return "projectprocess";
		} else if (articleInfoDto.getType().equals("workprocess")) {
			articleInfoDto.setType("工作进展");
			invokeFindDocumentList();
			return "projectprocess";
		} else if (articleInfoDto.getType().equals("imageDiagnose")) {
			articleInfoDto.setType("图片诊断");
			invokeFindDocumentList();
			return "diagnose";
		} else if (articleInfoDto.getType().equals("vedioDiagnose")) {
			articleInfoDto.setType("视频诊断");
			invokeFindDocumentList();
			return "diagnose";
		} else if (articleInfoDto.getType().equals("otherDiagnose")) {
			articleInfoDto.setType("其他诊断");
			invokeFindDocumentList();
			return "diagnose";
		} else if (articleInfoDto.getType().equals("professialQuestion")) {
			articleInfoDto.setType("专家答疑");
			invokeFindDocumentList();
			return "question";
		} else if (articleInfoDto.getType().equals("zjdw")) {
			articleInfoDto.setType("专家队伍");
			invokeFindDocumentList();
			return "zjdw";
		} else if (articleInfoDto.getType().equals("lxwm")) {
			articleInfoDto.setType("联系我们");
			invokeFindDocumentList();
			return "lxwm";
		}

		return "news";
	}

	private void invokeFindDocumentList() {
		ResponseDto<Document> responseDto = documentService.findList(articleInfoDto,pageNo,pageSize);
		documentList = responseDto.getRows();
		if(responseDto .getTotal() != 0){
			totalPage = (int)Math.ceil((double)responseDto .getTotal() /pageSize) ;
		}
	}
	
	public String getDocumentById(){
		document=documentService.getDocumentById(document.getDocumentId());
		return SUCCESS;
	}
	
	
	public String deleteDocumentById(){
		documentService.delete(document.getDocumentId());
		return SUCCESS;
	}
	
	
	//首页根据type获取文章列表
	public static List<Document> findDocument(String type){
		ArticleInfoDto articleInfoDto = new ArticleInfoDto();
		articleInfoDto.setType(type);
		return new DocumentService().findList(articleInfoDto, 1, 12).getRows();
	}
	
	// 首页获取image列表，最新六张照片
	public static List<Document> findIndexImages() {
		return new DocumentService().findImageList(1, 6, true).getRows();
	}
	
	// 首页获取公告列表，最新六条
	public static List<Document> findIndexAnnouces() {
		return new DocumentService().findAnnounceList(1, 6).getRows();
	}

	public void login() {
		ResponseDto response = new ResponseDto<>();
		int code=500;
		String msg="";
		User currentUser = getCurrentUserByUsername();
		if (currentUser == null) {
			msg="用户名不存在";
		} else {
			if (!user.getPassword().equals(currentUser.getPassword())) {
				msg="密码输入错误";
			} else {
				code = 200;
				putUsernameToSession(user.getUsername());
			}
		}
		response.setCode(code);
		response.setMsg(msg);
		response.sendJson();
	}

	public String adminLogin() {
		User currentUser = getCurrentUserByUsername();
		if (currentUser == null) {
			msg = "用户名不存在";
			return INPUT;
		} else {
			if (!user.getPassword().equals(currentUser.getPassword())) {
				msg = "密码输入错误";
				return INPUT;
			} else {
				if (currentUser.getPowerCode() != null
						&& currentUser.getPowerCode() == 1) {
					putUsernameToSession(user.getUsername());	
					putRoleToSession("admin");
				} else {
					msg = "你不是管理员，请联系开发设置管理员账户！";
					return INPUT;
				}
				
			}
		}
		return SUCCESS;
	}

	private User getCurrentUserByUsername() {
		User currentUser = (User) documentService.getObjectByStringField(
				"User",
				"username",
				user.getUsername());
		return currentUser;
	}

	public String reg() {
		// 插入数据库
		documentService.save(user);
		putUsernameToSession(user.getUsername());
		return SUCCESS;
	}

	public void ifUserExist() {
		ResponseDto response = new ResponseDto<>();
		int code = 500;
		String msg = "";
		User currentUser = getCurrentUserByUsername();
		if (currentUser == null) {
			code = 200;
		} else {
			code = 500;
			msg = "用户名已经存在";
		}
		response.setCode(code);
		response.setMsg(msg);
		response.sendJson();
	}


	/**
	 * @param username
	 */
	private void putUsernameToSession(String username) {
		ServletActionContext.getRequest().getSession()
				.setAttribute("username", username);
	}

	private void putRoleToSession(String role) {
		ServletActionContext.getRequest().getSession()
				.setAttribute("role", role);
	}

	public String getCurrentUsernameFromSession() {
		return (String) ServletActionContext.getRequest().getSession()
				.getAttribute("username");
	}

	public String loginOut() {
		putUsernameOutSesson();
		return SUCCESS;
	}

	private void putUsernameOutSesson() {
		ServletActionContext.getRequest().getSession()
				.removeAttribute("username");

	}
}
