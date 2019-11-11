<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">   
       <jsp:param value="Accounting" name="tabTitle"/>
       <jsp:param value="" name="pageTitle"/>
</jsp:include>
<section>
<!-- DataTales Example -->
       <div class="card shadow mb-4">
             <div class="card-header py-3">
                    <h6 class="m-0 font-weight-bold text-primary">퇴직금  관리</h6>
             </div>
             <div class="card-body">
                    <div class="table-responsive">
                           <div id="dataTable_wrapper" class="dataTables_wrapper   dt-bootstrap4">
                                 <div class="row">
                                        <div class="col-sm-12 col-md-6">
                                               <form id="searchFrm">
                                                     <div   class="dataTables_length" id="dataTable_length">
                                                            <label>Search:
                                                            <select name="type"   id="stuffMain"
                                                                    class="form-control form-control-sm">
                                                                           <option value="empNo">사원번호</option>
                                                                           <option value="empName">이름</option>
                                                                           <option value="deptName">부서명</option>
                                                                           <option value="jobName">직급명</option>
                                                            </select>
                                                            <input type="search"   class="form-control form-control-sm"
                                                                    placeholder="" aria-controls="dataTable" name="data">
                                                            </label>
                                                            <button   onclick="fn_search();"
                                                                   class="btn btn-primary mr-2">
																<span   class="text">검색</span>
                                                            </button>
                                                     </div>
                                               </form>
                                        </div>
                                        
                                 </div>
                                 <div class="row">
                                        <div class="col-sm-12">
                                               <table class="table table-striped   table-hover" id="dataTable"
                                                     width="100%"   cellspacing="0" role="grid"
                                                       aria-describedby="dataTable_info" style="width: 100%;">
                                                     <thead>
                                                            <tr>
                                                                    <th>사원번호</th>
                                                                   <th>이름</th>
                                                                   <th>직급</th>
                                                                   <th>부서</th>
                                                                   <th>퇴사   여부</th>
                                                                   <th>퇴사   날짜</th>
                                                                   <th>퇴사</th>
                                                            </tr>
                                                     </thead>
                                                     
                                                     <tbody>
                                                            <c:forEach var="e"   items="${list}">
                                                                   <tr>
                                                                         <td>
                                                                                 <a href='${path }/emp/selectEmpOne.do?empNo=${e["EMPNO"]}'>
                                                                                       <c:out value='${e["EMPNO"]}' />
                                                                                 </a>
                                                                                
                                                                         </td>
                                                                         <td>
                                                                                 <a href='${path }/emp/selectEmpOne.do?empNo=${e["EMPNO"]}'>
                                                                                       <c:out value='${e["EMPNAME"]}' />
                                                                                 </a>
                                                                         </td>
                                                                         <td>
                                                                                 <c:out value='${e["JOBNAME"]}' />
                                                                         </td>
                                                                         <td>
                                                                                 <c:out value='${e["DEPTNAME"]}' />
                                                                         </td>
                                                                         <td>
                                                                                 <c:out value='${e["SEVPAY"] }' />
                                                                         </td>
                                                                         <td>
                                                                                 <c:out value='${e["SEVDATE"] }' />
                                                                         </td>
                                                                         <td>
                                                                                 <c:if test='${fn:trim(e["SEVPAY"]) ne "" and fn:trim(e["SEVDATE"]) eq ""}'  var="r">
                                                                                          <c:set var="empname" value='${ e["EMPNAME"]}'/>
                                                                                       <c:set var="hiredate" value='${e["HIREDATE"]}'/>
                                                                                       <c:set var="salary" value='${e["EMPSAL"]}'/>
                                                                                       <button type="button" class="btn btn-success"  onclick="quit('${e.EMPNO}');"  data-toggle="modal"  data-target="#exampleModal">퇴직금 지급하기</button>
                                                                                 </c:if>
                                                                         </td>
                                                                   </tr>
                                                                   </c:forEach>
                                                     </tbody>
                                               </table>
                                        </div>
                                 </div>
                           </div>
                           ${pageBar }
<script>
       function quit(empno){
          if(confirm('퇴직급을 지급하겠습니까?')){
                $.ajax({
                       url: "${path}/acct/severancePayment.do",
                       data: {"empno": empno},
                       type: "post",
                       success: function(num){
           	    		var result=JSON.parse(num);
           	    		console.log(result);
           	    		if(result == 1){
           	    			alert("출장비가 지급 되었습니다");
           	    		} else{
           	    			alert("문제가 발생했습니다.");
           	    		}
           	    		location.reload();
           	    	}
           	    })
           	} else {
           	    // Do nothing!
           	}
       }
       
           // 검색
              function fn_search(){
                    $("#searchFrm").attr("action",  "${path}/acct/severanceSearch.do");
                    $("#searchFrm").submit();
              }
</script>
</section>
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>