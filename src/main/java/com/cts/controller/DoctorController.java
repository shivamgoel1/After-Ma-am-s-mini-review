package com.cts.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.cts.entity.CheckupRequest;
import com.cts.entity.Doctor;
import com.cts.service.DoctorService;

@Controller
@RequestMapping("/doctor")
public class DoctorController {
	
	@Autowired
	DoctorService doctorService;
	
	
	@PostMapping("/saveDoctor")
	public String saveDoctorDetails(@ModelAttribute("doctor") Doctor theDoctor)
	{
		System.out.println(theDoctor);
		doctorService.saveDoctor(theDoctor);
		return "redirect:/doctor/doctorhome";
	}
	

	@GetMapping("/updateDoctor")
	public String showDoctorUpdateForm(Principal p, Model model)
	{
		String username= p.getName();
		
//		System.out.println("ye rahi ID :"+theId);
	    Doctor theDoctor=doctorService.getDoctor(username);
		model.addAttribute("doctor",theDoctor);
		return "doctorUpdate";
	}
	

	@GetMapping("/doctorhome")
	public String showDoctor(Principal principal , Model model)
	{
		String username = principal.getName();
		System.out.println(username+"in doctor home");
		Doctor theDoctor=doctorService.getDoctor(username);
		model.addAttribute("doctor",theDoctor);
		model.addAttribute("username",username);
		return "test";
	}

	@GetMapping("/viewDoctorRequests")
	public String viewDoctorRequests(Principal principal,Model theModel)
	{
		/*Doctor  doctor =doctorService.getDoctorRequests(Id);*/
		String username = principal.getName();
		List<CheckupRequest> list =doctorService.getRequest(username);
		System.out.println(list);
		theModel.addAttribute("requestlist",list);
		
		return "doctorRequestTest"; 
	}

	@GetMapping("/viewAcceptedRequests")
	public String viewAcceptedRequests(Model theModel,Principal principal)
	{
		String username = principal.getName();
		Doctor theDoctor=doctorService.getDoctor(username);
		int id= theDoctor.getId();
		List<CheckupRequest> results = doctorService.getAcceptedRequests(id);
		theModel.addAttribute("requests",results);
		
		
		return "acceptedRequests";
	
	}
	
	
	@GetMapping("/viewReports")
	public String viewReports(Model theModel,Principal principal)
	{
		String username = principal.getName();
		Doctor theDoctor=doctorService.getDoctor(username);
		int id= theDoctor.getId();
		List<CheckupRequest> results = doctorService.getReports(id);
		System.out.println(results+"reports~~~~~");
		theModel.addAttribute("requests",results);
		
		return "doctorReports";
	
	}
	
	
}
