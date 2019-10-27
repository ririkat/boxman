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
	<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">근태현황</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<form id="searchFrm">
								<div class="dataTables_length" id="dataTable_length">
									<label>Search: 
									<input type="text" class="datePicker" class="form-control" id="startDay" name="startDay" style="width:110px;">
									-
									<input type="text" class="datePicker" class="form-control" id="endDay" name="endDay" style="width:110px;">
									</label>
									<button onclick="fn_search();" class="btn btn-light btn-icon-split">
										<span class="icon text-gray-600"> <i
											class="fas fa-arrow-right"></i>
										</span> <span class="text">검색</span>
									</button>
								</div>
							</form>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-hover" id="dataTable"
								width="100%" cellspacing="0" role="grid"
								aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr>
										<th>일자</th>
										<th>요일</th>
										<th>출근시간</th>
										<th>퇴근시간</th>
										<th>구분</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="e" items="${list}">
										<tr>
											<td><c:out value='${e["DAY"]}' /></td>
											<td><c:out value='${e["DY"]}' /></td>
											<td><c:out value='${e["STARTTIME"] }' /></td>
											<td><c:out value='${e["ENDTIME"]}' /></td>
											<td><c:out value='${e["ATTENCATE"] }' /></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
						</div>
					</div>
				</div>
				${pageBar }
</section>

<script>
	$(function(){
		var d = new Date();
		var day = d.getFullYear()+"-"+(d.getMonth()+1)+"-"+d.getDate();
		$('#startDay').val(day);
		$('#endDay').val(day);
		
		$('.datePicker').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '-1y',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+0d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
		    autoclose : true,	//사용자가 날짜를 클릭하면 자동 캘린더가 닫히는 옵션
		    calendarWeeks : false, //캘린더 옆에 몇 주차인지 보여주는 옵션 기본값 false 보여주려면 true
		    clearBtn : false, //날짜 선택한 값 초기화 해주는 버튼 보여주는 옵션 기본값 false 보여주려면 true
		    datesDisabled : ['2019-06-24','2019-06-26'],//선택 불가능한 일 설정 하는 배열 위에 있는 format 과 형식이 같아야함.
		    daysOfWeekDisabled : [0,6],	//선택 불가능한 요일 설정 0 : 일요일 ~ 6 : 토요일
		    daysOfWeekHighlighted : [], //강조 되어야 하는 요일 설정
		    disableTouchKeyboard : false,	//모바일에서 플러그인 작동 여부 기본값 false 가 작동 true가 작동 안함.
		    immediateUpdates: false,	//사용자가 보는 화면으로 바로바로 날짜를 변경할지 여부 기본값 :false 
		    multidate : false, //여러 날짜 선택할 수 있게 하는 옵션 기본값 :false 
		    multidateSeparator :",", //여러 날짜를 선택했을 때 사이에 나타나는 글짜 2019-05-01,2019-06-01
		    templates : {
		        leftArrow: '&laquo;',
		        rightArrow: '&raquo;'
		    }, //다음달 이전달로 넘어가는 화살표 모양 커스텀 마이징 
		    showWeekDays : true ,// 위에 요일 보여주는 옵션 기본값 : true
		    title: "테스트",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		});//datepicker end
		
	});
	//검색
	function fn_search() {
		$("#searchFrm").attr("action","${path}/emp/searchEmp.do");
		$("#searchFrm").submit();
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
