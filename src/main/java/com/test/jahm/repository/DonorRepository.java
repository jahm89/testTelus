package com.test.jahm.repository;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.test.jahm.entity.Donor;
import com.test.jahm.entity.User;
import com.test.jahm.entity.Donation;

public interface DonorRepository extends JpaRepository<Donor, Serializable>{
	
	Donor findByIdUser(User user);
	
}
