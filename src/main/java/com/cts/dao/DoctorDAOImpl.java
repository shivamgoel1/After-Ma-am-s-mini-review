	package com.cts.dao;

import java.util.List;

import javax.persistence.Query;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Root;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cts.entity.CheckupRequest;
import com.cts.entity.Doctor;
import com.cts.entity.UserLogin;

@Repository("doctorDAO")
public class DoctorDAOImpl implements DoctorDAO{
	
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public void saveDoctor(Doctor doctor) {
		
		sessionFactory.getCurrentSession().saveOrUpdate(doctor);
		
	}


	@Override
	public Doctor getDoctor(String id) {
		Session session=sessionFactory.getCurrentSession();
		
//		
//		Criteria crit = session.createCriteria(Doctor.class);
//		crit.add(Restrictions.eq("Email_Id",id));
//		Doctor doctor= new Doctor();
		
//		List<Doctor> results = crit.list();
			
				//System.out.println(i+"````````");
//				System.out.println(results+" yes");
		
	UserLogin login=session.get(UserLogin.class,id);
	int i= login.getId();
	Doctor theDoctor =session.get(Doctor.class,i);
	System.out.println(theDoctor);
		return theDoctor;
		
	}


	@Override
	public List<CheckupRequest> getRequest(String p) {
		
		
		
		// NOT A GOOD PRACTICE TO HIT DATABASE TABLES DIRECTLY 
		
		
//		Session session =sessionFactory.getCurrentSession();
//		String sql="select doctor_table.*,checkup_request_tab.*\r\n" + 
//				"  from doctor_table\r\n" +  
//				"  join checkup_request_tab\r\n" + 
//				"    on doctor_table.Doctor_ID\r\n" + 
//				"     = checkup_request_tab.Doctor_ID\r\n" + 
//				" where checkup_request_tab.Status = 'pending' ";
//		 
//		SQLQuery query = session.createSQLQuery(sql);
//		//query.addEntity(Doctor.class); 
//		query.addEntity(CheckupRequest.class);
//		List <CheckupRequest>results = query.list(); 
//		for(CheckupRequest checkupRequest : results) {
//			System.out.println(checkupRequest.getDate());
//			System.out.println(checkupRequest.getDid());
//			System.out.println(checkupRequest.getStatus());
//		}
//		System.out.println(results.toString());
//		return results;
		
		Session session=sessionFactory.getCurrentSession();
		
		UserLogin login=session.get(UserLogin.class,p);
		int i= login.getId();
		System.out.println(i+"id!!!");
		CriteriaBuilder cb=session.getCriteriaBuilder();
		
		CriteriaQuery<Doctor> query = cb.createQuery(Doctor.class);
		Root<Doctor> doctor = query.from(Doctor.class);
		Join<CheckupRequest,Doctor> request=doctor.join("requests");
		query.select(request).where(cb.equal(request.get("did"),i),cb.equal(request.get("status"),"pending"));
		Query pop =session.createQuery(query);
		List<CheckupRequest> results = pop.getResultList();
		return results;
	}

	
	@Override
	public List<CheckupRequest> getAcceptedRequests(int id) {
		
		Session session=sessionFactory.getCurrentSession();
		
		CriteriaBuilder cb=session.getCriteriaBuilder();
		
		CriteriaQuery<Doctor> query = cb.createQuery(Doctor.class);
		Root<Doctor> doctor = query.from(Doctor.class);
		Join<CheckupRequest,Doctor> request=doctor.join("requests");
		
		query.select(request).where(cb.equal(request.get("did"),id),cb.equal(request.get("status"),"Accepted"));
		   
		
		
		Query pop =session.createQuery(query);
		List<CheckupRequest> results = pop.getResultList();
		return results;
		
	}


	@Override
	public List<CheckupRequest> getReports(int id) {
		
		Session session=sessionFactory.getCurrentSession();
		
		CriteriaBuilder cb=session.getCriteriaBuilder();
		
		CriteriaQuery<Doctor> query = cb.createQuery(Doctor.class);
		Root<Doctor> doctor = query.from(Doctor.class);
		Join<CheckupRequest,Doctor> request=doctor.join("requests");
	
		query.select(request).where(cb.equal(request.get("did"),id),cb.equal(request.get("status"),"Finished"));
		
		Query pop =session.createQuery(query);
		List<CheckupRequest> results = pop.getResultList();

		return results;
	}	
	

}
