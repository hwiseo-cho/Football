<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<script>
	$(function() {
		
		// 초기화
		init();
		
		$('#leagueSelect').on('change', function() {
			searchLeagueStandings();
		});
		
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
	$('#leagueSelect').val('2021');

	searchLeagueStandings();
}

/* 일정 검색 */
function searchLeagueStandings() {
	
	var param = {
		'leagueId':$('#leagueSelect').val()
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
			
			var standings = result.standings[0].table;
			
			for(var i=0; i<standings.length; i++) {
				htmlStr += '<tr>';
				htmlStr += '  <th scope="row" class="position'+standings[i].position+'">'+ standings[i].position +'</th>';
				htmlStr += '  <td colspan="2" class="text-start"><img style="width:21px;" src="'+ standings[i].team.crest +'"> '+ standings[i].team.name +'</td>';
				htmlStr += '  <td>'+ standings[i].playedGames +'</td>';
				htmlStr += '  <td>'+ standings[i].won +'</td>';
				htmlStr += '  <td>'+ standings[i].draw +'</td>';
				htmlStr += '  <td>'+ standings[i].lost +'</td>';
				
				if(Number(standings[i].goalDifference) > 0) {
					htmlStr += '  <td class="text-success">+'+ standings[i].goalDifference +'</td>';
				} 
				else if(Number(standings[i].goalDifference) < 0) {
					htmlStr += '  <td class="text-danger">'+ standings[i].goalDifference +'</td>';
				}
				else {
					htmlStr += '  <td class="text-secondary">'+ standings[i].goalDifference +'</td>';
				}
				htmlStr += '  <td>'+ standings[i].points +'</td>';
				htmlStr += '</tr>';
			}
			
			$('#stadingsBody').html(htmlStr);
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
		text-align:left; font-size:18px; font-weight:bold; height:70px; display:table; margin:20px 0 20px 0;
	}
	.standing-title>p{
		display:table-cell; vertical-align:middle;
	}
	.standing-title>img{
		display:table-cell; width:70px; float:left; margin-right:30px;
	}
	
	.position1,.position2,.position3,.position4 {
		border-left:4px solid #6f8dd9;
	}
	.position5,.position6 {
		border-left:4px solid #80d882;
	}
	.position18,.position19,.position20 {
		border-left:4px solid #c0c0c0;
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
            <div>
            	<select id="leagueSelect" class="form-select" style="width:200px;">
					<option value="2021" selected>Premier League</option>
					<option value="2014">La Liga</option>
					<option value="2002">Bundesliga</option>
					<option value="2019">Serie A</option>
				</select>
            </div>
            <div class="row gx-lg-5">
			<!-- 축구 일정 영역 -->         
				<table class="table">
				  <thead>
				    <tr>
				      <th scope="col"></th>
				      <th scope="col" colspan="2" style="width:30%;" class="text-start">Team</th>
				      <th scope="col">GP</th>
				      <th scope="col">W</th>
				      <th scope="col">D</th>
				      <th scope="col">L</th>
				      <th scope="col">GD</th>
				      <th scope="col">Point</th>
				    </tr>
				  </thead>
				  <tbody id="stadingsBody">
				    
				  </tbody>
				</table>
            </div>
        </div>
        
        <img id="loadingBar" src="${contextPath}/resources/images/loading.gif" style="width:40px; margin-top: -690px;">
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
