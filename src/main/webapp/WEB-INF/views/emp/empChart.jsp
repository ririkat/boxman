<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />

<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="BOXMAN" name="tabTitle" />
	<jsp:param value="" name="pageTitle" />
</jsp:include>

<section>
	<div class="col-lg-6 grid-margin stretch-card" style="max-width: 100%">
		<div class="card">
			<div class="p-4 border-bottom bg-light">
				<h4 class="card-title mb-0">사원수통계</h4>
			</div>
			<div class="card-body">
				<div id="chart" style="height: 250px;"></div>
			</div>
		</div>
		<br/>
		<div class="card">
			<div class="p-4 border-bottom bg-light">
				<h4 class="card-title mb-0">입/퇴사 통계</h4>
			</div>
			<div class="card-body">
				<div id="chart1" style="height: 250px;"></div>
			</div>
		</div>
	</div>
</section>
<script>
$(document).ready(function(){
	
	var myJSON = [];
	var myJSON2 = [];
	
	$.ajax({
		type: 'get',
		url: '${path}/emp/empChartJson.do',
		success: function(data){
			 $.each(data, function (i, item) {
			        var jsonArray = { year: item.EYEAR, value: item.ECOUNT };
			        var temp = jsonArray;
			        myJSON.push(temp);
			});
			 
			Morris.Line({
		        element: 'chart',
		        xLabelMargin: 10,
		        xLabelAngle: 60, 
		        parseTime: false,
		        data: myJSON,
		        xkey: 'year',
		        ykeys: ['value'],
		        labels: ['사원수'],
		        lineColors: ['#4e73df'],
		        pointFillColors: ['#ffffff'],
		        pointStrokeColors: ['black'],
		    });
		}
	});
	
	/* 입/퇴사통계 */
	$.ajax({
		type: 'get',
		url: '${path}/emp/empChartJson2.do',
		success: function(data){
			 $.each(data, function (i, item) {
			 		var jsonArray = { year: item.EYEAR, a: item.NEWEMP, b: item.ENDEMP };
			        var temp = jsonArray;
			        myJSON2.push(temp);
			});
			 
			Morris.Line({
		        element: 'chart1',
		        xLabelMargin: 10,
		        xLabelAngle: 60, 
		        parseTime: false,
		        data: myJSON2,
		        xkey: 'year',
		        ykeys: ['a','b'],
		        labels: ['신입사원수','퇴사자수'],
		        lineColors: ['#4e73df','darkred'],
		        pointFillColors: ['#ffffff'],
		        pointStrokeColors: ['black'],
		    });
		}
	});
   
  
});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />