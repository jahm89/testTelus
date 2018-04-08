package com.test.jahm.controller;

import java.io.FileNotFoundException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.test.jahm.repository.DonationRepository;
import com.google.gson.Gson;
import com.test.jahm.entity.Donation;
import com.test.jahm.entity.ResponseCustomWs;
import org.springframework.web.bind.annotation.RequestMethod;

@RestController
public class WebServiceController {
	
	@Autowired
	private DonationRepository donationRepository;
	
	@RequestMapping(value="/getControlDonations", method = RequestMethod.GET)
	public ResponseEntity<List<ResponseCustomWs>>getDonationControll() throws FileNotFoundException, UnsupportedEncodingException{
		
		
		List<ResponseCustomWs> list = new ArrayList<>();
		List<Donation> listDonations = new ArrayList<>();
		
		listDonations = donationRepository.findAll();
		
		for (Donation donation : listDonations) {
			
			ResponseCustomWs item = new ResponseCustomWs();
			item.setCountry(donation.getIdInstitution().getIdDepartment().getIdCountry().getName());
			item.setDateOfDonation(donation.getDate().toString());
			item.setDepartment(donation.getIdInstitution().getIdDepartment().getName());
			item.setEmail(donation.getIdDonor().getEmail());
			item.setIdDocument(Integer.toString(donation.getIdDonor().getIdDocument()));
			item.setInstitution(donation.getIdInstitution().getName());
			item.setName(donation.getIdDonor().getName());
			item.setSurnames(donation.getIdDonor().getSurname());
			item.setDonationAmount(Double.toString(donation.getAmount()));
			
			list.add(item);
			
		}
		
		int index = 1;
		
		PrintWriter writer = new PrintWriter("servicexxx.txt", "UTF-8");
		Gson gson = new Gson();
		writer.println("[");
		
		for (ResponseCustomWs item : list) {
			
			
			String json = gson.toJson(item);
			
			writer.println(json);

			if(index != list.size())
				writer.println(",");
			
			index++;
		}
		
		writer.println("]");
		writer.close();
		
		return new ResponseEntity<List<ResponseCustomWs>>(list, HttpStatus.OK);
		
	}
	
}
