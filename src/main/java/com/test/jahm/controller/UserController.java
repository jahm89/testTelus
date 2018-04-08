package com.test.jahm.controller;

import com.test.jahm.entity.CreditCard;
import com.test.jahm.entity.Donor;
import com.test.jahm.entity.User;
import com.test.jahm.entity.Donation;
import com.test.jahm.repository.CreditCardRepository;
import com.test.jahm.repository.DonationRepository;
import com.test.jahm.repository.DonorRepository;
import com.test.jahm.repository.UserRepository;
import com.test.jahm.service.CreditCardService;
import com.test.jahm.service.DonorService;
import com.test.jahm.service.SecurityService;
import com.test.jahm.service.UserService;
import com.test.jahm.validator.UserValidator;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {
	
    @Autowired
    private UserService userService;

    @Autowired
    private DonorService donorService;
    
    @Autowired 
    private CreditCardService creditCardService;
    
    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;
    
    @Autowired
    private DonorRepository donorRepository;
    
    @Autowired
    private UserRepository userRepository;
    
    @Autowired
    private DonationRepository donationRepository;
    
    

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model, RedirectAttributes rattrs) {

    	userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }
        
        userService.save(userForm);
        
        //Assign user as donor
        Donor donor = new Donor();
        donor.setIdDocument(Integer.parseInt(userForm.getIdDocument()));
        donor.setIdUser(userForm);
        donor.setName(userForm.getName());
        donor.setSurname(userForm.getSurname());
        donorService.save(donor);
        
        //Create credit card
        String number = userForm.getNumber();
        number = number.replace("-", "");
        
        String date = userForm.getDate();
        String[] dates = date.split("/");
        
        CreditCard card = new CreditCard();
        card.setIdDonor(donor);
        card.setMonthExpiration(Integer.parseInt(dates[0]));
        card.setYearExpiration(Integer.parseInt(dates[1]));
        card.setNumberPin(Integer.parseInt(userForm.getPin()));
        card.setNumber(number);
        
        creditCardService.save(card);
        
        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());
        
        
        return "redirect:/home";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    @RequestMapping(value = {"/", "/home"}, method = RequestMethod.GET)
    public ModelAndView welcome() {
    	
    	Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
    	String userName = authentication.getName();
    	
    	User user = userRepository.findByUsername(userName);
    	Donor donor = donorRepository.findByIdUser(user);
    	
    	List<Donation> donations = new ArrayList<>();
    	donations = donationRepository.findDonations(donor.getId());
    	
    	
    	ModelAndView view = new ModelAndView("home");
    	view.addObject("donor", donor);
    	view.addObject("list", donations);
    	
    	
        return view;
    }
    
    
    
}
