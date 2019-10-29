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
	</script>
	
</section>


<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

