package com.cts.tshell.repository;

import java.util.List;

import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.cts.tshell.bean.User;

@Repository
public interface UserRepository extends CrudRepository<User, Integer>  {

	List<User> findAllById(@Param("id") int userId);


}
