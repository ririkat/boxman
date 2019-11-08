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
			<h6 class="m-0 font-weight-bold text-primary">휴가신청</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12">
							<form name="doFrm" id="doFrm" method="post">
								<input type="hidden" name="empNo" value='${e["EMPNO"]}'/>
								<table class="table table-striped table-hover" id="dataTable"
									width="100%" cellspacing="0" role="grid"
									aria-describedby="dataTable_info" style="width: 100%;">
									<thead>
										<tr>
											<th>사원번호</th>
											<th>이름</th>
											<th>부서</th>
											<th>시작일</th>
											<th>종료일</th>
											<th>사용일수</th>
											<th>구분</th>
											<th>남은연차일수</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><c:out value='${e["EMPNO"]}' /></td>
											<td><c:out value='${e["EMPNAME"]}' /></td>
											<td><c:out value='${e["DEPTNAME"]}' /></td>
											<td><input type="text" class="datePicker pic" class="form-control" id="startDay" name="doStart" style="width:110px;" required></td>
											<td><input type="text" class="datePicker pic" class="form-control" id="endDay" name="doEnd" style="width:110px;" required></td>
											<td><input type="number" class="form-control" id="doDays" name="doDays" step="0.5" style="width:100px;" required/></td>
											<td>
												<select name="docName" id="dayOffSelect"
												class="form-control form-control-sm" style="width:100px; display:inline;" required>
													<option value="연차">연차</option>
													<option value="반차">반차(오전)</option>
													<option value="반차">반차(오후)</option>
													<option value="병가">병가</option>
													<option value="기타">기타</option>
												</select> 
											</td>
											<td id="doRemainingDays"><c:out value='${e["DOREMAININGDAYS"]}'/></td>
										</tr>
									</tbody>
								</table>
								<div style="margin:0 auto; width:fit-content;">
									<input type="button" class="btn btn-success mr-2" value="기안하기" onclick="return validate();" style="width:150px;">
								</div>
							</form>
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
		
		$('.pic').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '-0d',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
		    endDate: '+40d',	//달력에서 선택 할 수 있는 가장 느린 날짜. 이후로 선택 불가 ( d : 일 m : 달 y : 년 w : 주)
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
		    title: "Calendar",	//캘린더 상단에 보여주는 타이틀
		    todayHighlight : true ,	//오늘 날짜에 하이라이팅 기능 기본값 :false 
		    toggleActive : true,	//이미 선택된 날짜 선택하면 기본값 : false인경우 그대로 유지 true인 경우 날짜 삭제
		    weekStart : 0 ,//달력 시작 요일 선택하는 것 기본값은 0인 일요일 
		    language : "ko"	//달력의 언어 선택, 그에 맞는 js로 교체해줘야한다.
		});//datepicker end
		
		$('.pic').on("change",function(){
			var n = $('#startDay').datepicker('getDate');
			var s = $('#endDay').datepicker('getDate');
			var days = (s-n)/1000/60/60/24;
			$('#doDays').val(days);
		});
		
	});
	//기안하기
	function validate() {
		if($('#doRemainingDays').val()<$('#doDays').val()) {
			alert("남은 연차 일수보다 많이 사용할 수 없습니다.");
			return false;
		} else {
			$('#doFrm').attr("action","${path}/emp/insertDayOffEnd.do");
			$('#doFrm').submit();
		}
	}
	
	
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
