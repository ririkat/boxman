<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="거래처 관리" name="tabTitle"/> 
</jsp:include>

<section>

	<div class="card shadow mb-4">
       <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">거래처 목록</h6>
       </div>
       <div class="card-body">
         <div class="table-responsive">
           <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
              <div class="row">
                 <div class="col-sm-12 col-md-6">
                    <div class="dataTables_length" id="dataTable_length">
                       <label>Search:
							<input type="search" class="form-control form-control-sm" aria-controls="dataTable">
						</label>
						<a href="#" class="btn btn-light btn-icon-split">
							<span class="icon text-gray-600">
								<i class="fas fa-arrow-right"></i>
	                    	</span>
	                    	<span class="text">검색</span>
                  		</a>
                    </div>
                 </div>
                 <div class="col-sm-12 col-md-6">
                  <div id="dataTable_filter" class="dataTables_filter">
                     <div style="float:right;">
	                      <a href="${path }/connection/enrollConn.do" class="btn btn-light btn-icon-split">
		                      <span class="icon text-gray-600">
		                      	<i class="fas fa-arrow-right"></i>
		                      </span>
		                      <span class="text">거래처등록</span>
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
                           <th>거래처코드</th>
							<th>거래처명</th>
							<th>대표자명</th>
							<th>전화번호</th>
							<th>핸드폰번호</th>
							<th>검색창내용</th>
							<th>사용구분</th>
							<th>이체정보</th>
							<th>주소</th>
                         </tr>
                       </thead>
                       <tbody>
                          <c:forEach items="${list }" var="c">
								<tr>
									<td><a href='${path }/connection/modifyConn.do?conCode=${c["CONCODE"]}&conTransCk=${c["CONTRANSCK"]}'><c:out value='${c["CONCODE"] }'/></a></td>
									<td><c:out value='${c["CONNAME"] }' /></td>
									<td><c:out value='${c["CONREPNAME"] }' /></td>
									<td><c:out value='${c["CONTEL"] }' /></td>
									<td><c:out value='${c["CONPHONE"] }' /></td>
									<td><c:out value='${c["MCNAME"] }'/><c:out value='${c["CONCATEG"] }'/></td>
									<td><c:out value='${c["CONUSECK"] }' /></td>
									<td><c:out value='${c["CONTRANSCK"] }' /></td>
									<td><c:out value='${c["CONADDR"] }' /></td>
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