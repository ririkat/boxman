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
			<h6 class="m-0 font-weight-bold text-primary">사원목록</h6>
		</div>
		<div class="card-body">
			<div class="table-responsive">
				<div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
					<div class="row">
						<div class="col-sm-12 col-md-6">
							<form id="searchFrm">
								<div class="dataTables_length" id="dataTable_length">
									<label>Search: 
									<select name="type" id="stuffMain"
										class="form-control form-control-sm">
											<option value="empNo">사원번호</option>
											<option value="empName">이름</option>
											<option value="deptName">부서명</option>
											<option value="jobName">직급명</option>
									</select> 
									<input type="search" class="form-control form-control-sm"
										placeholder="" aria-controls="dataTable" name="data">
									</label>
									<button onclick="fn_search();"
										class="btn btn-primary mr-2">
										<span class="text">검색</span>
									</button>
								</div>
							</form>
						</div>
						<div class="col-sm-12 col-md-6">
							<div id="dataTable_filter" class="dataTables_filter">
								<div style="float: right;">
									<button type="button" onclick="location.href='${path}/emp/insertEmp.do'" class="btn btn-primary mr-2">
			               				사원등록
			                 		</button>
								</div>
							</div>
						</div>
					</div>
					<div class="row">
						<div class="col-sm-12">
							<table class="table table-striped table-hover" id="dataTable"
								width="100%" cellspacing="0" role="grid"
								aria-describedby="dataTable_info" style="width: 100%;">
								<thead>
									<tr>
										<th>사원번호</th>
										<th>이름</th>
										<th>직급</th>
										<th>부서</th>
										<th>전화번호</th>
										<th>이메일</th>
										<th>입사일자</th>
										<th>퇴사여부</th>
									</tr>
								</thead>
								<tfoot>
									<tr>
										<th>사원번호</th>
										<th>이름</th>
										<th>직급</th>
										<th>부서</th>
										<th>전화번호</th>
										<th>이메일</th>
										<th>입사일자</th>
										<th>퇴사여부</th>
									</tr>
								</tfoot>
								<tbody>
									<c:forEach var="e" items="${list}">
										<tr>
											<td><a
												href='${path }/emp/selectEmpOne.do?empNo=${e["EMPNO"]}'><c:out
														value='${e["EMPNO"]}' /></a></td>
											<td><a
												href='${path }/emp/selectEmpOne.do?empNo=${e["EMPNO"]}'><c:out
														value='${e["EMPNAME"]}' /></a></td>
											<td><c:out value='${e["JOBNAME"]}' /></td>
											<td><c:out value='${e["DEPTNAME"]}' /></td>
											<td><c:out value='${e["EMPPHONE"] }' /></td>
											<td><c:out value='${e["EMPEMAIL"] }' /></td>
											<td><c:out value='${e["EMPHIREDATE"]}' /></td>
											<td><c:out value='${e["EMPENTYN"]}' /></td>
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
	//검색
	function fn_search() {
		$("#searchFrm").attr("action","${path}/emp/searchEmp.do");
		$("#searchFrm").submit();
	}
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp" />
