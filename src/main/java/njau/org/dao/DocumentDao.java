package njau.org.dao;

import java.util.List;

import njau.org.entity.Announce;
import njau.org.entity.Document;
import njau.org.entity.Image;
import njau.org.util.HibernateUtil;

/**
 * @author csophys
 *
 */
public class DocumentDao {

	/**
	 * @param hql
	 * @return
	 */
	@Deprecated
	public List<Document> findList(String hql){
		if(hql.isEmpty()){
			return (List<Document>)HibernateUtil.findByHql("From Document where isDelete=1 order by updateTime desc");
		}
		
		return (List<Document>)HibernateUtil.findByHql(hql);
		
	}
	
	
	/**
	 * @param id
	 * @return
	 */
	
	/**
	 * @param tableName
	 * @param keyName
	 * @param id
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Object getObjectById(String tableName,String keyName,Integer id){
		String hql = "From "+tableName+" where "+keyName+" = "+id;
		List<Object> objectList = (List<Object>)HibernateUtil.findByHql(hql);
		if(objectList.size()>0) return objectList.get(0);
		else{
			return null;
		}
	}

	/**
	 * @param tableName
	 * @param keyName
	 * @param keyValue
	 * @return
	 */
	@SuppressWarnings("unchecked")
	public Object getObjectByStringField(String tableName, String keyName,
			String keyValue) {
		String hql = "From " + tableName + " where " + keyName + " = '"
				+ keyValue + "'";
		List<Object> objectList = (List<Object>) HibernateUtil.findByHql(hql);
		if (objectList.size() > 0)
			return objectList.get(0);
		else {
			return null;
		}
	}

	//可以将以下的几个方法抽象成传一个方法名和id的方法，不过需要将相关表面的id表面按照统一风格来命名
	@Deprecated
	public List<Document> findListById(Integer id){
		return (List<Document>)HibernateUtil.findByHql("From Document where isDelete=1 and documentId="+id);
	}
	
	/*
	public List<Announce> findAnnounceListById(Integer id){
		return (List<Announce>)HibernateUtil.findByHql("From Announce where isDelete=1 and id="+id);
	}
	
	public List<Image> findImageListById(Integer id){
		return (List<Image>)HibernateUtil.findByHql("From Image where isDelete=1 and imageId="+id);
	}
	*/
	
	
	/**
	 * @param hql
	 * @return
	 */
	public int countList(String hql){
		if(hql.isEmpty()){
			return (int)HibernateUtil.countByHql("Select count(*) From Document where isDelete=1");
		}
		
		return (int)HibernateUtil.countByHql("Select count(*) "+hql);
	}
	
	
	/**
	 * @param hql
	 * @param offset
	 * @param length
	 * @return
	 */
	public List<?> findList(String hql,Integer offset,Integer length){
		if(hql.isEmpty()){
			return HibernateUtil.findByHql("From Document where isDelete=1 order by updateTime desc",offset,length);
		}
		
		return HibernateUtil.findByHql(hql, offset, length);
		
	}
	
	
	/**
	 * @param document
	 * @return
	 * 保存任一个对象
	 */
	@Deprecated
	public int save(Document document){
		return HibernateUtil.save(document);
	}
	
	public int save(Object object){
		return HibernateUtil.save(object);		
	}
	
	
	/**
	 * @param document
	 * @return 更新文章的dao
	 */
	public int update(Document document){
		String title = document.getTitle();
		String content = document.getContent();
		String type = document.getType();
		int isTop = document.getIsTop();
		String  hql="Update Document set title='"+title+"'";
		hql += " , content='"+content+"'";
		hql += " , type='"+type+"'";
		hql += " , isTop="+isTop;
		hql += " where documentId="+document.getDocumentId();
		return HibernateUtil.deleteOrUpdateByHql(hql);
	}
	
	/**
	 * @param image
	 * @return
	 */
	public int update(Image image){
		String title = image.getTitle();
		String imageUrl = image.getImageUrl();
		int isShowOnIndex = image.getIsShowOnIndex();
		String filePath = image.getFilePath();
		String  hql="Update Image set title='"+title+"'";
		hql += " , imageUrl='"+imageUrl+"'";
		hql += " , filePath='"+filePath+"'";
		hql += " , isShowOnIndex="+isShowOnIndex;
		hql += " where imageId="+image.getImageId();
		return HibernateUtil.deleteOrUpdateByHql(hql);
	}
	
	/**
	 * @param announce
	 * @return
	 */
	public int update(Announce announce){
		String title = announce.getTitle();
		String url = announce.getUrl();
		String  hql="Update Announce set title='"+title+"'";
		hql += " , url='"+url+"'";
		hql += " where Id="+announce.getId();
		return HibernateUtil.deleteOrUpdateByHql(hql);		
	}
	
	/**
	 * @param id
	 * @return 删除文章
	 */
	
	//优化方案同根据id取数据
	@Deprecated
	public int delete(Integer id){
		return HibernateUtil.deleteOrUpdateByHql("Update Document set isDelete=0 where documentId="+id);
	}
	
	//删除数据
	public int deleteById(String tableName ,String keyName, Integer id){
		return HibernateUtil.deleteOrUpdateByHql("Update "+tableName+" set isDelete=0 where "+keyName+" = "+id);
	}
}
