package njau.org.action;

import java.util.List;

import njau.org.entity.Document;
import njau.org.entity.User;
import njau.org.service.DocumentService;
import njau.org.util.HibernateUtil;

/**
 * @author sheng.chen
 *
 */
public class Test {
	
	private int flag;
	
	private String name;
	

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getFlag() {
		return flag;
	}

	public void setFlag(int flag) {
		this.flag = flag;
	}

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		System.out.println("Test");
	}
	

	public String test(){
		if(flag==1){
			name="csophys";
			return "success";
		}			
		else if(flag==2){
			name="陈胜";
			return "error";
		}
		
//		new DocumentService().findList();
//		//取数据
//		List<User> userList=(List<User>)HibernateUtil.findByHql("from User");
//		
//		//存数据
//		User user=new User();
//		user.setUsername("csophys");
//		user.setPassword("沙河粉哈佛");
//		HibernateUtil.save(user);
//		
//		
//		//删除数据
//		HibernateUtil.deleteOrUpdateByHql("delete from User where userId=3");
//		
//		//更新数据
//		HibernateUtil.deleteOrUpdateByHql("update from User set password='csophyscsophys' where userId=4");

		return "success";
		
	}
}
