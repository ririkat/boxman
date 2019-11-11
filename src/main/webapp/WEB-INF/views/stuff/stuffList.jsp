<%@ page language="java" contentType="text/html;charset=utf-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="물품 목록" name="tabTitle"/> 
   <jsp:param value="" name="pageTitle"/>
</jsp:include>
<section id="content">
	<div class="card shadow mb-4">
       <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">물품목록</h6>
       </div>
       <div class="card-body">
         <div class="table-responsive">
           <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
              <div class="row">
                 <div class="col-sm-12 col-md-6">
                 <form id = "searchFrm">
                    <div class="dataTables_length" id="dataTable_length">
                       <label>Search:
                       	    <select name = "type" id = "stuffMain" class = "form-control form-control-sm">
										<option value = "stuffName">물품 이름</option>
										<option value = "conName">거래처 이름</option>
										<option value = "scName">카테고리</option>
							</select>
                           <input type="search" class="form-control form-control-sm" placeholder="" aria-controls="dataTable" name = "data" id = "data">
                      </label>
				  		<button onclick = "searchStuff();" class="btn btn-primary mr-2">
                   		 <span class="text">검색</span>
                 		 </button>
                    </div>
                    </form>
                 </div>
                 <div class="col-sm-12 col-md-6">
                  <div id="dataTable_filter" class="dataTables_filter">
                     <div style="float:right;">
	                    <button type="button" onclick="location.href='${path}/stuff/stuffEnroll.do'" class="btn btn-primary mr-2">
						        물품 등록
						</button>
                	</div>
                  </div>
                 </div>
              </div>
              <div class="row">
                 <div class="col-sm-12">
                    <table class="table table-striped table-hover tablesorter" id="myTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                       <thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">물품이름</th>
							<th scope="col">가격</th>
							<th scope="col">수량</th>							
							<th scope="col">등록날짜</th>
							<th scope="col">거래처</th>
							<th scope="col">비고</th>
							<th scope="col"></th>
						</tr>
                       </thead>
                       <tbody>
                          <c:forEach items="${list}" var="stuff" varStatus = "v">
      						<tr>
        						<td>
         						<c:if test="${param.cPage eq null }">
         								<c:out value="${v.count }"/>
         						</c:if>
             					<c:if test="${param.cPage == 1 }">
										<c:out value="${v.count }"/>
								</c:if>			
         						<c:if test="${param.cPage > 1 }">
										<c:out value="${v.count+(10*(param.cPage-1)) }"/>
								</c:if>
								</td>
         						<td>${stuff.stuffName}</td>
         						<td>${stuff.price}</td>
         						<td>${stuff.stuffCount}</td>         						
         						<td>${stuff.enrollDate}</td>
         						<td>${stuff.conName}</td>
         						<td>${stuff.scName }</td>
         						<td>
									<button type="button" class="btn btn-success mr-2"
									onclick="location.href='${pageContext.request.contextPath }/stuff/stuffOne.do?stuffNo=${stuff.stuffNo }'">자세히</button>
								</td>
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
function searchStuff(){
	
	if($('#data').val() != "") {
		$("#searchFrm").attr("action","${path}/stuff/searchStuff.do");
		$("#searchFrm").submit();
	} else {
		alert("검색하실 내용을 입력해주세요.");
	}
}

$(function() {
    $("#myTable").tablesorter();
  });
</script>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>


