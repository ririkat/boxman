<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>
<section id="content">
<div class="card shadow mb-4">
       <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">게시판</h6>
       </div>
       <div class="card-body">
         <div class="table-responsive">
           <div id="dataTable_wrapper" class="dataTables_wrapper dt-bootstrap4">
              <div class="row">
                 <div class="col-sm-12 col-md-6">
                 <form id="searchFrm">
                    <div class="dataTables_length" id="dataTable_length">
                       <label>Search:
                           <input type="text" name="data" class="form-control form-control-sm" placeholder="제목으로 검색" aria-controls="dataTable">
                      </label>
                      <button onclick = "searchNotice();" class="btn btn-primary mr-2">
                          <span class="text">검색</span>
                        </button>
                    </div>
                 </form>
                 </div>
                 <div class="col-sm-12 col-md-6">
                  <div id="dataTable_filter" class="dataTables_filter">
                     <div style="float:right;">
                    	<button type="button" onclick="location.href='${path}/notice/notice.do'" class="btn btn-primary mr-2">
					        게시판등록
					    </button>
                 </div>
                  </div>
                 </div>

              </div>
              <div class="row">
                 <div class="col-sm-12">
                    <table class="table table-striped table-hover" id="dataTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                       <thead>
                         <tr>
                        	<th>번호</th>
							<th>제목</th>
							<th>작성자</th>
							<th>첨부파일</th>
							<th>등록일</th>
							<th>조회수</th>
                         </tr>
                       </thead>
                       <tbody>
           			<c:forEach items="${list2 }" var ="list2" varStatus="v">
                       	 <tr>
							<td style="content: '\F4CE'; color: #ffaf00;">${v.count}<code style="content: '\F4CE'; color: #ffaf00;"> *필독*</code></td>
							<td><a href='${path}/notice/selectNoticeOne.do?nName=${list2["NNAME"]}&nReadCount=${list2["NNO"]}&nNo=${list2["NNO"]}'>${list2["NNAME"] }</a></td>
							<td>${list2['EMPNAME'] }</td>
							<c:choose>
								<c:when test="${list2['UPNOTICECOUNT'] > '0' }">
									<td><img src="${path}/resources/b4/img/btn_disk.gif" alt="첨부파일 있음"></td>
								</c:when>
								<c:when test="${list2['UPNOTICECOUNT'] == '0' }">
									<td></td>
								</c:when>
							</c:choose>
							<td>${list2['NDATE'] }</td>
							<td>${list2['NREADCOUNT'] }</td>
						 </tr>
                    </c:forEach>
                 		<c:forEach items="${list}" var="notice" varStatus="v">
							<c:choose>
							    <c:when test="${notice['NCHECK'] eq '필수아님' && notice['UPNOTICECOUNT']>0}">	
							    <tr>
									<td>
			                           <c:if test="${param.cPage eq null }">
			                                 <c:out value="${v.count }"/>
			                           </c:if>
			                            <c:if test="${param.cPage == 1 }">
			                              <c:out value="${v.count }"/>
				                        </c:if>
				                           <c:if test="${param.cPage > 1 }">
				                              <c:out value="${v.count+(5*(param.cPage-1)) }"/>
				                        </c:if>
			                        </td>
									<td><a href='${path}/notice/selectNoticeOne.do?nName=${notice["NNAME"]}&nReadCount=${notice["NNO"]}&nNo=${notice["NNO"]}'><c:out value='${notice["NNAME"]}'/></a></td>
									<td>${notice['EMPNAME'] }</td>							 
									<td><img src="${path}/resources/b4/img/btn_disk.gif" alt="첨부파일 있음"></td>									
									<td><c:out value='${notice["NDATE"]}'/></td>
									<td><c:out value='${notice["NREADCOUNT"]}'/></td>
								</tr>
							    </c:when>
							    <c:when test="${notice['NCHECK'] eq '필수아님' && notice['UPNOTICECOUNT']==0}">
							    <tr>
									<td>
			                           <c:if test="${param.cPage eq null }">
			                                 <c:out value="${v.count }"/>
			                           </c:if>
			                            <c:if test="${param.cPage == 1 }">
			                              <c:out value="${v.count }"/>
				                        </c:if>
				                           <c:if test="${param.cPage > 1 }">
				                              <c:out value="${v.count+(5*(param.cPage-1)) }"/>
				                        </c:if>
			                        </td>
									<td><a href='${path}/notice/selectNoticeOne.do?nName=${notice["NNAME"]}&nReadCount=${notice["NNO"]}&nNo=${notice["NNO"]}'><c:out value='${notice["NNAME"]}'/></a></td>
									<td>${notice['EMPNAME'] }</td>							 
									<td></td>
									<td><c:out value='${notice["NDATE"]}'/></td>
									<td><c:out value='${notice["NREADCOUNT"]}'/></td>
								</tr>
							    </c:when>
							</c:choose> 
						</c:forEach>        
                       </tbody>
                     </table>
                   </div>
                 </div>      
               </div>

${pageBar }
</section>

<script>
	function searchNotice(){
	   $("#searchFrm").attr("action","${path}/notice/searchNotice.do");
	   $("#searchFrm").submit();
	}
</script>

