<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>    
<style type="text/css">
  <%@include file="mystyle1.css" %>
</style>


<div id="div2">
<p id="company">third(i)</p>
<p id="slogan">Information. Intelligence. Insight. </p>

<button id="logout" style="float:right" onclick="${username}">Logout</button> 
</div><br><br>
<div>
<p id ="pms">Performance Management System</p>
</div>

<div id="test"></div>

<p>You are successfully logged in! </p>



<br>
<br>
<ul>

 <c:forEach var="a" items="${menulist}">   
	<li><a href=${a.link}>${a.submodulename}</a></li>
	 </c:forEach>
</ul>
                
<script type="text/javascript">
function sessionOut(user)
{
	
	//var username=user;
	document.getElementById("test").innerHTML=user+"  manual";
	window.location = "index.jsp";
	
	
}
</script>               
                
                
                
                
                
                
                
                
                
                