package njau.org.util;

import java.lang.reflect.Method;

import njau.org.dto.ResponseDto;

public class DaoHelper {

	/**
	 * @param objectDao
	 * @param methodName
	 * @param paras
	 * @return
	 */
	public static ResponseDto<?> buildResponseDto(Object objectDao,String methodName,Object[] paras) {
		int code=500;String msg="";
		//新建返回对象，最好可以由调用方传入
		ResponseDto<?> responseDto=new ResponseDto<Object>();
		try {
			//执行成功
			code=200;
			Object objectResult = getMethod(objectDao, methodName, paras);
			responseDto.setDaoResult(objectResult);
			
		}catch(NoSuchMethodException e){
			code=500;
			msg="调用方法出错";
			System.out.println("找不到方法");
		}catch (Exception e) {
			//执行失败，会由于各种异常引起，最好通过多重catch捕获各类异常
			code=500;
			msg=e.getMessage();
		}
		responseDto.setCode(code);
		responseDto.setMsg(msg);
		
		return responseDto;
	}

	
	
	 /**
	 * @param object
	 * @param methodName
	 * @param paras
	 * @return
	 * @throws Exception
	 */
	private static Object getMethod(Object object,String methodName,Object[] paras) throws Exception{
        Class<?> clazz[]=null;
        //如果存在参数
        if(paras!=null){
            int len=paras.length;
            clazz=new Class[len];
            for(int i=0;i<len;++i){
                clazz[i]=paras[i].getClass();
            }
        }

         Method method=object.getClass().getDeclaredMethod(methodName,clazz);
         return method.invoke(object,paras);

   }
	 
}
