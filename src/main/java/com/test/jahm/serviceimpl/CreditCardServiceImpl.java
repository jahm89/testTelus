package com.test.jahm.serviceimpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.jahm.entity.CreditCard;
import com.test.jahm.repository.CreditCardRepository;
import com.test.jahm.service.CreditCardService;

@Service
public class CreditCardServiceImpl implements CreditCardService{
	
	@Autowired
	private CreditCardRepository creditCardRepository;
	
	@Override
	public void save(CreditCard creditCard) {
		
		creditCardRepository.save(creditCard);
		
	}
	
}
