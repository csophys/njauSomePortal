package njau.org.dao;

import java.util.List;

import njau.org.entity.Announce;
import njau.org.util.HibernateUtil;

public class AnnounceDao {

	public List<Announce> findAnnounceList(){
		return (List<Announce>)HibernateUtil.findByHql("From Announce order by updateTime desc");
	}
}
