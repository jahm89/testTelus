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
	
	@Query(value="SELECT d.* FROM donation d"
			+ " INNER JOIN institution ins on ins.id = d.id_institution \n" + 
				" INNER JOIN department de on de.id = ins.id_department\n" + 
				" INNER JOIN country cn on cn.id = de.id_country"
			+ "	 WHERE month(d.date) = :month AND year(d.date) = :year AND d.id_donor = :idDonor AND cn.id = :idCountry limit 1", nativeQuery=true)
	public abstract Donation findDonationsByMonthAndYear(@Param("month") int month, @Param("year") int year, @Param("idDonor") int idDonor, @Param("idCountry") int idCountry);
}
