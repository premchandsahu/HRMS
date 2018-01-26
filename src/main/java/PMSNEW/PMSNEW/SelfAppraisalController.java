package PMSNEW.PMSNEW;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import PMSNEW.PMSNEW.*;

@Controller  
public class SelfAppraisalController {
	@Autowired
	LoginDao logindao;
	@Autowired
	SelfAppraisalDao dao;
	String vusername="";
	String vpassword="";
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
	
	@RequestMapping("/AppraiseServlet")
	
    public ModelAndView selfAppraisal(){
		ModelAndView modelandview=new ModelAndView();
		List<SelfAppraisal> list=dao.getSelfAppraisal(vusername,"1");   
		modelandview.addObject("list",list);
		modelandview.addObject("username",vusername);
		modelandview.setViewName("selfappraisalang");
        return modelandview;
       
       
    }  
	

}

