<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="서브카테고리 관리" name="tabTitle"/> 
   <jsp:param value="" name="pageTitle"/>
</jsp:include>

<section id="content">
	<div class="card shadow mb-4">
       <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">서브카테고리 목록</h6>
       </div>
       <div class="card-body">
         <div class="table-responsive">
           <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
              <div class="row">
                 <div class="col-sm-12 col-md-6">
                    <div class="dataTables_length" id="dataTable_length">
                    </div>
                 </div>
                 <div class="col-sm-12 col-md-6">
                  <div id="dataTable_filter" class="dataTables_filter">

                  </div>
                 </div>
              </div>
              <div class="row">
              <form id = "enrollFrm">
				<table class="table">
							<tr>
								<th scope="col" colspan="2">서브 카테고리 추가</th>
								<th scope="col" colspan="2"></th>
							</tr>
      						<tr>
      						<td>
      						      	<select name = "stuffMain" id = "stuffMain" class = "form-control">
										<option value = "0">메인 카테고리 선택</option>
										<c:forEach var = "mc" items = "${list }">
										<option value = "${mc.mcName }">${mc.mcName }</option>
										</c:forEach>
									</select>
      						</td>
      						<td>
      							<input type = "text" class = "form-control" id = "scName" name = "scName" />
      							<div id="subcategoryNameCheck" class="rg-checkMsg card-title"></div>
      						</td>
         					<td>
				  		<button type = "button" onclick = "maincategoryEnroll();" class="btn btn-primary mr-2" id = "btn">
                   		 <span class="text">추가하기</span>
                 		 </button>
								</td>
      						</tr>
						</table>
				</form>
                 <div class="col-sm-12">
                    <table class="table table-striped table-hover" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                       <thead>
						<tr>
							<th scope="col">번호</th>
							<th scope="col">서브 카테고리</th>
							<th scope="col">비고</th>
							<th scope="col"></th>
						</tr>
                       </thead>
                       <tbody>
                          <c:forEach items="${list2}" var="stuffSubcategory" varStatus = "v">
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
         						<td>${stuffSubcategory.scName}</td>
         						<td>${stuffSubcategory.mcName}</td>
         						<td>
									<button type="button" class="btn btn-success mr-2"
									onclick="location.href='${pageContext.request.contextPath }/category/subcategoryDelete.do?scName=${stuffSubcategory.scName}'">삭제</button>
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
function maincategoryEnroll(){
	
	if($('#stuffMain').val() != "0" && $('#scName').val() != "") {
		$("#enrollFrm").attr("action","${path}/category/subcategoryEnrollEnd.do");
		$("#enrollFrm").submit();
	} else if($('#stuffMain').val() == "0"){
		alert("메인 카테고리를 선택해주세요.");
	} else if($('#scName').val() == ""){
		alert("등록하실 서브카테고리의 이름을 입력해주세요.");
	} else {
		alert("입력하신 내용을 확인해주세요.");		
	}
}

//서브 카테고리 이름 중복검사
$(function(){
 	var nameCheck = $('#scName');
	$('#scName').keyup(function(){
		var scName = $('#scName').val();
		$.ajax({
			url:"<%=request.getContextPath()%>/category/subcategoryNameDupliCheck.do?scName="+ scName,
			type : "get",
			dataType : "html",
			success : function(result) {
				if (result > 0) {
					$(subcategoryNameCheck).text("존재하는 카테고리 입니다.");
					$(subcategoryNameCheck).css({
						"color" : "red",
						"font-size" : "15px"
					});
					$(subcategoryNameCheck).prop("disabled",true);
					$('#btn').attr('disabled', true);
				} else {
					$(subcategoryNameCheck).text("");
					$(subcategoryNameCheck).prop("disabled",false);
					$('#btn').attr('disabled', false);
					} 
				
				},
				error : function(request, status, error) {
					alert("code = " + request.status
							+ " message = "
							+ request.responseText
							+ " error = " + error);
				}
			});
		});
	});

</script>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>