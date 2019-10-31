<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
	<jsp:param value="Accounting" name="tabTitle"/> 
	<jsp:param value="" name="pageTitle"/>
</jsp:include>

<section>
<!-- DataTales Example -->
	<div class="card shadow mb-4">
		<div class="card-header py-3">
			<h6 class="m-0 font-weight-bold text-primary">월급 관리</h6>
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
										class="btn btn-light btn-icon-split">
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
										<th>사원번호</th>
										<th>이름</th>
										<th>직급</th>
										<th>부서</th>
										<th>퇴사 여부</th>
										<th>퇴사 날짜</th>
										<th>퇴사</th>
									</tr>
								</thead>
								
								<tbody>
									<c:forEach var="e" items="${list}">
										<tr>
											<td>
												<a href='${path }/emp/selectEmpOne.do?empNo=${e["EMPNO"]}'>
													<c:out value='${e["EMPNO"]}' />
												</a>
											</td>
											<td>
												<a href='${path }/emp/selectEmpOne.do?empNo=${e["EMPNO"]}'>
													<c:out value='${e["EMPNAME"]}' />
												</a>
											</td>
											<td>
												<c:out value='${e["JOBNAME"]}' />
											</td>
											<td>
												<c:out value='${e["DEPTNAME"]}' />
											</td>
											<td>
												<c:out value='${e["SEVCHECK"] }' />
											</td>
											<td>
												<c:out value='${e["SEVDATE"] }' />
											</td>
											<td>
												<c:if test='${fn:trim(e["SEVCHECK"]) eq "N" }' var="r">
													<button type="button" class="btn btn-success" onclick="quit('${e.EMPNO}');" data-toggle="modal" data-target="#exampleModal">퇴사 시키기</button>
												</c:if>
											</td>
										</tr>
									
								</tbody>
							</table>
						</div>
					</div>
				</div>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel"><c:out value='${e["EMPNAME"] }'/> 님이 받는 퇴직금액</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
       <input type="text" class=" col-xs-2" name="boardWriter" value="22333" readonly required>원 지급하기
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>
				</c:forEach>
<script>
	function quit(data){
		console.log(data);
	}
</script>

</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

