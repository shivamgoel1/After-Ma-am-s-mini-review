package com.cts.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;

import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cts.entity.CheckupRequest;
import com.cts.entity.Customer;
import com.cts.entity.Doctor;
import com.cts.entity.Services;
import com.cts.entity.UserLogin;

@Repository("customerdao")
public class CustomerDAOImpl implements CustomerDAO{

	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void registerUser(Customer customer) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().saveOrUpdate(customer);
		//return null;
	}
	
	@Override
	public List<Services> serviceList() {
		// TODO Auto-generated method stub
		
		Session session= sessionFactory.getCurrentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Services> query= builder.createQuery(Services.class);
		Root<Services> root = query.from(Services.class);
		query.select(root);
		Query query2= session.createQuery(query);
		return query2.getResultList();
	}

	@Override
	public List<Doctor> doctorList() {
		// TODO Auto-generated method stub
		Session session= sessionFactory.getCurrentSession();
		CriteriaBuilder builder = session.getCriteriaBuilder();
		CriteriaQuery<Doctor> query= builder.createQuery(Doctor.class);
		Root<Doctor> root = query.from(Doctor.class);
		query.select(root);
		Query query2= session.createQuery(query);
		return query2.getResultList();
	}

	@Override
	public Customer getCustomer(String id) {
		Session session=sessionFactory.getCurrentSession();
		System.out.println(id+"int he DAOImpl");
		
		
		UserLogin login=session.get(UserLogin.class,id);
		int i= login.getId();
		Customer customer=session.get(Customer.class,i);
		System.out.println(customer);
		return customer;
	}

	@Override
	public void saveRequest(CheckupRequest request) {
		// TODO Auto-generated method stub
		sessionFactory.getCurrentSession().save(request);
	}

	
	@Override
	public List<CheckupRequest> getRequest(String p) {
		// TODO Auto-generated method stub
		
		Session session =sessionFactory.getCurrentSession();
		UserLogin login=session.get(UserLogin.class,p);
		int i= login.getId();
		
		CriteriaBuilder cb=session.getCriteriaBuilder();
		
		CriteriaQuery<Customer> query = cb.createQuery(Customer.class);
		Root<Customer> cutomer = query.from(Customer.class);
		Join<CheckupRequest,Customer> request=cutomer.join("requests");
		System.out.println(i+"id!!!!");
		query.select(request).where(cb.equal(request.get("cid"),i));
		
		Query pop =session.createQuery(query);
		List<CheckupRequest> results = pop.getResultList();
		return results;     
	}

	@Override
	public List<CheckupRequest> getReports(int id) {
		
		Session session=sessionFactory.getCurrentSession();
		
		CriteriaBuilder cb=session.getCriteriaBuilder();
		
		CriteriaQuery<Customer> query = cb.createQuery(Customer.class);
		Root<Customer> cutomer = query.from(Customer.class);
		Join<CheckupRequest,Customer> request=cutomer.join("requests");
		query.select(request).where(cb.equal(request.get("status"), "Finished"),cb.equal(request.get("cid"),id));
		
		
		Query pop =session.createQuery(query);
		List<CheckupRequest> results = pop.getResultList();

		return results;
	}

	@Override
	public List<Customer> allCustomers() {
		// TODO Auto-generated method stub
		Session session=sessionFactory.getCurrentSession();
		CriteriaBuilder cb=session.getCriteriaBuilder();
		
		CriteriaQuery<Customer> query= cb.createQuery(Customer.class);
		Root<Customer> root = query.from(Customer.class);
		query.select(root);
		Query query2= session.createQuery(query);
		return query2.getResultList();
	}

	@Override
	public Customer getCustomerById(int id) {
		 Session session=sessionFactory.getCurrentSession();
		 Customer customer=session.get(Customer.class,id);
			System.out.println(customer);
			return customer;
				
	}	
	
	
}
