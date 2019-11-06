<%@ page language="java" contentType="text/html;charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param name="pageTitle" value="" />
</jsp:include>
<style>
div#demo-container {
	width: 40%;
	padding: 15px;
	margin: 0 auto;
	border: 1px solid lightgray;
	border-radius: 10px;
}
</style>
<section id="content">
	<form id="calendar1" method="post">
		<div class="col-md-6 grid-margin stretch-card">
			<div class="card">
				<div class="card-body">
					<h4 class="card-title"></h4>
					<p class="card-description">스케줄 작성</p>
					<form class="forms-sample">
						<input type="hidden" name="empNo" value="${loginEmp['EMPNO'] }" />
						<div class="form-group">
							<label for="exampleInputPassword4">작성자</label> <input type="text"
								class="form-control" id="exampleInputPassword4"
								placeholder="${loginEmp['EMPNAME'] }" disabled>
						</div>
						<div class="form-group">
							<label for="exampleInputName1">제목</label> <input type="text"
								class="form-control" id="exampleInputName1" name="schTitle">
						</div>
						<div class="form-group" >
							<label>스케줄 접근 범위</label>
							<div class="col-sm-4" style="padding:20px;">
								<div class="form-radio">
									<label class="form-check-label"> <input type="radio"
										class="form-check-input" name="schLevel" id="schCategory1"
										value="개인" checked=""> 개인 <i class="input-helper"></i>
									</label>
								</div>

								<div class="form-radio" style="display:inline-block;">
									<label class="form-check-label"> <input type="radio"
										class="form-check-input" name="schLevel" id="schCategory2"
										value="부서"> 부서 <i class="input-helper"></i>
									</label>
								</div>

								<div class="form-radio">
									<label class="form-check-label"> <input type="radio"
										class="form-check-input" name="schLevel" id="schCategory2"
										value="회사"> 회사 <i class="input-helper"></i>
									</label>
								</div>
							</div>
						</div>
						<div class="form-group">
							<label class="col-sm-2 col-form-labe">이벤트 날짜</label>
							<input type="date" class="form-control" name="schEventDate">
						</div>
						<div class="form-group">
							<label for="exampleTextarea1">내용</label>
							<textarea class="form-control" id="exampleTextarea1"
								name="schContent" rows="10"></textarea>
						</div>
						<div class="form-group row">
							<label class="col-sm-2 col-form-labe">스케줄 유형</label>
						</div>
						<div class="col-sm-10">
							<select name="schCateNo" id="schCateNo" class="form-control"
								required="required">
								<option value="0">스케줄 유형선택</option>
								<c:forEach var="sch" items="${list }">
									<option value="${sch['SCHCATENAME'] }">${sch['SCHCATENAME'] }</option>
								</c:forEach>
							</select>
						</div>
						<br><br>
						<button type="button" onclick="insertCalendar();"
							class="btn btn-success mr-2">등록</button>
						<button class="btn btn-light">취소</button>
					</form>
				</div>
			</div>
		</div>
	</form>
</section>

<script>
	//등록 버튼 클릭시 리스트화면으로
	function insertCalendar(){
		$("#calendar1").attr("action","${path }/calendar/insertCalendarEnd.do");
		$("#calendar1").submit();
	}
	
</script>