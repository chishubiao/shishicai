package cn.lj.shishicai.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * 需要自定义复杂native sql时继承此抽象类
 * @author Bill
 *
 */
public abstract class AbstractCustomBaseDao {
    @PersistenceContext
    protected EntityManager entityManager;
}
