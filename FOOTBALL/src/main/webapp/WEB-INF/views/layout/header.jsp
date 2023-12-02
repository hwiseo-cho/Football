<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <meta name="description" content="" />
    <meta name="author" content="" />
    <title>FOOTBALL</title>
    <link rel="icon" type="${contextPath}/resources/images/soccer_ball_icon.png" href="${contextPath}/resources/images/soccer_ball_icon.png" />
    <!-- Bootstrap icons-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css" rel="stylesheet" />
    <!-- Core theme CSS (includes Bootstrap)-->
    <link href="${contextPath}/resources/css/styles.css" rel="stylesheet" />
</head>

<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
<script src="${contextPath}/resources/js/scripts.js"></script>
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- * *                               SB Forms JS                               * *-->
<!-- * * Activate your form at https://startbootstrap.com/solution/contact-forms * *-->
<!-- * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *-->
<!-- <script src="https://cdn.startbootstrap.com/sb-forms-latest.js"></script> -->
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<!-- Bootstrap core JS-->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<!-- Core theme JS-->
</head>

<script type="text/javascript">
	$(function() {
		$('.dropdown').on('click', function() {
			
			switch ($(this).attr('data-menu')) {
			
			case 'scores': movePage('${contextPath}/home.do')
				break;
			case 'tables': movePage('${contextPath}/ftb/moveTablesPage.do');
				break;
			case 'teams':
				break;

			default:
				break;
			}
			
		});
	});
	
function movePage(url) {
	location.href = url;
}
</script>

<header>
	<!-- Navigation-->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
         <div class="container px-lg-5">
             <a class="navbar-brand" href="#!"><img src="${contextPath}/resources/images/soccer_ball_icon.png" style="width: 30px; margin-top: -4px; margin-right: 10px;"/>FOOTBALL</a>
             <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
             <div class="collapse navbar-collapse" id="navbarSupportedContent">
                 <ul class="navbar-nav ms-auto mb-2 mb-lg-0">
                     <!-- <li class="nav-item"><a class="nav-link active" aria-current="page" href="#!">Home</a></li>
                     <li class="nav-item"><a class="nav-link" href="#!">About</a></li>
                     <li class="nav-item"><a class="nav-link" href="#!">Contact</a></li> -->
                 </ul>
             </div>
         </div>
     </nav>
</header>

<header class="py-4 bg-dark" style="padding-bottom:0 !important;">
	<div class="container px-lg-5">
		
		<div class="text-white" style="height:50px;">
			<div class="float-start text-center dropdown" data-menu="scores">
				<span>Scores</span>
				<div class="dropdown-content">
				    <span class="leagueId" data-id="2021">Premier League</span>
				    <span class="leagueId" data-id="2014">La Liga</span>
				    <span class="leagueId" data-id="2002">Bundesliga</span>
				    <span class="leagueId" data-id="2019">Serie A</span>
				</div>
			</div>
			<div class="float-start text-center dropdown" data-menu="tables">
				<span>Tables</span>
			</div>
			<div class="float-start text-center dropdown" data-menu="teams">
				<span>Teams</span>				
			</div>
			<!-- https://crests.football-data.org/ PL PD BL1 SA -->
		</div>
	</div>
</header>