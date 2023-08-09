<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="/WEB-INF/views/layout/header.jsp" %>
<!DOCTYPE html>
<html>
<script>
	$(function() {
		var param = {};
		
		$.ajax({
			type: 'post',
			dataType: 'text',
			url: '${contextPath}/todayMatches.do',
			data: {},
			success: function(response) {
				/* 결과값 */
				var result = JSON.parse(response);
				var htmlStr = '';
				
				console.log(result);
				// competitions
				var competition = result.competition;
				htmlStr += '<img src="'+competition.emblem+'" />';
				htmlStr += '<span>'+competition.name+'<span/>';
				$('body').html(htmlStr);
			}
		});
	});
		
</script>
<body>

</body>
</html>