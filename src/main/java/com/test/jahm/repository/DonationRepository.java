package com.test.jahm.repository;

import java.io.Serializable;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.test.jahm.entity.Donation;

public interface DonationRepository extends JpaRepository<Donation, Serializable>{
	
	@Query(value="SELECT d.* FROM donation d"
			+ "	WHERE id_donor = :idDoner", nativeQuery=true)
	public abstract List<Donation> findDonations(@Param("idDoner") int idDoner);
}
