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
#calendar {
 	width : 48%;
 	float : left;
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
	
	<div class="card shadow mb-4" id = "calendar">
	
	  <div class="card-header py-3">
	    <h6 class="m-0 font-weight-bold text-primary">최근 내 일정</h6>
	  </div>
	  
	  <div class="card-body">
	    <table class="table table-striped table-hover tablesorter" id="myTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                       <thead>
						<tr>
							<th scope="col">No</th>
							<th scope="col">내용</th>
							<th scope="col">시작</th>
							<th scope="col">종료</th>				
						</tr>
                       </thead>
                       <tbody>
                          <c:forEach items="${calList}" var="cal" varStatus = "v" begin="0" end = "2">
      						<tr>
      						    <td>${v.count}</td> 
         						<td>${cal.title}</td>
         						<td>${cal.start}</td>
         						<td>${cal.end}</td>     									
      						</tr>
   						</c:forEach>
                       </tbody>
                     </table>
	  </div>
	  
	</div>
	
		<div class="card shadow mb-4" id = "calendar">
	
	  <div class="card-header py-3">
	    <h6 class="m-0 font-weight-bold text-primary">일정</h6>
	  </div>
	  
	  <div class="card-body">
	   	<div id="calendar"></div>
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