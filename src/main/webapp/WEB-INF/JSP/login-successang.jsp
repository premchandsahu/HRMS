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
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<style>
ul {
    list-style: none;
    padding: 0;
    margin: 0;
}
li {
    float: left;
    border: 1px solid #000;
    border-bottom-width: 0;
    margin: 3px 3px 0px 3px;
    padding: 5px 5px 0px 5px;
    background-color: #CCC;
    color: #696969;
}
#mainView {
    border: 1px solid black;
	clear: both;
	padding: 0 1em;
}
.active {
    background-color: #FFF;
    color: #000;
}
</style>
<div ng-app="TabsApp">
    <div id="tabs" ng-controller="TabsCtrl">
        <ul>
            <li ng-repeat="tab in tabs" 
                ng-class="{active:isActiveTab(tab.url)}" 
                ng-click="onClickTab(tab)">{{tab.title}}</li>
        </ul>
        <div id="mainView">
            <div ng-include="currentTab"></div>
        </div>
    </div>
     <script type="text/ng-template" id="one.tpl.html">
		<div id="viewOne">
			<h1>View One</h1>
			<table border="2" width="70%" cellpadding="2">  
<tr><th>section</th><th>Question</th><th>Remarks</th><th>Rating</th></tr>  
    <c:forEach var="a" items="${list}">   
   <tr>  
   <td>${a.section}</td>  
   <td>${a.question}</td>
   <td>${a.remarks}</td>  
   <td>${a.rating}</td>  
   </tr>  
   </c:forEach> 
   </table>  
		</div>
	</script>
	
	<script type="text/ng-template" id="two.tpl.html">
		<div id="viewTwo">
			<h1>View Two</h1>
			<p>Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu.</p>
		</div>
	</script>
	
	<script type="text/ng-template" id="three.tpl.html">
		<div id="viewThree">
			<h1>View Three</h1>
			<p>In pellentesque faucibus vestibulum. Nulla at nulla justo, eget luctus tortor. Nulla facilisi. Duis aliquet egestas purus in blandit. Curabitur vulputate, ligula lacinia scelerisque tempor, lacus lacus ornare ante, ac egestas est urna sit amet arcu. Class aptent taciti sociosqu.</p>
		</div>
	</script>
</div>
<script>
angular.module('TabsApp', [])
.controller('TabsCtrl', ['$scope', function ($scope) {
    $scope.tabs = [{
            title: 'One',
            url: 'one.tpl.html'
        }, {
            title: 'Two',
            url: 'two.tpl.html'
        }, {
            title: 'Three',
            url: 'three.tpl.html'
    }];

    $scope.currentTab = 'one.tpl.html';

    $scope.onClickTab = function (tab) {
        $scope.currentTab = tab.url;
    }
    
    $scope.isActiveTab = function(tabUrl) {
        return tabUrl == $scope.currentTab;
    }
}]);
</script>                
<script type="text/javascript">
function sessionOut(user)
{
	
	//var username=user;
	document.getElementById("test").innerHTML=user+"  manual";
	window.location = "index.jsp";
	
	
}
</script>               
                
                
                
                
                
                
                
                
                
                