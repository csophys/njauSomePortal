package njau.org.dto;

import java.util.ArrayList;
import java.util.List;

import lombok.Data;

import com.google.gson.Gson;

import njau.org.util.AjaxResponseUtil;

/**
 * @author csophys
 *
 * @param <T>
 */
@Data
public class ResponseDto<T> {
	private int code=500;
	private String msg="";
	private int total=0;
	private Object daoResult;	

	private List<T> rows=new ArrayList<T>();

	public void sendJson(){
		String result=new Gson().toJson(this);
		AjaxResponseUtil.response(result);
	}
}
