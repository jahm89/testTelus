package com.test.jahm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.jahm.entity.Donor;
import com.test.jahm.repository.DonorRepository;
import com.test.jahm.service.DonorService;

@Service
public class DonorServiceImpl implements DonorService{
	
	@Autowired
	private DonorRepository donorRepository;
	
	@Override
	public void save(Donor donor) {
		
		donorRepository.save(donor);
		
	}

}
