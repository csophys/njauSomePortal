package njau.org.action;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

import njau.org.util.FileHelper;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;

/**
 * @author csophys
 *
 */
public class UploadAction extends ActionSupport {

	private static final long serialVersionUID = 8688225884988401626L;

	private File uploadify;
	private String uploadifyFileName;

	
	

	public void uploadFile() throws Exception {

		String extName = "";// 扩展名
		String newFileName = "";// 新文件名

		String nowTime = new SimpleDateFormat("yyyyMMddHHmmss")
				.format(new Date());// 当前时间

		String savePath = ServletActionContext.getRequest().getSession().getServletContext().getRealPath("/"); 

		savePath = savePath + "uploads/";

		HttpServletResponse response = ServletActionContext.getResponse();
		response.setCharacterEncoding("utf-8");

		// 获取扩展名
		if (uploadifyFileName.lastIndexOf(".") >= 0) {
			extName = uploadifyFileName.substring(uploadifyFileName
					.lastIndexOf("."));
		}
		
		newFileName = nowTime + extName;
		
		String filePath =  savePath + newFileName;
		
		File destFile = new File(filePath);
		
		System.out.println(uploadify.renameTo(destFile));
		System.out.println(filePath);	
		
		response.getWriter().print("uploads/"+newFileName);
	}

	public File getUploadify() {
		return uploadify;
	}

	public void setUploadify(File uploadify) {
		this.uploadify = uploadify;
	}

	public String getUploadifyFileName() {
		return uploadifyFileName;
	}

	public void setUploadifyFileName(String uploadifyFileName) {
		this.uploadifyFileName = uploadifyFileName;
	}

}
