package tp2015dds.daos;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import tp2015dds.beans.Condicion;
import tp2015dds.util.HibernateUtil;

public class GeneralDao {

	public List<Condicion> leerTodasLasCondiciones() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Condicion");///importante es from + el nombre de la clase persistida(no de la tabla)
	//	@SuppressWarnings("unchecked")
		List<Condicion> lista = query.list();
		session.close();
		return lista;
	}
}
