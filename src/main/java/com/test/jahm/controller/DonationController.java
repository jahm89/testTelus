package com.test.jahm.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.test.jahm.repository.CreditCardRepository;
import com.test.jahm.repository.DonorRepository;
import com.test.jahm.repository.InstitutionRepository;
import com.test.jahm.repository.UserRepository;
import com.test.jahm.entity.CreditCard;
import com.test.jahm.entity.Donor;
import com.test.jahm.entity.Institution;
import com.test.jahm.entity.User;

@Controller
public class DonationController {
	
	@Autowired
	private InstitutionRepository institucionRepository;
	
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
    private DonorRepository donorRepository;
	
	@Autowired
    private CreditCardRepository creditCardRepository;
	
	@RequestMapping(value = "/donate", method = RequestMethod.GET)
	public ModelAndView doNewDonation(){
		
		ModelAndView view = new ModelAndView("newDonation");
		
		List<Institution> lista = new ArrayList<>();
		
		lista = institucionRepository.findAll();
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String userName = authentication.getName();
    	
    	User user = userRepository.findByUsername(userName);
    	Donor donor = donorRepository.findByIdUser(user);
		
    	CreditCard card = creditCardRepository.findByIdDonor(donor);
    	
		view.addObject("institutions", lista);
		view.addObject("donor", donor);
		view.addObject("card", card);
		
		return view;
		
	}
}
