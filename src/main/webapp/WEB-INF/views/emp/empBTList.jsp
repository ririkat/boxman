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
			<h6 class="m-0 font-weight-bold text-primary">출장현황</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<form id="searchFrm">
								<div class="dataTables_length" id="dataTable_length">
								<c:choose>
									<c:when test="${temp eq 'my'}">
										<input type="hidden" value="search" name="temp"/>
									</c:when>
									<c:when test="${temp eq 'all' or temp eq 'searchAll'}">
										<input type="hidden" value="searchAll" name="temp"/>
									</c:when>
								</c:choose>
								<input type="hidden" value="${loginEmp.EMPNO}" name="empNo"/>
								<input type="hidden" value="${temp}" name="temp" />
								<label>Search:
									<c:choose>
										<c:when test="${temp eq 'my' or temp eq 'all'}"> 
											<input type="text" class="datePicker pic" class="form-control" id="startDay" name="startDay" style="width:110px;">
											-
											<input type="text" class="datePicker pic" class="form-control" id="endDay" name="endDay" style="width:110px;">
										</c:when>
										<c:when test="${temp eq 'search' or temp eq 'searchAll'}"> 
											<input type="text" class="datePicker1 pic" value="${startDay}" class="form-control" name="startDay" style="width:110px;">
											-
											<input type="text" class="datePicker1 pic" value="${endDay}" class="form-control" name="endDay" style="width:110px;">
										</c:when>
									</c:choose>
								</label>
									
									<c:if test="${temp eq 'all' or temp eq 'searchAll'}">
										<select name="type" id="stuffMain"
										class="form-control form-control-sm" style="width:100px; display:inline;">
											<option value="empNo">사원번호</option>
											<option value="empName">이름</option>
											<option value="deptName">부서명</option>
										</select> 
										<input type="search" class="form-control form-control-sm" style="width:100px; display:inline;"
										placeholder="" aria-controls="dataTable" name="data">
									</c:if>
									<button onclick="fn_search();" class="btn btn-primary mr-2">
										<span class="text">검색</span>
									</button>
								</div>
							</form>
						</div>
						<c:if test="${temp eq 'my' or temp eq 'search'}"> 
							<div class="col-sm-12 col-md-6">
								<div id="dataTable_filter" class="dataTables_filter">
									<div style="float: right;">
										<!-- 출장신청 결재로 이동하기 -->
										<button type="button" onclick="location.href='${path}/emp/insertBT.do?empNo=${loginEmp.EMPNO}'" class="btn btn-primary mr-2">
				               				출장신청
				                 		</button>
									</div>
								</div>
							</div>
						</c:if>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-hover tablesorter" id="myTable"
								width="100%" cellspacing="0" role="grid"
								aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr>
										<c:if test="${temp eq 'all' or temp eq 'searchAll'}">
											<th>사원번호</th>
											<th>이름</th>
											<th>부서</th>
										</c:if>
										<th>시작일</th>
										<th>종료일</th>
										<th>출장사유</th>
										<th>승인여부</th>
										<c:choose>
											<c:when test="${temp eq 'my' or temp eq 'search'}">
												<th>출장비신청</th>
											</c:when>
										</c:choose> 
									</tr>
								</thead>
								<tbody>
									<c:forEach var="e" items="${list}">
										<tr>
											<c:if test="${temp eq 'all' or temp eq 'searchAll'}">
												<td><c:out value='${e["EMPNO"]}' /></td>
												<td><c:out value='${e["EMPNAME"]}' /></td>
												<td><c:out value='${e["DEPTNAME"]}' /></td>
											</c:if>
											<td><fmt:formatDate value='${e["BTSTART"]}' pattern="yyyy-MM-dd" /></td>
											<td><fmt:formatDate value='${e["BTEND"]}' pattern="yyyy-MM-dd" /></td>
											<td><c:out value='${e["BTREASON"] }' /></td>
											<td><c:out value="${e['BTCHECK']}"/></td>
											<jsp:useBean id="now" class="java.util.Date" />
											<fmt:formatDate value="${now}" pattern="yyyyMM" var="nowDate" />
											<fmt:formatDate value='${e["BTEND"]}' pattern="yyyyMM" var="endDate"/>
											<fmt:formatDate value="${now}" pattern="yyyyMMdd" var="nowfDate" />
											<fmt:formatDate value='${e["BTEND"]}' pattern="yyyyMMdd" var="endfDate"/>
											<c:if test="${temp eq 'my' or temp eq 'search'}">
												<c:choose>
													<c:when test="${nowDate eq endDate or nowDate-1 eq endDate}">
														<!-- 결재 종결 후 기안할 수 없음. -->
														<c:if test="${fn:trim(e['BTCHECK']) eq 'Y' and endfDate<=nowfDate 
														and (fn:trim(e['BTPYN']) eq 'N' or empty fn:trim(e['BTPYN']))}">	
															<td>
																<button type="button" class="btn btn-primary mr-2" onclick="location.href='${path}/emp/insertBTP.do?btNo=${e.BTNO}&temp=newMonthBTP&empNo=${e.EMPNO}'">
																	출장비신청
																</button>
															</td>
														</c:if>
														<c:if test="${fn:trim(e['BTCHECK']) eq 'Y' and nowfDate<endfDate}">	<!--  and fn:trim(e['BTPCHECK']) eq 'N' -->
															<td>
																출장 종료후 신청 가능합니다.
															</td>
														</c:if>
														<c:if test="${fn:trim(e['BTPYN']) eq 'Y'}">
															<td>마감</td>
														</c:if>
														<c:if test="${fn:trim(e['BTCHECK']) eq 'N'}">
															<td></td>
														</c:if>
													</c:when>
													<c:otherwise>
														<td>마감</td>
													</c:otherwise>
												</c:choose>
											</c:if>
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
		
		$('.pic').datepicker({
		    format: "yyyy-mm-dd",	//데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
		    startDate: '-10y',	//달력에서 선택 할 수 있는 가장 빠른 날짜. 이전으로는 선택 불가능 ( d : 일 m : 달 y : 년 w : 주)
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
		$("#searchFrm").attr("action","${path}/emp/selectBTList.do");
		$("#searchFrm").submit();
	}
	
	//테이블 정렬
	$(function() {
	  $("#myTable").tablesorter();
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
