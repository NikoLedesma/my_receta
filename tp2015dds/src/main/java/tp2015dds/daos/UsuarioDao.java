package tp2015dds.daos;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import tp2015dds.beans.Grupo;
import tp2015dds.beans.Usuario;
import tp2015dds.util.HibernateUtil;

public class UsuarioDao {

	public void insertar(Usuario unUsuario){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		session.saveOrUpdate(unUsuario);
		tx.commit();
		session.close();
		
	}
	
	public List<Usuario> leer() {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Query query = session.createQuery("from Usuario");///importante es from + el nombre de la clase persistida(no de la tabla)
	//	@SuppressWarnings("unchecked")
		List<Usuario> lista = query.list();
		session.close();
		return lista;
	}

	
	
	public Usuario buscar(String nombreUsuario) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Usuario unUsuario = (Usuario) session.get(Usuario.class, nombreUsuario);
		session.clear();
		return unUsuario;
	}

	public void eliminar(String nombreUsuario) {
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		Transaction tx = session.beginTransaction();
		Usuario  empresa = (Usuario) session.get(Usuario .class, nombreUsuario);
		session.delete(empresa);
		tx.commit();
		session.close();
	}
	
	public List<Grupo> grupos(String usuario){
		SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
		Session session = sessionFactory.openSession();
		//obtension del usuario
//		String hql ="select g from tp2015dds.beans.Grupo g" +
//					"join g.unUsuario u"+
//					"where u.usuario =:user";
		
		String hql = "SELECT g FROM Usuario u join u.grupos g WHERE u.usuario=:user"  ;
//		String hql = "from Grupo";
		Query query = session.createQuery(hql);
		//query.setParameter("user" ,usuario);
		query.setParameter("user", usuario);		
		List<Grupo> grupos = query.list();	
		session.close();
		return grupos;
	}

	
	
}
