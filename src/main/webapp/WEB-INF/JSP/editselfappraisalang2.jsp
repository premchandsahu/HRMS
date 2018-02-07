<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div id="div2">
<p id="company">third(i)</p>
<p id="slogan">Information. Intelligence. Insight. </p>

<button id="logout" style="float:right" onclick="${username}">Logout</button> 
</div><br>
<div>
<p id ="pms">Performance Management System</p>
</div>

<div id="test"></div>

<p>You are successfully logged in! </p>

<br>

<style>
body {font-family: Arial;}

/* Style the tab */
.tab {
    overflow: hidden;
    border: 1px solid #ccc;
    background-color: #f1f1f1;
}

/* Style the buttons inside the tab */
.tab button {
    background-color: inherit;
    float: left;
    border: none;
    outline: none;
    cursor: pointer;
    padding: 14px 16px;
    transition: 0.3s;
    font-size: 17px;
}

/* Change background color of buttons on hover */
.tab button:hover {
    background-color: #ddd;
}

/* Create an active/current tablink class */
.tab button.active {
    background-color: #ccc;
}

/* Style the tab content */
.tabcontent {
    display: none;
    padding: 6px 12px;
    border: 1px solid #ccc;
    border-top: none;
}
</style>
</head>


<body>


<div class="tab">
<c:set var="firstrun" value="true"/>
<c:forEach var="a" items="${listsection}">
<c:set var="firstval" value=""/>
	<c:if test= "${firstrun eq 'true'}">
			<c:set var="firstval" value="defaultOpen"/>
			<c:set var="firstrun" value="false"/>
	</c:if>
  <button class="tablinks" onclick="openSection(event, 's${a.sectioncolorder}')" id="${firstval}">${a.section}</button>
</c:forEach>

</div>

<form:form method="post" action="saveappraisal" modelAttribute="selfappraisal">

<c:set var="sectionname" value="ABC"/>
<c:set var="sectionname1" value="ABC"/>
<c:set var="sectionname2" value="ABC"/>
<c:set var="firstrun" value="true"/>
	
<c:forEach var="a" items="${selfAppraisals.selfappraisal}" varStatus="status">
	<c:set var="sectionname1" value="${a.section}"/>
	<c:if test= "${sectionname1 ne sectionname2}" >
		<c:if test= "${firstrun eq 'false'}">
			</div>
		</c:if>
		<div id="s${a.sectioncolorder}" class="tabcontent">		
	</c:if>
	<c:if test= "${firstrun eq 'true'}">
		<c:set var="firstrun" value="false"/>
	</c:if>	
	<h3>${a.question}</h3>
	<textarea name="selfappraisal[${status.index}].remarks" value="${a.remarks}"></textarea>
	<td><input name="selfappraisal[${status.index}].rating" value="${a.rating}" maxlength="1" size="1"/></td>
 	<c:set var="sectionname2" value="${a.section}"/>
</c:forEach>
</div>


<script>
function openSection(evt, sectionName) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(sectionName).style.display = "block";
    evt.currentTarget.className += " active";
}
document.getElementById("defaultOpen").click();
</script>
     


<input type="submit" value="Save"/> 
</form:form>
</body>




<script type="text/javascript">
function sessionOut(user)
{
	
	//var username=user;
	document.getElementById("test").innerHTML=user+"  manual";
	window.location = "index.jsp";
	
	
}
</script>               
                
                
                
                
                
                
                
                
                
                