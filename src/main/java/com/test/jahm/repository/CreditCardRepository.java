package com.test.jahm.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.jahm.entity.CreditCard;
import com.test.jahm.entity.Donor;

public interface CreditCardRepository extends JpaRepository<CreditCard, Serializable>{
	
	CreditCard findByIdDonor(Donor id);
}
