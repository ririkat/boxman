<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp">
	<jsp:param value="BoxMan" name="tabTitle" />
	<jsp:param value='${emp["EMPNAME"]}' name="pageTitle" />
</jsp:include>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<section>
	<div class="col-12 grid-margin">
		<div class="card">
			<div class="card-body">
				<div class="row">
					<div class="col-sm-12">
						<table class="table table-striped table-hover" id="dataTable"
							width="100%" cellspacing="0" role="grid"
							aria-describedby="dataTable_info" style="width: 100%;">
							<thead>
								<tr>
									<th>사원번호</th>
									<th>이름</th>
									<th>부서</th>
									<th>일자</th>
									<th>요일</th>
									<th>출근시간</th>
									<th>퇴근시간</th>
									<th>구분</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td><c:out value='${att["EMPNO"]}' /></td>
									<td><c:out value='${att["EMPNAME"]}' /></td>
									<td><c:out value='${att["DEPTNAME"]}' /></td>
									<td><fmt:formatDate value='${att["ATTENDAY"]}' pattern="yyyy-MM-dd"/></td>
									<td><c:out value='${att["DY"]}' /></td>
									<td><c:out value='${att["ATTENSTART"]}'/></td>
									<td><c:out value='${att["ATTENEND"]}'/></td>
									<td><c:out value='${att["ATTENCATE"] }' /></td>
								</tr>
							</tbody>
						</table>
						<form class="form-sample" id="attUpFrm" method="post">
							<input type="hidden" value='${att["ATTENNO"]}' name="attenNo" id="attenNo"/>
							<table class="table table-striped table-hover" id="dataTable"
							width="100%" cellspacing="0" role="grid"
							aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr>
										<th>수정출근시간</th>
										<th>수정퇴근시간</th>
										<th>구분</th>
										<th>사유</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td><input type="time" name="uaStart" id="upStart"></td>
										<td><input type="time" name="uaEnd" id="upEnd"/></td>
										<td>
											<select name="" id="selectAtten"
											class="form-control form-control-sm"
											style="width: 100px; display: inline;" required="required">
											<option value="0">구분</option>
											<option value="출근">출근</option>
											<option value="지각">지각</option>
											<option value="결근">결근</option>
											<option value="반차">반차</option>
											<option value="휴가">휴가</option>
											<option value="출장">출장</option>
										</select>
										</td>
										<td><input type="text" class="form-control" name="uaReason" required="required"/></td>
									</tr>
								</tbody>
							</table>
							<div style="margin: 0 auto; width: fit-content;">
								<input type="button" id="updateAtten" class="btn btn-success mr-2" value="수정" style="width: 150px;">
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</section>
<script>
	//수정버튼 누를때
	$(function(){
		$('#updateAtten').click(function(){
			if($('#selectAtten').val()==0) {
				alert("구분을 선택해주세요.");
				return false;
			}
			if(confirm('수정하시겠습니까?')) {
				$('#attUpFrm').attr("action","${path}/emp/updateAttenEnd.do");
				$('#attUpFrm').submit();
			} 
			console.log($('#upStart').val());
			console.log($('#upEnd').val());
		});
	});

</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />