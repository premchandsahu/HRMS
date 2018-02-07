package PMSNEW.PMSNEW;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;

import PMSNEW.PMSNEW.SelfAppraisal;

public class SelfAppraisalDao {

	JdbcTemplate template; 
	
	public void setTemplate(JdbcTemplate template) {  
	    this.template = template;  
	}  
	public int update(SelfAppraisal p){  
	    String sql="update appr_empl_rating set remarks='"+p.getRemarks()+"', rating="+p.getRating()+ " where ApprEmpid="+p.getApprempid()+" and ApprEmpRatingId="+p.getApprempratingid();  
	    return template.update(sql);  
	}  
	
	public List<SelfAppraisal> getSelfAppraisal(String pusername,String pmode){  
	    return template.query("select * from  view_getappraisalrecords where user_name='"+pusername+"' and phaseid='"+pmode+"' order by SectionColOrder,QuestionColOrder" ,new RowMapper<SelfAppraisal>(){  
	        public SelfAppraisal mapRow(ResultSet rs, int row) throws SQLException {  
	        	SelfAppraisal e=new SelfAppraisal();  
	            e.setApprempid(rs.getInt(1));  
	            e.setApprempratingid(rs.getInt(11));  
	            e.setSection(rs.getString(2));
	            e.setQuestion(rs.getString(3));  
	            e.setRemarks(rs.getString(4));
	            e.setRating(rs.getInt(5));
	            e.setPerformanceind1(rs.getString(7));  
	            e.setPerformanceind2(rs.getString(8));
	            e.setPerformanceind3(rs.getString(9));
	            e.setAppraisalstatus(rs.getString(10));
	            e.setSectioncolorder(rs.getInt(14));
	            e.setQuestioncolorder(rs.getInt(15));
	            
	            return e;  
	        }  
	    });
	}
	    
	    public List<SelfAppraisal> getSelfAppraisalSections(String pusername,String pmode){  
		    return template.query("select distinct section,sectioncolorder from  view_getappraisalrecords where user_name='"+pusername+"' and phaseid='"+pmode+"' order by SectionColOrder" ,new RowMapper<SelfAppraisal>(){  
		        public SelfAppraisal mapRow(ResultSet rs, int row) throws SQLException {  
		        	SelfAppraisal e=new SelfAppraisal();  
		            e.setSection(rs.getString(1));
		            e.setSectioncolorder(rs.getInt(2));
		            return e;  
		        }  
		    });
	    
	} 
	
	
}


