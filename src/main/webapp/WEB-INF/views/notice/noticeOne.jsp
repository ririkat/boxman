<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value="게시판상세"/>
</jsp:include>
<section id="content">

<form id="devFrm" enctype="multipart/form-data" action="${path }/notice/insertNotice.do" method="post">
<div class="col-md-6 grid-margin stretch-card">
                <div class="card">
                  <div class="card-body">
                    <h4 class="card-title">상세페이지</h4>
                    <p class="card-description"> 각 부서의 노동 정책 및 행정업무에 대한 자료를 보실 수 있습니다. </p>
                    <form class="forms-sample">
                      <div class="form-group">
                        <label for="exampleInputName1">제목</label>
                        <input type="text" class="form-control" id="exampleInputName1" name="nName" value="${nt.NName}" readonly>
                      </div>
                     <div class="form-group">
                        <label for="exampleInputPassword4">등록일</label>
                        <input type="text" class="form-control" id="exampleInputPassword4" value="${nt.NDate}" readonly>
                      </div>                     
	                      <div class="form-group">
	                        <label for="exampleInputPassword4">담당부서</label>
	                        <input type="text" class="form-control" id="exampleInputPassword4" value="${nt.deptName}" readonly>
	                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword4">작성자</label>
                        <input type="text" class="form-control" id="exampleInputPassword4" value="" readonly>
                      </div>
                      <div class="form-group">
                        <label for="exampleInputPassword4">전화번호</label>
                        <input type="text" class="form-control" id="exampleInputPassword4" value="" readonly>
                      </div>
                      <div class="form-group">
                      	<div class=" custom-file">
                      	<label for="upFile">첨부파일</label>
		                   
									  <c:forEach items="${upNotice}" var="a">
							            <button type="button" 
							                    class="btn btn-outline-success btn-block"
							                    onclick="fileDownload('${a.upNoticeOrgName}','${a.upNoticeReName }');">
							                첨부파일${vs.count} - ${a.upNoticeOrgName }
							            </button>
							        </c:forEach>
							
		                </div>
               		  </div>
                      <div class="form-group">
                        <label for="exampleTextarea1">내용</label>
                        <textarea class="form-control" id="exampleTextarea1" name="nText" rows="2" readonly>${nt.NText}</textarea> 
                      </div>
                      <button type="submit" class="btn btn-success mr-2">수정</button>
                      <button class="btn btn-light">삭제</button>
                    </form>
                  </div>
                </div>
              </div>
	</form>
	
</section>

<script>
		function fileDownload(oName, rName)
		{
		   oName=encodeURIComponent(oName);
		   location.href="${path}/notice/filedownLoad.do?oName="+oName+"&rName="+rName;
		}
</script>
