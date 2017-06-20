package cn.lj.shishicai.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.NoRepositoryBean;
import org.springframework.data.repository.PagingAndSortingRepository;

/**
 * 通用DAO接口
 * @author Bill
 *
 * @param <E>
 * @param <PK>
 */
@NoRepositoryBean
public interface IBaseDao<E,PK extends Serializable> extends PagingAndSortingRepository<E, PK>, JpaSpecificationExecutor<E>{

	
}
