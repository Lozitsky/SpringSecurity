package com.kirilo.training.controllers;

import com.kirilo.training.interfaces.Process;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.security.Principal;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Autowired
    private AccessDecisionManager decisionManager;

    @Autowired
    private Process process;

    /*
     * Simply selects the home view to render by returning its name.
     */
/*	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);

		model.addAttribute("serverTime", formattedDate );

		return "home";
	}*/

    @RequestMapping(value = "/user", method = RequestMethod.GET)
    public String mainPage() {

        logger.info(process.getMessage());

        printUserDetails();
        return "/content/user";

    }

    @RequestMapping(value = "/admin", method = RequestMethod.GET)
    public String adminPage() {
        printUserDetails();
        return "/content/admin";

    }

    @RequestMapping(value = {"/", "/login"}, method = RequestMethod.GET)
    public ModelAndView login(@RequestParam(value = "error", required = false) String error) {

        ModelAndView model = new ModelAndView();
        if (error != null) {
            model.addObject("error", "Invalid username or password!");
        }

        model.setViewName("login");

        return model;

    }

    @RequestMapping(value = "/accessDenied", method = RequestMethod.GET)
    public ModelAndView accessDenied(Principal user) {
        ModelAndView model = new ModelAndView();
        if (user != null) {
            model.addObject("errorMsg", user.getName() + " does not have access to this page!");
        } else {
            model.addObject("errorMsg", "does not have access to this page!");
        }
        model.setViewName("/content/accessDenied");
        return model;
    }

    private void printUserDetails() {

        UserDetails userDetails = (UserDetails) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        logger.info("username: " + userDetails.getUsername());
        logger.info("password: " + userDetails.getPassword());

        userDetails.getAuthorities().forEach(authority -> logger.info(authority.getAuthority()));
    }
}
