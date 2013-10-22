package njau.org.util;

import java.util.Date;
import java.util.List;

import njau.org.entity.Announce;
import njau.org.entity.Document;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

/**
 * @author sheng.chen
 *
 */
public final class HibernateUtil{
    private static SessionFactory sessionFactory;
    
    private static Session session;
    
    private HibernateUtil(){
    }

    //初始化
    static{
  	  Configuration cfg = new Configuration();
          cfg.configure();
   	  sessionFactory = cfg.buildSessionFactory();
   	  session=sessionFactory.openSession();
    }    
    
    public static SessionFactory getSessionFactory(){
  	return sessionFactory;
    }
   
    public static Session getSession(){
    	return session;
    }
    
    /**
     * @param hql
     * @return
     */
    public static List<?> findByHql(String hql){
        List<?> result = session.createQuery(hql).list();
        session.clear();
        return result;
    }
    
    /**
     * @param hql
     * @return
     */
    public static long countByHql(String hql){
    	Query query = session.createQuery(hql);
    	//uniqueResult() 方法代表返回的结果唯一
    	return ((Long)query.uniqueResult()).intValue();
    }
    
    /**
     * @param hql
     * @param offset
     * @param length
     * @return 返回分页的结果
     */
    public static List<?>findByHql(String hql,int offset,int length){
    	Query query = session.createQuery(hql);
    	query.setFirstResult(offset);
    	query.setMaxResults(length);
        List<?> result = query.list();
        session.clear();
        return result;
    }
    
    /**
     * @param obj
     */
    public static int save(Object obj){
		int result=(Integer)session.save(obj);
	    session.clear();
	    return result;
    }
    
    /**
     * @param hql
     * @return
     */
    public static int deleteOrUpdateByHql(String hql){
    	  return session.createQuery(hql).executeUpdate();
    }
    
}
