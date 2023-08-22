<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<style>
	.score_team_icon{
		max-width: 40% !important;
	    display: inline-block;
	    vertical-align: middle;
	    height: 100%;
	    width: 40%;
	}
	.score_team_vs{
	    height: 100%;
	    max-width: 20%;
	    width: 20%;
	    vertical-align: middle;
    	display: inline-block;
    	font-size: 19px;
	}
</style>

<script>
	$(function() {
		var param = {};
		
		$.ajax({
			type: 'post',
			dataType: 'text',
			url: '${contextPath}/todayMatches.do',
			data: {},
			success: function(response) {
				var test = '{"filters":{"season":"2023","matchday":"1"},"resultSet":{"count":10,"first":"2023-08-11","last":"2023-08-14","played":10},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"matches":[{"area":{"id":2072,"name":"England","code":"ENG","flag":"https://crests.football-data.org/770.svg"},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"season":{"id":1564,"startDate":"2023-08-11","endDate":"2024-05-19","currentMatchday":2,"winner":null},"id":435943,"utcDate":"2023-08-11T19:00:00Z","status":"FINISHED","matchday":1,"stage":"REGULAR_SEASON","group":null,"lastUpdated":"2023-08-12T01:04:51Z","homeTeam":{"id":328,"name":"Burnley FC","shortName":"Burnley","tla":"BUR","crest":"https://crests.football-data.org/328.png"},"awayTeam":{"id":65,"name":"Manchester City FC","shortName":"Man City","tla":"MCI","crest":"https://crests.football-data.org/65.png"},"score":{"winner":"AWAY_TEAM","duration":"REGULAR","fullTime":{"home":0,"away":3},"halfTime":{"home":0,"away":2}},"odds":{"msg":"Activate Odds-Package in User-Panel to retrieve odds."},"referees":[{"id":11585,"name":"Craig Pawson","type":"REFEREE","nationality":"England"}]},{"area":{"id":2072,"name":"England","code":"ENG","flag":"https://crests.football-data.org/770.svg"},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"season":{"id":1564,"startDate":"2023-08-11","endDate":"2024-05-19","currentMatchday":2,"winner":null},"id":435944,"utcDate":"2023-08-12T12:00:00Z","status":"FINISHED","matchday":1,"stage":"REGULAR_SEASON","group":null,"lastUpdated":"2023-08-13T01:29:23Z","homeTeam":{"id":57,"name":"Arsenal FC","shortName":"Arsenal","tla":"ARS","crest":"https://crests.football-data.org/57.png"},"awayTeam":{"id":351,"name":"Nottingham Forest FC","shortName":"Nottingham","tla":"NOT","crest":"https://crests.football-data.org/351.png"},"score":{"winner":"HOME_TEAM","duration":"REGULAR","fullTime":{"home":2,"away":1},"halfTime":{"home":2,"away":0}},"odds":{"msg":"Activate Odds-Package in User-Panel to retrieve odds."},"referees":[{"id":11605,"name":"Michael Oliver","type":"REFEREE","nationality":"England"}]},{"area":{"id":2072,"name":"England","code":"ENG","flag":"https://crests.football-data.org/770.svg"},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"season":{"id":1564,"startDate":"2023-08-11","endDate":"2024-05-19","currentMatchday":2,"winner":null},"id":435945,"utcDate":"2023-08-12T14:00:00Z","status":"FINISHED","matchday":1,"stage":"REGULAR_SEASON","group":null,"lastUpdated":"2023-08-13T01:29:23Z","homeTeam":{"id":1044,"name":"AFC Bournemouth","shortName":"Bournemouth","tla":"BOU","crest":"https://crests.football-data.org/1044.png"},"awayTeam":{"id":563,"name":"West Ham United FC","shortName":"West Ham","tla":"WHU","crest":"https://crests.football-data.org/563.png"},"score":{"winner":"DRAW","duration":"REGULAR","fullTime":{"home":1,"away":1},"halfTime":{"home":0,"away":0}},"odds":{"msg":"Activate Odds-Package in User-Panel to retrieve odds."},"referees":[{"id":11309,"name":"Peter Bankes","type":"REFEREE","nationality":"England"}]},{"area":{"id":2072,"name":"England","code":"ENG","flag":"https://crests.football-data.org/770.svg"},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"season":{"id":1564,"startDate":"2023-08-11","endDate":"2024-05-19","currentMatchday":2,"winner":null},"id":435946,"utcDate":"2023-08-12T14:00:00Z","status":"FINISHED","matchday":1,"stage":"REGULAR_SEASON","group":null,"lastUpdated":"2023-08-13T01:29:23Z","homeTeam":{"id":397,"name":"Brighton & Hove Albion FC","shortName":"Brighton Hove","tla":"BHA","crest":"https://crests.football-data.org/397.svg"},"awayTeam":{"id":389,"name":"Luton Town FC","shortName":"Luton Town","tla":"LUT","crest":"https://crests.football-data.org/389.png"},"score":{"winner":"HOME_TEAM","duration":"REGULAR","fullTime":{"home":4,"away":1},"halfTime":{"home":1,"away":0}},"odds":{"msg":"Activate Odds-Package in User-Panel to retrieve odds."},"referees":[{"id":11556,"name":"David Coote","type":"REFEREE","nationality":"England"}]},{"area":{"id":2072,"name":"England","code":"ENG","flag":"https://crests.football-data.org/770.svg"},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"season":{"id":1564,"startDate":"2023-08-11","endDate":"2024-05-19","currentMatchday":2,"winner":null},"id":435947,"utcDate":"2023-08-12T14:00:00Z","status":"FINISHED","matchday":1,"stage":"REGULAR_SEASON","group":null,"lastUpdated":"2023-08-13T01:29:23Z","homeTeam":{"id":62,"name":"Everton FC","shortName":"Everton","tla":"EVE","crest":"https://crests.football-data.org/62.png"},"awayTeam":{"id":63,"name":"Fulham FC","shortName":"Fulham","tla":"FUL","crest":"https://crests.football-data.org/63.svg"},"score":{"winner":"AWAY_TEAM","duration":"REGULAR","fullTime":{"home":0,"away":1},"halfTime":{"home":0,"away":0}},"odds":{"msg":"Activate Odds-Package in User-Panel to retrieve odds."},"referees":[{"id":11494,"name":"Stuart Attwell","type":"REFEREE","nationality":"England"}]},{"area":{"id":2072,"name":"England","code":"ENG","flag":"https://crests.football-data.org/770.svg"},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"season":{"id":1564,"startDate":"2023-08-11","endDate":"2024-05-19","currentMatchday":2,"winner":null},"id":435948,"utcDate":"2023-08-12T14:00:00Z","status":"FINISHED","matchday":1,"stage":"REGULAR_SEASON","group":null,"lastUpdated":"2023-08-13T01:29:23Z","homeTeam":{"id":356,"name":"Sheffield United FC","shortName":"Sheffield Utd","tla":"SHE","crest":"https://crests.football-data.org/356.svg"},"awayTeam":{"id":354,"name":"Crystal Palace FC","shortName":"Crystal Palace","tla":"CRY","crest":"https://crests.football-data.org/354.png"},"score":{"winner":"AWAY_TEAM","duration":"REGULAR","fullTime":{"home":0,"away":1},"halfTime":{"home":0,"away":0}},"odds":{"msg":"Activate Odds-Package in User-Panel to retrieve odds."},"referees":[{"id":11327,"name":"John Brooks","type":"REFEREE","nationality":"England"}]},{"area":{"id":2072,"name":"England","code":"ENG","flag":"https://crests.football-data.org/770.svg"},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"season":{"id":1564,"startDate":"2023-08-11","endDate":"2024-05-19","currentMatchday":2,"winner":null},"id":435949,"utcDate":"2023-08-12T16:30:00Z","status":"FINISHED","matchday":1,"stage":"REGULAR_SEASON","group":null,"lastUpdated":"2023-08-13T01:29:23Z","homeTeam":{"id":67,"name":"Newcastle United FC","shortName":"Newcastle","tla":"NEW","crest":"https://crests.football-data.org/67.png"},"awayTeam":{"id":58,"name":"Aston Villa FC","shortName":"Aston Villa","tla":"AVL","crest":"https://crests.football-data.org/58.png"},"score":{"winner":"HOME_TEAM","duration":"REGULAR","fullTime":{"home":5,"away":1},"halfTime":{"home":2,"away":1}},"odds":{"msg":"Activate Odds-Package in User-Panel to retrieve odds."},"referees":[{"id":11423,"name":"Andy Madley","type":"REFEREE","nationality":"England"}]},{"area":{"id":2072,"name":"England","code":"ENG","flag":"https://crests.football-data.org/770.svg"},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"season":{"id":1564,"startDate":"2023-08-11","endDate":"2024-05-19","currentMatchday":2,"winner":null},"id":435950,"utcDate":"2023-08-13T13:00:00Z","status":"FINISHED","matchday":1,"stage":"REGULAR_SEASON","group":null,"lastUpdated":"2023-08-14T00:46:42Z","homeTeam":{"id":402,"name":"Brentford FC","shortName":"Brentford","tla":"BRE","crest":"https://crests.football-data.org/402.png"},"awayTeam":{"id":73,"name":"Tottenham Hotspur FC","shortName":"Tottenham","tla":"TOT","crest":"https://crests.football-data.org/73.svg"},"score":{"winner":"DRAW","duration":"REGULAR","fullTime":{"home":2,"away":2},"halfTime":{"home":2,"away":2}},"odds":{"msg":"Activate Odds-Package in User-Panel to retrieve odds."},"referees":[{"id":11446,"name":"Robert Jones","type":"REFEREE","nationality":"England"}]},{"area":{"id":2072,"name":"England","code":"ENG","flag":"https://crests.football-data.org/770.svg"},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"season":{"id":1564,"startDate":"2023-08-11","endDate":"2024-05-19","currentMatchday":2,"winner":null},"id":435951,"utcDate":"2023-08-13T15:30:00Z","status":"FINISHED","matchday":1,"stage":"REGULAR_SEASON","group":null,"lastUpdated":"2023-08-14T00:46:42Z","homeTeam":{"id":61,"name":"Chelsea FC","shortName":"Chelsea","tla":"CHE","crest":"https://crests.football-data.org/61.png"},"awayTeam":{"id":64,"name":"Liverpool FC","shortName":"Liverpool","tla":"LIV","crest":"https://crests.football-data.org/64.png"},"score":{"winner":"DRAW","duration":"REGULAR","fullTime":{"home":1,"away":1},"halfTime":{"home":1,"away":1}},"odds":{"msg":"Activate Odds-Package in User-Panel to retrieve odds."},"referees":[{"id":11580,"name":"Anthony Taylor","type":"REFEREE","nationality":"England"}]},{"area":{"id":2072,"name":"England","code":"ENG","flag":"https://crests.football-data.org/770.svg"},"competition":{"id":2021,"name":"Premier League","code":"PL","type":"LEAGUE","emblem":"https://crests.football-data.org/PL.png"},"season":{"id":1564,"startDate":"2023-08-11","endDate":"2024-05-19","currentMatchday":2,"winner":null},"id":435952,"utcDate":"2023-08-14T19:00:00Z","status":"FINISHED","matchday":1,"stage":"REGULAR_SEASON","group":null,"lastUpdated":"2023-08-14T23:59:56Z","homeTeam":{"id":66,"name":"Manchester United FC","shortName":"Man United","tla":"MUN","crest":"https://crests.football-data.org/66.png"},"awayTeam":{"id":76,"name":"Wolverhampton Wanderers FC","shortName":"Wolverhampton","tla":"WOL","crest":"https://crests.football-data.org/76.svg"},"score":{"winner":"HOME_TEAM","duration":"REGULAR","fullTime":{"home":1,"away":0},"halfTime":{"home":0,"away":0}},"odds":{"msg":"Activate Odds-Package in User-Panel to retrieve odds."},"referees":[{"id":11430,"name":"Simon Hooper","type":"REFEREE","nationality":"England"}]}]}';
				/* 결과값 */
				var result = JSON.parse(test);
				//var result = JSON.parse(response);
				var htmlStr = '';
				
				console.log(result);
				var matches = result.matches;
				var startTime = '';
				for(var i=0; i<matches.length; i++) {
					startTime = new Date(matches[i].utcDate).toLocaleString("en-KR", { hour12: false }).split(' ')[1].split(':');
					startTime = startTime[0] + ':' + startTime[1];
					
					htmlStr += '<div class="col-lg-6 col-xxl-4 mb-5">';
					htmlStr += '	<div class="card bg-dark border-0 h-100">';
					htmlStr += '		<div class="text-white card-body text-center p-4 p-lg-4 pt-0" style="display:table;">';
					htmlStr += '			<span class="fs-8 fw-bold score_team_icon"><img src="'+matches[i].homeTeam.crest+'" style="width:60px;"/><br>'+matches[i].homeTeam.name+'</span>';
					if('FINISHED' == matches[i].status) {
						htmlStr += '			<span class="score_team_vs">';
						htmlStr += 					matches[i].score.fullTime.home + ' : ' + matches[i].score.fullTime.away;
						htmlStr += '				<br>';
						htmlStr += '				<span style="font-size:14px; color:dodgerblue;">End</span>';
						htmlStr += '			</span>';
					} else {
						htmlStr += '			<span class="score_team_vs">'+startTime+'</span>';
					}
					htmlStr += '			<span class="fs-8 fw-bold score_team_icon"><img src="'+matches[i].awayTeam.crest+'" style="width:60px;"/><br>'+matches[i].awayTeam.name+'</span>';
					htmlStr += '		</div>';
					htmlStr += '	</div>';
					htmlStr += '</div>';
				}
				
				$('#scheduleBody').html(htmlStr);
			}
		});
	});
		
</script>
<body>
	<header class="py-5 bg-dark">
		<div class="container px-lg-5">
			<div class="text-white">
				<div class="float-start text-center" style="width:25%;">Premier League</div>
				<div class="float-start text-center" style="width:25%;">La Liga</div>
				<div class="float-start text-center" style="width:25%;">Bundesliga</div>
				<div class="float-start text-center" style="width:25%;">Serie A</div>
				<!-- <img src="https://crests.football-data.org/PL.png" style="width:50px;"/>
				<img src="https://crests.football-data.org/PD.png" style="width:50px;"/>
				<img src="https://crests.football-data.org/BL1.png" style="width:50px;"/>
				<img src="https://crests.football-data.org/SA.png" style="width:50px;"/> -->
			</div>
		</div>
    </header>
    <section class="pt-4 bg-white">
        <div class="container px-lg-5">
            <!-- Page Features-->
            <div id="scheduleBody" class="row gx-lg-5">
			<!-- 축구 일정 영역 -->                
            </div>
        </div>
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
