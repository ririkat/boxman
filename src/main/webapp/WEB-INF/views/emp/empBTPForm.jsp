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
			<h6 class="m-0 font-weight-bold text-primary">출장비용신청</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12">
							<form name="btFrm" id="btFrm" method="post">
								<input type="hidden" name="empNo" value='${e["EMPNO"]}'/>
								<input type="hidden" name="btNo" value='${e["BTNO"]}'/>
								<table class="table table-striped table-hover" id="dataTable"
									width="100%" cellspacing="0" role="grid"
									aria-describedby="dataTable_info" style="width: 100%;">
									<thead>
										<tr>
											<th>출장번호</th>
											<th>사원번호</th>
											<th>시작일</th>
											<th>종료일</th>
											<th>숙박비</th>
											<th>교통(유류)비</th>
											<th>접대비</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td><c:out value='${e["BTNO"]}' /></td>
											<td><c:out value='${e["EMPNO"]}' /></td>
											<td><fmt:formatDate value='${e["BTSTART"]}' pattern="yyyy-MM-dd"/></td>
											<td><fmt:formatDate value='${e["BTEND"]}' pattern="yyyy-MM-dd"/></td>
											<td><input type="number" class="form-control" id="btpRoom" name="btpRoom" style="width:110px;" value="0"></td>
											<td><input type="number" class="form-control" id="btpRoom" name="btpTransportation" style="width:110px;" value="0"></td>
											<td><input type="number" class="form-control" id="btpRoom" name="btpEntertain" style="width:110px;" value="0"></td>
										</tr>
									</tbody>
								</table>
								<div style="margin:0 auto; width:fit-content;">
									<input type="button" class="btn btn-success mr-2" value="기안하기" onclick="return validate();" style="width:150px;">
								</div>
							</form>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
						<jsp:useBean id="now" class="java.util.Date" />
						<fmt:formatDate value="${now}" pattern="MM" var="nowDate" />
							<h3><c:out value="nowDate"/> 달 신청내역</h3>
								<input type="hidden" name="empNo" value='${e["EMPNO"]}' id="empNo"/>
								<input type="hidden" name="btNo" value='${e["BTNO"]}'/>								
								<table class="table table-striped table-hover tablesorter" id="myTable"
									width="100%" cellspacing="0" role="grid"
									aria-describedby="dataTable_info" style="width: 100%;">
									<thead>
										<tr>
											<th>출장번호</th>
											<th>사원번호</th>
											<th>시작일</th>
											<th>종료일</th>
											<th>숙박비</th>
											<th>교통(유류)비</th>
											<th>접대비</th>
											<th>승인여부</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="el" items="${list}">
											<tr>
												<td><c:out value='${el["BTNO"]}' /></td>
												<td><c:out value='${el["EMPNO"]}' /></td>
												<td><fmt:formatDate value='${el["BTSTART"]}' pattern="yyyy-MM-dd"/></td>
												<td><fmt:formatDate value='${el["BTEND"]}' pattern="yyyy-MM-dd"/></td>
												<td><fmt:formatNumber value='${el["BTPROOM"] }' pattern="###,###,###"/></td>
												<td><fmt:formatNumber value='${el["BTPTRANSPORTATION"] }' pattern="###,###,###"/></td>
												<td><fmt:formatNumber value='${el["BTPENTERTAIN"] }' pattern="###,###,###"/></td>
												<td><c:out value="${el['BTPCHECK'] }"/></td>
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
	//신청
	function validate() {
		$('#btFrm').attr("action","${path}/emp/insertBTPEnd.do");
		$('#btFrm').submit();
	}
	
	//테이블 정렬
	$(function() {
	  $("#myTable").tablesorter();
	});
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
