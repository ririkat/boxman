<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="판매 관리" name="tabTitle"/> 
</jsp:include>

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
								<option value="#">판매코드</option>
							</select>
							<input type="search" class="form-control form-control-sm" name="data" aria-controls="dataTable">
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
                          <c:forEach items="${list }" var="p">
								<tr>
									<td><a href='#'><c:out value='${p["SALCODE"] }'/></a></td>
									<td><c:out value='${p["SALENROLLDATE"] }' /></td>
									<td><c:out value='${p["CONNAME"] }' /></td>
									<td><c:out value='${p["EMPNAME"] }' /></td>
									<td><c:out value='${p["SALTRANTYPE"] }' /></td>
									<td><c:out value='${p["SALTOTAMT"] }'/></td>
									<td><c:out value='${p["SALCK"] }'/></td>
									<td><c:out value='${p["SALDATE"] }' /></td>
									<td><c:out value='${p["REMITCK"] }' /></td>
									<td><c:out value='${p["REMITDATE"] }' /></td>
								</tr>
							</c:forEach>
                       </tbody>
                     </table>
                   </div>
                 </div>
               </div>
			</div>
		</div>
       ${pageBar }
	</div>

</section>

<script>
function searchSaleInfo(){
	$("#searchFrm").attr("action","${path}/sale/searchSaleInfo.do");
	$("#searchFrm").submit();
}

function searchConnection(){
	$("#searchFrm").attr("action","${path}/stuff/searchConnection.do");
	$("#searchFrm").submit();
}
</script>