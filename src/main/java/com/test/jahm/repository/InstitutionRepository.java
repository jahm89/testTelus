package com.test.jahm.repository;

import java.io.Serializable;

import org.springframework.data.jpa.repository.JpaRepository;

import com.test.jahm.entity.Institution;

public interface InstitutionRepository extends JpaRepository<Institution, Serializable>{

}
