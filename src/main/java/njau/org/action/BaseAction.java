package njau.org.action;

import lombok.Getter;
import lombok.Setter;

import com.opensymphony.xwork2.ActionSupport;

public class BaseAction extends ActionSupport{
	
	@Setter @Getter
	int pageNo=0;
	
	@Setter @Getter
	int pageSize=15;
	
	@Setter @Getter
	int totalPage = 0;
	

}
