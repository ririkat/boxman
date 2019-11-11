<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="BXMN" name="tabTitle"/> 
</jsp:include>
<style>
#calendar {
    width : 48%;
    float : left;
    margin : 15px;
    height : 380px;
}

#notice {
    width : 48%;
    float : left;
    margin : 15px;
   height: 380px;
}

#memo {
   width : 48%;
    float : left;
    margin : 15px;
   height: 380px;
}

#approval {
   width : 48%;
    float : left;
    margin : 15px;
   height: 380px;
}
</style>

<section>

   <!-- 내 메모 -->
   <div class="card shadow mb-4" id = "memo">
   
     <div class="card-header py-3">
       <h6 class="m-0 font-weight-bold text-primary">내 메모</h6>
     </div>
     
     <div class="card-body">
       <textarea class="form-control" id="note" rows="11" style = "resize: none"><c:out value="${cookie.note.value}"></c:out></textarea>
     </div>
     
   </div>
   
   <!-- 결제 -->
   <div class="card shadow mb-4" id = "approval">
   
     <div class="card-header py-3">
       <h6 class="m-0 font-weight-bold text-primary">최근 상신 문서<a style = "float: right;" href = "${pageContext.request.contextPath }/apv/sendApv.do?loginNo=${loginEmp['EMPNO'] }"><strong>+더보기</strong></a></h6>
     </div>
     
     <div class="card-body">
       <table class="table table-striped table-hover tablesorter" id="apvTable" width="100%" cellspacing="0" role="grid" aria-describedby="dataTable_info" style="width: 100%;">
                       <thead>
                  <tr>
                     <th scope="col">No</th>
                     <th scope="col">분류</th>
                     <th scope="col">문서명</th>
                     <th scope="col">결재상태</th>            
                  </tr>
                       </thead>
                       <tbody>
                       <c:if test = '${fn:length(apvList) > 0 }'>
                          <c:forEach items="${apvList}" var="apv" varStatus = "v" begin="0" end = "4">
                        <tr>
                            <td>${v.count}</td> 
                           <td>${apv["DCTITLE"]}</td>
                           <td>${apv["APVTITLE"]}</td>
                           <td>${apv["APVSTATUS"]}</td>                                
                        </tr>
                     </c:forEach>
                     </c:if>
                     <c:if test = '${fn:length(apvList) == 0 }'>
                        <tr>
                           <td colspan="4" style="text-align: center">상신 문서가 없습니다.</td>
                        </tr>
                     </c:if>
                       </tbody>
                     </table>
     </div>
     
   </div>
   
   <!-- 일정 -->
   <div class="card shadow mb-4" id = "calendar">
   
     <div class="card-header py-3">
       <h6 class="m-0 font-weight-bold text-primary">최근 내 일정 <a style = "float: right;" href = "${pageContext.request.contextPath }/calendar/allView.do?temp=${loginEmp['EMPNO'] }"><strong>+더보기</strong></a></h6>
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
                       <c:if test = '${fn:length(calList) > 0 }'>
                          <c:forEach items="${calList}" var="cal" varStatus = "v" begin="0" end = "4">
                        <tr>
                            <td>${v.count}</td> 
                           <td>${cal.title}</td>
                           <td>${cal.start}</td>
                           <td>${cal.end}</td>                                
                        </tr>
                     </c:forEach>
                     </c:if>
                     <c:if test = '${fn:length(calList) == 0 }'>
                        <tr>
                           <td colspan="4" style="text-align: center">최근 일정이 없습니다.</td>
                        </tr>
                     </c:if>
                       </tbody>
                     </table>
     </div>
     
   </div>
   
   
   <!-- 공지사항 -->
   <div class="card shadow mb-4" id="notice">
     <div class="card-header py-3">
       <h6 class="m-0 font-weight-bold text-primary">공지사항 <a style = "float: right;" href = ""><strong>+더보기</strong></a></h6>
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
             console.log(음표);
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
               console.log(음표);
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