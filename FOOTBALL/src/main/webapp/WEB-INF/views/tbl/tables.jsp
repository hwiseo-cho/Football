<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<script>
	$(function() {
		
		// 초기화
		init();
		
		/* 로딩바 구현 */
		$(document).ajaxStart(function() {
			$('#scheduleBody').empty();
			$('#loadingBar').show();
		});
		$(document).ajaxStop(function() {
			$('#loadingBar').hide();
		});
		
	});

/* 초기화 */
function init() {
	// PL 세팅
	$('#leagueId').val('2021');

	//searchLeagueStandings();
}

/* 일정 검색 */
function searchLeagueStandings() {
	
	var param = {
		'leagueId':$('#leagueId').val()
	};
	
	$.ajax({
		type: 'post',
		dataType: 'text',
		async: false,
		url: '${contextPath}/ftb/leagueStandings.do',
		data: param,
		success: function(response) {
			/* 결과값 */
			var result = JSON.parse(response);
			var htmlStr = '';
			
			console.log(result);
			$('#titleImg').attr('src',result.competition.emblem);
			$('#titleText').text(result.competition.name);
		}
	});
	
	$('#loadingBar').hide();
}

/* Date를 yyyyMMdd */
function toDateStringFormat(date) {
	var year = date.getFullYear();
	var temp = date.getMonth()+1;
    var month = (temp < 10) ? '0' + temp : temp;
    var day = (date.getDate() < 10) ? '0' + date.getDate() : date.getDate();

    return year + '-' + month + '-' + day;
}

/* yyyyMMdd를 Date */
function toDateFormat(str) {
    return new Date(str);
}
</script>

<style>
	.standing-title{
		text-align:left; font-size:18px; font-weight:bold; height:70px; display:table;
	}
	.standing-title>p{
		display:table-cell; vertical-align:middle;
	}
	.standing-title>img{
		display:table-cell; width:70px; float:left; margin-right:30px;
	}
</style>
<body>
	<input type="hidden" id="leagueId" name="leagueId" value="" />
	
    <section class="bg-white" style="text-align:center;">
    	
        <div class="container px-lg-5 schedule-body">
            <!-- Page Features-->
            <div class="standing-title">
            	<img id="titleImg" src="https://crests.football-data.org/PL.png"/>
            	<p id="titleText">Premier League</p>
            </div>
            <div id="stadingsBody" class="row gx-lg-5">
			<!-- 축구 일정 영역 -->         
			asas       
            </div>
        </div>
        
        <%-- <img id="loadingBar" src="${contextPath}/resources/images/loading.gif" style="width:40px; margin-top: -690px;"> --%>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
