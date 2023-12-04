<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>

<script>
	$(function() {
		
		// 초기화
		init();
		
		/* 날짜 선택 이벤트 */
		$('.date-num').on('click',function() {
			$('#today').val($(this).attr('data-dt'));
			
			setDateList();
			searchMatches();
		});
		
		/* 날짜 화살표 선택 이벤트 */
		$('.changeDate').on('click',function() {
			if('dateGo' == $(this).attr('id')) {
				$('#today').val($('.date-num')[3].getAttribute('data-dt'));
			} else {
				$('#today').val($('.date-num')[1].getAttribute('data-dt'));
			}
			
			setDateList();
			searchMatches();
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
	// 날짜 세팅
	$('#today').val(toDateStringFormat(new Date()));
	// PL 세팅
	$('#leagueId').val('${leagueId}');

	
	setDateList();
	searchMatches();
}

/* 일정 검색 */
function searchMatches() {
	
	var param = {
		'leagueId':$('#leagueId').val(),
		'today':$('#today').val()
	};
	
	$.ajax({
		type: 'post',
		dataType: 'text',
		async: false,
		url: '${contextPath}/ftb/todayMatches.do',
		data: param,
		success: function(response) {
			/* 결과값 */
			var result = JSON.parse(response);
			var htmlStr = '';
			
			console.log(result);
			var matches = result.matches;
			
			if(matches.length > 0) {
				var startTime = '';
				for(var i=0; i<matches.length; i++) {
					startTime = new Date(matches[i].utcDate).toLocaleString("en-KR", { hour12: false }).split(' ')[1].split(':');
					startTime = startTime[0] + ':' + startTime[1];
					
					htmlStr += '<div class="col-lg-6 col-xxl-4 mb-5">';
					htmlStr += '	<div class="card bg-dark border-0 h-100">';
					htmlStr += '		<div class="text-white card-body text-center p-4 p-lg-4 pt-0" style="display:table;">';
					htmlStr += '			<span class="fs-8 fw-bold score_team_icon"><img src="'+matches[i].homeTeam.crest+'" style="width:60px;"/><br>'+matches[i].homeTeam.name+'</span>';
					// 경기 끝
					if('FINISHED' == matches[i].status) {
						htmlStr += '			<span class="score_team_vs">';
						htmlStr += 					matches[i].score.fullTime.home + ' : ' + matches[i].score.fullTime.away;
						htmlStr += '				<br>';
						htmlStr += '				<span style="font-size:14px; color:dodgerblue;">End</span>';
						htmlStr += '			</span>';
					} 
					// 경기 진행중
					else if('LIVE' == matches[i].status || 'IN_PLAY' == matches[i].status) {
						htmlStr += '			<span class="score_team_vs">';
						htmlStr += 					matches[i].score.fullTime.home + ' : ' + matches[i].score.fullTime.away;
						htmlStr += '				<br>';
						htmlStr += '				<span style="font-size:14px; color:red;">LIVE</span>';
						htmlStr += '			</span>';
					}
					// 경기 예정
					else {
						htmlStr += '			<span class="score_team_vs">'+startTime;
						htmlStr += '				<br>';
						htmlStr += '				<span style="font-size:13px;">Scheduled</span>';
						htmlStr += '			</span>';
					}
					htmlStr += '			<span class="fs-8 fw-bold score_team_icon"><img src="'+matches[i].awayTeam.crest+'" style="width:60px;"/><br>'+matches[i].awayTeam.name+'</span>';
					htmlStr += '		</div>';
					htmlStr += '	</div>';
					htmlStr += '</div>';
				}
			} else {
				htmlStr += '<p class="schedule-no-text">There is no game schedule</p>';
			}
			
			
			$('#scheduleBody').html(htmlStr);
		}
	});
	$('#loadingBar').hide();
}

/* 삳단 날짜 리스트 */
function setDateList() {
	var today = toDateFormat($('#today').val());
	var paramDate = null;
	// 기준 날짜 +-2일 보여주기
	for(var i=-2; i<3; i++) {
		paramDate = new Date(today);
		paramDate.setDate(today.getDate() + i);
		// 화면에 보여줄 값
		$('.date-area').children()[i+3].innerText = paramDate.getMonth() + 1 + "/" + paramDate.getDate();
		// 속성값
		$('.date-num')[i+2].setAttribute('data-dt', toDateStringFormat(paramDate));
	}
}


</script>
<body>
	<input type="hidden" id="today" name="today" value="" />
	
    <section class="bg-white" style="text-align:center;">
    	<div class="container py-4 px-lg-5">
			<div class="date-area text-black">
				<span class="changeDate" id="dateBack">◀</span>
				<span class="date-num" data-dt></span>
				<span class="date-num"></span>
				<span id="date" class="date-num fw-bold"></span>
				<span class="date-num"></span>
				<span class="date-num"></span>
				<span class="changeDate" id="dateGo">▶</span>
				<!-- https://crests.football-data.org/ PL PD BL1 SA -->
			</div>
		</div>
        <div class="container px-lg-5 schedule-body">
            <!-- Page Features-->
            <div id="scheduleBody" class="row gx-lg-5">
			<!-- 축구 일정 영역 -->                
            </div>
        </div>
        
        <img id="loadingBar" src="${contextPath}/resources/images/loading.gif" style="width:40px; margin-top: -690px;">
    </section>
	<%@ include file="/WEB-INF/views/layout/footer.jsp" %>
