package org.springside.modules.utils;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public final class JpaUtil {
	
	private static EntityManagerFactory emf;
	
	static {
		System.out.println("default");
		emf = Persistence.createEntityManagerFactory("tbs-payment");
	}

	public static EntityManager getEntityManager(){
		
		return emf.createEntityManager();
	}
}
