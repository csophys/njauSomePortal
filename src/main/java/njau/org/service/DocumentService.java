package njau.org.service;

import java.util.List;

import njau.org.dao.DocumentDao;
import njau.org.dto.ArticleInfoDto;
import njau.org.dto.ResponseDto;
import njau.org.entity.Announce;
import njau.org.entity.Document;
import njau.org.entity.Image;
import njau.org.util.DaoHelper;

/**
 * @author csophys
 * 
 */
public class DocumentService {

	DocumentDao documentDao;

	public DocumentService() {
		documentDao = new DocumentDao();

	}

	public ResponseDto<Document> findList(ArticleInfoDto articleInfoDto,int pageNo,int pageSize ) {
		String hql="From Document where isDelete=1 ";
		if(articleInfoDto.getType()!=null){
			hql +="And type='"+articleInfoDto.getType()+"'";
		}
		hql += " order by updateTime desc";
		ResponseDto<Document> responseDto = (ResponseDto<Document>) DaoHelper
				.buildResponseDto(documentDao, "findList", new Object[] { hql,
						(pageNo-1)*pageSize, pageSize });
		responseDto.setRows((List<Document>) responseDto.getDaoResult());
		fillTotalCount(responseDto, pageNo,hql);
		return responseDto;
	}

	private void fillTotalCount(ResponseDto<Document> responseDto,
			int pageNo,String hql) {
		if (pageNo == 1) {
			responseDto.setTotal(countList(hql));
		}
	}

	private int countList(String hql) {
		ResponseDto<Integer> responseDto = (ResponseDto<Integer>) DaoHelper
				.buildResponseDto(documentDao, "countList", new Object[] { hql });
			
			return (int)responseDto.getDaoResult();

	}

	/*
	public ResponseDto<Document> save(Object document) {
		return (ResponseDto<Document>) DaoHelper.buildResponseDto(documentDao,
				"save", new Object[]{document});
	}
	*/

	public int save(Document document) {
		return documentDao.save(document);
	}
	
	public int save(Object object){
		return documentDao.save(object);
	}
	
	public ResponseDto<Document> update(Document document) {
		return (ResponseDto<Document>) DaoHelper.buildResponseDto(documentDao, "update", new Object[]{document});
	}
	
	public void update (Announce announce){
		documentDao.update(announce);
	}

	public void update(Image image){
		documentDao.update(image);
	}
	
	public Document getDocumentById(int id){
		return documentDao.findListById(id).get(0);
	}
	
	
	public ResponseDto<Document> delete(int id) {
		return (ResponseDto<Document>) DaoHelper.buildResponseDto(documentDao,
				"delete", new Object[]{id});
	}

	/**
	 * @param tableName
	 * @param id
	 * @return
	 */
	public Object getObjectById(String tableName,int id){
		String keyName="";
		if(tableName.equals("Image")){
			keyName = tableName+"Id";
		}else if(tableName.equals("Announce")){
			keyName = "Id";
		}
		return documentDao.getObjectById(tableName, keyName, id);
	}
	
	public Object getObjectByStringField(String tableName, String keyName,
			String keyValue) {
		return documentDao.getObjectByStringField(tableName, keyName, keyValue);
	}

	public ResponseDto<Document> findAnnounceList(int pageNo, int pageSize) {
		String hql="From Announce order by updateTime desc";
		ResponseDto<Document> responseDto = (ResponseDto<Document>) DaoHelper
				.buildResponseDto(documentDao, "findList", new Object[] { hql,
						(pageNo-1)*pageSize, pageSize });
		responseDto.setRows((List<Document>) responseDto.getDaoResult());
		fillTotalCount(responseDto,pageNo,hql);
		return responseDto;
	}

	public ResponseDto<Document> findImageList(int pageNo, int pageSize,
			boolean isShowOnIndex) {
		String hql="From Image order by updateTime desc";
		if (isShowOnIndex) {
			hql = "From Image where isShowOnIndex=1 order by updateTime desc";
		}
		ResponseDto<Document> responseDto = (ResponseDto<Document>) DaoHelper
				.buildResponseDto(documentDao, "findList", new Object[] { hql,
						(pageNo-1)*pageSize, pageSize });
		responseDto.setRows((List<Document>) responseDto.getDaoResult());
		fillTotalCount(responseDto,pageNo,hql);
		return responseDto;
	}
}
