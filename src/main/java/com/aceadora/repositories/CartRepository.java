package com.aceadora.repositories;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.aceadora.entities.Cart;
import com.aceadora.entities.User;

@Repository
public interface CartRepository extends JpaRepository<Cart, Long> {

	@Query("SELECT c FROM Cart c WHERE c.user = :user")
	List<Cart> getByUser(@Param("user") User user);

}
