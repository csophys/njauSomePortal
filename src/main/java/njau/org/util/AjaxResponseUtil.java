package njau.org.util;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;

/**
 * @author sheng.chen
 *
 */
public class AjaxResponseUtil {

	/**
	 * @param text
	 */
	public static void response(String text) {
    	HttpServletResponse response = ServletActionContext.getResponse();
        response.setContentType("text/html;charset=utf-8");
        PrintWriter out = null;
        try {
            out = response.getWriter();
        } catch (IOException e) {
            e.printStackTrace();
        }
        out.print(text);
        out.flush();
        out.close();
	}

}
