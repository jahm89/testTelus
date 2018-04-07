package com.test.jahm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.jahm.entity.Donation;
import com.test.jahm.repository.DonationRepository;
import com.test.jahm.service.DonationService;

@Service
public class DonationServiceImpl implements DonationService{
	
	@Autowired
	private DonationRepository donationRepositor;
	
	@Override
	public void save(Donation donation) {
		
		donationRepositor.save(donation);
		
	}

}
