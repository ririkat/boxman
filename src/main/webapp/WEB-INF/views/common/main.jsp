<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
	<jsp:param value="BXMN" name="tabTitle"/> 
	<jsp:param value="대시보드" name="pageTitle"/>
</jsp:include>
<style>
.notice{
	width : 48%;
	margin : 15px;
}

</style>

<section>

	<!-- 내 메모 -->
	<div class="card shadow mb-4">
	
	  <div class="card-header py-3">
	    <h6 class="m-0 font-weight-bold text-primary">내 메모</h6>
	  </div>
	  
	  <div class="card-body">
	    <textarea class="form-control" id="note" rows="3"><c:out value="${cookie.note.value}"></c:out></textarea>
	  </div>
	  
	</div>
	
	<div class="card shadow mb-4" style="width: 50%;" id="notice">
	  <div class="card-header py-3">
	    <h6 class="m-0 font-weight-bold text-primary">공지사항</h6>
	  </div>
	  <div class="card-body">
	<table class="table table-striped table-hover" id="dataTable" width="50%" cellspacing="0" role="grid" aria-describedby="dataTable_info">
                       <thead>
                         <tr>
                        	<th>번호</th>
							<th>제목</th>
                         </tr>
                       </thead>
                       <tbody>
	 	<c:forEach items="${noticeList }" var ="list2" varStatus="v" begin="0" end="5">
                  <tr>
					<td style="content: '\F4CE'; color: #ffaf00;">
	                           <c:if test="${param.cPage eq null }">
	                                 <c:out value="${v.count }"/><code style="content: '\F4CE'; color: #ffaf00;"> *필독*</code>
	                           </c:if>
	                            <c:if test="${param.cPage == 1 }">
	                              <c:out value="${v.count }"/><code style="content: '\F4CE'; color: #ffaf00;"> *필독*</code>
		                        </c:if>
		                           <c:if test="${param.cPage > 1 }">
		                              <c:out value="${v.count+(5*(param.cPage-1)) }"/><code style="content: '\F4CE'; color: #ffaf00;"> *필독*</code>
		                        </c:if>
	                        </td>
					<td><a href='${path}/notice/selectNoticeOne.do?nName=${list2["NNAME"]}&nReadCount=${list2["NNO"]}&nNo=${list2["NNO"]}'>${list2["NNAME"] }</a></td>
				  </tr>
         </c:forEach>
	  </tbody>
	  </table>
	  </div>
	</div>
	
	<script>
		$(function(){
			$('textarea#note').keyup(function(){
				var note = $('textarea#note').val();
				note=note.replace(/\s/g,"_");
				 console.log(note);
				$.ajax({
					url: "${path}/note/saveCache.do",
					data: {"note": note},
					type:"post"
				});
			})
		})
		$(document).ready(function()
			{
			    $(window).bind("beforeunload", function() { 
			    	var note = $('textarea#note').val();
					note=note.replace(/\s/g,"_");
					console.log(note);
					$.ajax({
						url: "${path}/note/saveNote.do?empNo=${loginEmp.EMPNO}",
						data: {"note": note},
						type:"post"
					});
			    });
			});
	</script>
	
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>