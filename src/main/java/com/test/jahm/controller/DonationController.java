package com.test.jahm.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpRequest;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.test.jahm.repository.CreditCardRepository;
import com.test.jahm.repository.DonationRepository;
import com.test.jahm.repository.DonorRepository;
import com.test.jahm.repository.InstitutionRepository;
import com.test.jahm.repository.UserRepository;

import net.minidev.json.JSONObject;

import com.test.jahm.entity.CreditCard;
import com.test.jahm.entity.Donation;
import com.test.jahm.entity.Donor;
import com.test.jahm.entity.Institution;
import com.test.jahm.entity.User;

@Controller
public class DonationController {
	
	@Autowired
	private InstitutionRepository institutionRepository;
	
	@Autowired
    private UserRepository userRepository;
	
	@Autowired
    private DonorRepository donorRepository;
	
	@Autowired
    private CreditCardRepository creditCardRepository;
	
	@Autowired
    private DonationRepository donationRepository;
	
	@RequestMapping(value = "/donate", method = RequestMethod.GET)
	public ModelAndView doNewDonation(Model model){
		
		ModelAndView view = new ModelAndView("newDonation");
		
		List<Institution> lista = new ArrayList<>();
		
		lista = institutionRepository.findAll();
		
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String userName = authentication.getName();
    	
    	User user = userRepository.findByUsername(userName);
    	Donor donor = donorRepository.findByIdUser(user);
		
    	CreditCard card = creditCardRepository.findByIdDonor(donor);
    	
		view.addObject("institutions", lista);
		view.addObject("donor", donor);
		view.addObject("card", card);
		model.addAttribute("donationForm", new Donation());
		
		return view;
		
	}
	
	@RequestMapping(value = "/savedonate", method = RequestMethod.POST)
	@ResponseBody
	public JSONObject saveDonation(@RequestParam Double amount, @RequestParam int idDonor, @RequestParam int idInstitution) {
		
		JSONObject response = new JSONObject();
		
		//Check if exist donation in current month
		Date date = new Date();
		Calendar cal = Calendar.getInstance();
		cal.setTime(date);
		
		int month = cal.get(Calendar.MONTH)+1;
		Institution institution = institutionRepository.findOne(idInstitution);
		
		Donation donationExist = donationRepository.findDonationsByMonthAndYear(month, cal.get(Calendar.YEAR), idDonor, institution.getIdDepartment().getIdCountry().getId());
		
		if(donationExist != null) {
			System.out.println("nono");
			response.put("message", "You already donated to some institution from this country, "
						+ "you can donate only once by month at the institutions from determined country");
			response.put("status", "ERROR");
			return response;
		}
		
		Donor donor = donorRepository.findOne(idDonor);
		
		
		Donation donation = new Donation();
		donation.setIdDonor(donor);
		donation.setIdInstitution(institution);
		donation.setDate(date);
		donation.setAmount(amount);
		
		donationRepository.save(donation);
		
		if(donation.getId() != null) {
			response.put("message", "You donation has been successful!, Thanks!");
			response.put("status", "OK");
		}
		else {
			response.put("message", "You donation had a problem, contact us to resolve!");
			response.put("status", "ERROR");
		}
		
		return response;
		
	}
}
