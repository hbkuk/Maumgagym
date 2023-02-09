package com.maumgagym.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.maumgagym.dao.MemberDAO;
import com.maumgagym.dto.MemberTO;
import com.maumgagym.message.scriptMessage;


@Controller
public class CreateAccountController {
	
	@Autowired
	private MemberDAO dao;
	
	
	@RequestMapping(value = "/member/createAccountPage"  )
	public ModelAndView createAccountPage() {
	     
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("createAccountPage");
		
		return modelAndView;
		
	   }
	
	@RequestMapping(value = "/member/createAccount"  )
	public String createAccountPage(HttpServletRequest request, Model model) {
	     
		MemberTO to = new MemberTO();
		to.setNickname(request.getParameter("nickName")); 
		to.setId(request.getParameter("id")); 
		to.setPassword(request.getParameter("userPW")); 
		to.setName(request.getParameter("name")); 
		to.setMail1(request.getParameter("mail1")); 
		to.setMail2(request.getParameter("mail2"));
		to.setType(request.getParameter("type"));
		to.setBirthyy(request.getParameter("year"));
		to.setBirthmm(request.getParameter("month"));
		to.setBirthdd(request.getParameter("day"));
		to.setZipcode(request.getParameter("zipcode"));
		to.setAddress(request.getParameter("address"));
		to.setReferAddress(request.getParameter("referAddress"));
		to.setFullAddress(request.getParameter("fullAddress"));
		
		int flag = dao.join(to);
		model.addAttribute("flag" , flag);
		
		return "createOK";
   }
	
}
