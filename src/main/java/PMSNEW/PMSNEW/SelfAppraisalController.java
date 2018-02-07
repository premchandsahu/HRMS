package PMSNEW.PMSNEW;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import PMSNEW.PMSNEW.*;
import PMSNEW.PMSNEW.SelfAppraisals;

@Controller  
public class SelfAppraisalController {
	@Autowired
	LoginDao logindao;
	@Autowired
	SelfAppraisalDao dao;
	String vusername="";
	String vpassword="";
	List<SelfAppraisal> listsection;
	@RequestMapping(value="/login", method=RequestMethod.POST)
	public ModelAndView login(@ModelAttribute("login") Login login){
		ModelAndView modelandview = new ModelAndView();
		vusername=login.getUsername();
		vpassword=login.getPassword();
		
		int cnt=logindao.checkLogin(vusername,vpassword);
		if (cnt!=0)
		{
		List<Menu> list=logindao.getMenu(vusername);  
		modelandview.addObject("menulist",list);
		modelandview.addObject("username",vusername);
		modelandview.setViewName("login-success");
        return modelandview;
		}
        else
        {
        modelandview.addObject("message","Login not found in Database");
        modelandview.addObject("username",vusername);
    	modelandview.setViewName("message");
        return modelandview;}
	}
	
	
	@RequestMapping("/EditAppraiseServlet")
    public ModelAndView selfAppraisal(){
		ModelAndView modelandview=new ModelAndView();
		List<SelfAppraisal> list=dao.getSelfAppraisal(vusername,"1");   
		modelandview.addObject("list",list);
		listsection=dao.getSelfAppraisalSections(vusername,"1");   
		modelandview.addObject("listsection",listsection);
		modelandview.addObject("username",vusername);
		modelandview.setViewName("selfappraisalang");
        return modelandview;
       
       
    }  

	@RequestMapping("/AppraiseServlet")
    public ModelAndView editselfAppraisal(){
		ModelAndView modelandview=new ModelAndView();
		List<SelfAppraisal> list=dao.getSelfAppraisal(vusername,"1");   
		SelfAppraisals selfAppraisals = new SelfAppraisals();
		selfAppraisals.setSelfappraisal(list);
		modelandview.addObject("selfAppraisals",selfAppraisals);
		listsection=dao.getSelfAppraisalSections(vusername,"1");   
		modelandview.addObject("listsection",listsection);
		modelandview.addObject("username",vusername);
		modelandview.setViewName("editselfappraisalang2");
        return modelandview;
       
       
    }  
	
	@RequestMapping(value = "/saveappraisal", method = RequestMethod.POST)
	public ModelAndView save(@ModelAttribute("selfappraisal") SelfAppraisals selfappraisals) {
		System.out.println(selfappraisals);
		System.out.println(selfappraisals.getSelfappraisal());
		List<SelfAppraisal> selfappraisal = selfappraisals.getSelfappraisal();
		
		if(null != selfappraisal && selfappraisal.size() > 0) {
			//ContactController.contacts = contacts;
			for (SelfAppraisal a : selfappraisal) {
				System.out.printf("%s \t %s \n", a.getRemarks(), a.getRating());
			}
		}
		ModelAndView modelandview=new ModelAndView();
		modelandview.addObject("selfAppraisals", selfappraisals);
		modelandview.addObject("listsection",listsection);
		modelandview.setViewName("editselfappraisalang2");
		return  modelandview;
				
		//		ModelAndView("editselfappraisalang2", "selfAppraisals", selfappraisal);
	}

}

