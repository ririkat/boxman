<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="판매 관리" name="tabTitle"/> 
</jsp:include>

<style>
th {
	text-align: center;
}
</style>

<section>

	<div class="card shadow mb-4">
       <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">판매 목록</h6>
       </div>
       <div class="card-body">
         <div class="table-responsive">
           <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
              <div class="row">
                 <div class="col-sm-12 col-md-6">
                 <form id="searchFrm">
                    <div class="dataTables_length" id="dataTable_length">
                       <label>Search:
                       		<select name="type" id="searchKeyword" class="form-control form-control-sm">
								<option value="salCode">판매코드</option>
								<option value="conCode">거래처명</option>
								<option value="empNo">담당자명</option>
								<option value="salCk">판매확정여부</option>
								<option value="remitCk">입금확정여부</option>
							</select>
							<input type="search" class="form-control form-control-sm" name="data" aria-controls="dataTable">
							<input type="hidden" name="empId" value="${loginEmp['EMPID'] }">
						</label>
						<button onclick = "searchSaleInfo();" class="btn btn-light btn-icon-split">
	                   		<span class="icon text-gray-600">
	                    		<i class="fas fa-arrow-right"></i>
	                   		</span>
	                   		<span class="text">검색</span>
                 		</button>
                    </div>
                   </form>
                 </div>
                 <div class="col-sm-12 col-md-6">
                  <div id="dataTable_filter" class="dataTables_filter">
                     <div style="float:right;">
	                      <a href="${path }/sale/enrollSaleInfo.do" class="btn btn-light btn-icon-split">
		                      <span class="icon text-gray-600">
		                      	<i class="fas fa-arrow-right"></i>
		                      </span>
		                      <span class="text">판매정보 등록</span>
	                  	  </a>
	                 </div>
                  </div>
                 </div>
              </div>
              <div class="row">
                 <div class="col-sm-12">
                    <table class="table table-striped table-hover" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                       <thead>
                         <tr>
                            <th>판매코드</th>
							<th>등록일자</th>
							<th>거래처</th>
							<th>담당자</th>
							<th>거래유형</th>
							<th>판매총액</th>
							<th>판매확정</th>
							<th>판매일자</th>
							<th>입금여부</th>
							<th>입금일자</th>
                         </tr>
                       </thead>
                       <tbody>
                          <c:forEach items="${list }" var="s">
								<tr style="text-align:center;">
									<td><a href='${path }/sale/verificationSaleInfo.do?salCode=${s["SALCODE"] }'><c:out value='${s["SALCODE"] }'/></a></td>
									<td><c:out value='${s["SALENROLLDATE"] }' /></td>
									<td><c:out value='${s["CONNAME"] }' /></td>
									<td><c:out value='${s["EMPNAME"] }' /></td>
									<td><c:out value='${s["SALTRANTYPE"] }' /></td>
									<td style="text-align:right;"><c:out value='${s["SALTOTAMT"] }'/></td>
									<td><c:out value='${s["SALCK"] }'/></td>
									<td><c:out value='${s["SALDATE"] }' /></td>
									<td><c:out value='${s["REMITCK"] }' /></td>
									<td><c:out value='${s["REMITDATE"] }' /></td>
								</tr>
							</c:forEach>
                       </tbody>
                     </table>
                   </div>
                 </div>
               </div>
			</div>
		</div>
      <div style="margin:0 auto; width:fit-content;">
		${pageBar }
      </div>
	</div>

</section>

<script>
function searchSaleInfo(){
	$("#searchFrm").attr("action","${path}/sale/searchSaleInfo.do");
	$("#searchFrm").submit();
}
</script>