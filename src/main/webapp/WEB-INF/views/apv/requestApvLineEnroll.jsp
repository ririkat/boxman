<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
   content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>결재</title>

<script src="http://code.jquery.com/jquery-3.4.1.min.js"></script>

<!-- Custom fonts for this template-->
<link
   href="${path }/resources/b4/vendor/fontawesome-free/css/all.min.css"
   rel="stylesheet" type="text/css">
<link
   href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
   rel="stylesheet">

<!-- CSS -->
<link href="${path }/resources/b4/css/sb-admin-2.min.css"
   rel="stylesheet">

<!-- Bootstrap core JavaScript-->
<script src="${path }/resources/b4/vendor/jquery/jquery.min.js"></script>
<script
   src="${path }/resources/b4/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

<!-- Core plugin JavaScript-->
<script
   src="${path }/resources/b4/vendor/jquery-easing/jquery.easing.min.js"></script>

<!-- Custom scripts for all pages-->
<script src="${path }/resources/b4/js/sb-admin-2.min.js"></script>

<style>
.title {
   margin-top: 20px;
   margin-bottom: 20px;
   text-align: center;
}
</style>
</head>
<body id="page-top">
   <section>
      <div class="container">
         <h2 class="title font-weight-bold text-primary">결재 라인 등록</h2>
         <div class="card shadow mb-4">
            <div class="card-body">
               <div class="row" style="padding:1px;">
                  <div class="col-sm-3" style="height: 690px; border: thin solid gray;">
                     <p>조직도</p>
                     <hr />
                     <a href="#">전체</a><br />
                     <ul>
                        <c:forEach items="${deptList }" var="dl">
                           <a href="#" id="${dl['DEPTNO'] }" class="empLoad">
                              <li>&nbsp;${dl['DEPTNAME'] }</li>
                           </a>
                        </c:forEach>
                     </ul>
                  </div>
                  <div class="col-sm-9">
                     <div class="row"
                        style="height: 250px;overflow-y: scroll; border: thin solid gray;">
                        <div class="col-sm-12 text-center">
                        <table id="empListTbl" class="table table-borded">
                           <thead>
                           <tr>
                              <th>선택</th>
                              <th>사원번호</th>
                              <th>부서</th>
                              <th>직급</th>
                              <th>사원명</th>
                           </tr>
                           </thead>
                           <tbody id="body">
                           </tbody>
                        </table>
                        </div>
                     </div>
                     <div class="row" id="addButton">
                     <div class="col-sm-12 text-center">
                        <button type="button" class="btn btn-primary" id="addA" onclick="addBtnA()" >결재자▼</button>
                        <button type="button" class="btn btn-primary" id="addR" onclick="addBtnR()" >참조자▼</button>
                        <button type="button" class="btn btn-primary" id="addE" onclick="addBtnE()" >시행자▼</button>
                        <button type="button" class="btn btn-primary" id="allRemove" onclick="removeAll()" >전체비우기</button>
                     </div>   
                     </div>
                        <div class="row" style="height:400px; overflow: hidden;  padding:5px; border: thin solid gray;">
                           <div class="col-sm-12" >
	                           <form id="apvLineForm" class="form-controll" style="width:100%">
		                           <table class="table table-stripped">
		                              <tr>
		                                 <th>결재라인명</th>
		                                 <td>
		                                 	<input type="text" name="apvLineTitle" id="apvLTitle" style="width:600px;" />
		                                 </td>
		                              </tr>
		                              <tr>
		                                 <td colspan="2">
		                                 	<table style="width:100%;" >
		                                 		<tr>
		                                 			<th>결재자
		                                 				<button type="button" class="btn" id="up" onclick="upButton();">▲</button>
					                                    <button type="button" class="btn" id="down" onclick="downButton();">▼</button>
					                                    <button type="button" class="btn" id="removeSel" onclick="selRemove();">X</button>
					                                    <button type="button" class="btn btn-primary" id="allRemoveA" onclick="removeAllA()" >비우기</button>
		                                 			</th>
		                                 			<th>참조자
		                                 				<button type="button" class="btn" id="upR" onclick="upButtonR();">▲</button>
					                                    <button type="button" class="btn" id="downR" onclick="downButtonR();">▼</button>
					                                    <button type="button" class="btn" id="removeSelR" onclick="selRemoveR();">X</button>
					                                    <button type="button" class="btn btn-primary" id="allRemoveR" onclick="removeAllR()" >비우기</button>
		                                 			</th>
		                                 		</tr>
		                                 		<tr>
		                                 			<td>
					                                    <select name="apvL" id="apvL" class="form-controll" size="6" style="width:100%">
					                                    </select>
		                                 			</td>
		                                 			<td>
					                                    <select name="apvLR" id="apvLR" class="form-controll" size="6"  style="width:100%">
					                                    </select>
		                                 			</td>
		                                 		</tr>
		                                 		<tr>
		                                 			<td colspan="2">
		                                 				<b>시행자</b><button type="button" class="btn" id="allRemoveE" onclick="removeAllE();">비우기</button><br/>
		                                 				<input type="text" id="apvLE" name="apvLE" style="width:100%;" readonly/>
		                                 			</td>
		                                 		</tr>
		                                 	</table>
		                                 </td>
		                              </tr>
		                           </table>
	                           </form>
                           </div>
                     </div>
                  </div>
               </div>
               <div class="row">
                  <button type="button" class="btn btn-primary" id="use" onclick="useButton()" style="width:100%">사용하기</button>
               </div>
            </div>
         </div>
      </div>
      <script>
         $(function() {
            $('.empLoad').on('click',function() {
                           var deptNo = $(this).attr('id');
                           $.ajax({
                                    url : "${path }/apv/selectDeptToEmp.do",
                                    type : "post",
                                    data : {"deptNo" : deptNo},
                                    dataType : "json",
                                    contentType : "application/x-www-form-urlencoded; charset=UTF-8",
                                    success : function(data) {
                                       var result = data;
                                       var tbody = $('#empListTbl').children('#body');
                                       tbody.html("");
                                       $.each(result,function(idx,val) {
                                                      //체크박스
                                                      //사원번호
                                                      //부서
                                                      //직급
                                                      //사원명
                                                      var tr = $('<tr>');
                                                      var ckbox = $('<input>').attr({
                                                                     "type" : "checkbox",
                                                                     "name" : "emp",
                                                                     "value" : val.EMPNO
                                                                  });
                                                      var td1 = $('<td>');
                                                      td1.append(ckbox);
                                                      var td2 = $('<td>');
                                                      td2.html(val.EMPNO);
                                                      var td3 = $('<td>');
                                                      td3.html(val.DEPTNAME);
                                                      var td4 = $('<td>');
                                                      td4.html(val.JOBNAME);
                                                      var td5 = $('<td>');
                                                      td5.html(val.EMPNAME);

                                                      tr.append(td1).append(td2).append(td3).append(td4).append(td5);
                                                      tbody.append(tr);

                                                   });
                                    }
                                 });
                        });
            
            
            
         });
         /* 전체 비우기 */
         function removeAll(){
             $("#apvL option").remove();
             $("#apvLR option").remove();
             $("#apvLE").val("");
          }
         /* 결재자 */
         /* 1. 결재자 추가 */
         function addBtnA(){
            var checked=$("input:checkbox[name='emp']:checked");
            $.each(checked,function(idx,val) {
               var empNo=val.value;
               var deptName=val.parentNode.nextSibling.nextSibling.innerHTML;
               var jobName=val.parentNode.nextSibling.nextSibling.nextSibling.innerHTML;
               var empName=val.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.innerHTML;
               var option=$('<option>');
               option.val(empNo);
               option.html("["+deptName+"]"+empName+"("+jobName+")");
               
               var selectBox=$('#apvL');
               selectBox.append(option);
            });
            $("input:checkbox[name='emp']").prop("checked",false);
         }
         /* 2. 결재자 위로 이동 */
         function upButton(){
            var selectOpt=$("#apvL option:selected");
            selectOpt.prev().before(selectOpt);            
         }
         /* 3. 결재자 아래로 이동 */
         function downButton(){
            var selectOpt1=$("#apvL option:selected");
            selectOpt1.next().after(selectOpt1);
         }
         /* 4. 결재자 선택 지우기*/
         function selRemove(){
            $("#apvL option:selected").remove();
         }
         /* 5. 결재자 전체 비우기 */
         function removeAllA(){
             $("#apvL option").remove();
         }
         
         /* 참조자 */
         /* 1. 참조자 추가 */
         function addBtnR(){
             var checked=$("input:checkbox[name='emp']:checked");
             $.each(checked,function(idx,val) {
                var empNo=val.value;
                var deptName=val.parentNode.nextSibling.nextSibling.innerHTML;
                var jobName=val.parentNode.nextSibling.nextSibling.nextSibling.innerHTML;
                var empName=val.parentNode.nextSibling.nextSibling.nextSibling.nextSibling.innerHTML;
                var option=$('<option>');
                option.val(empNo);
                option.html("["+deptName+"]"+empName+"("+jobName+")");
                
                var selectBox=$('#apvLR');
                selectBox.append(option);
             });
             $("input:checkbox[name='emp']").prop("checked",false);
          }
         /* 2. 참조자 위로 이동 */
          function upButtonR(){
             var selectOpt=$("#apvLR option:selected");
             selectOpt.prev().before(selectOpt);            
          }
         /* 3. 참조자 아래로 이동 */
          function downButtonR(){
             var selectOpt1=$("#apvLR option:selected");
             selectOpt1.next().after(selectOpt1);
          }
         /* 4. 참조자 선택 지우기 */
          function selRemoveR(){
             $("#apvLR option:selected").remove();
          }
         /* 5. 참조자 전체 비우기 */
          function removeAllR(){
              $("#apvLR option").remove();
          }
         
          /* 시행자 */
          /* 1. 시행자 추가 */
          function addBtnE(){
              var checked=$("input:checkbox[name='emp']:checked");
              if(checked.length==0){
            	  alert('시행자를 선택 후 추가해주세요.');
              }else if(checked.length>1){
            	  alert('시행자는 한명만 선택해 주세요.');
              }else if(checked.length==1){
            	  var empNo=$(checked[0]).val();
                  var deptName=$(checked[0]).parent().next().next().html();
                  var jobName=$(checked[0]).parent().next().next().next().html();
                  var empName=$(checked[0]).parent().next().next().next().next().html();
                  var input=$('#apvLE');
                  input.attr({"name":empNo});
                  input.val("["+deptName+"]"+empName+"("+jobName+")");
              }
              $("input:checkbox[name='emp']").prop("checked",false);
           }
          /* 5. 참조자 삭제 */
           function removeAllE(){
               $("#apvLE").val("");
           }
         
         
         //////////////////////현재 결재라인 저장 로직 추가할 때 쓸거임.
         function enrollButton(){
        	/* $('#apvL').attr("multiple",true);
            $('#apvL option').attr("selected",true); */
            
            var myObject=new Object();
            var apvLTitle=$('#apvLTitle').val();
            var selOpts=new Array();
            $('#apvL option').each(function(){
            	selOpts.push($(this).val());
            });
            myObject["apvLTitle"]=apvLTitle;
            myObject["selOpts"]=selOpts;

            $.ajax({
               url:"${path}/apv/apvLineEnrollEnd.do",
               type : "post",
               data : JSON.stringify(myObject),
               contentType: "application/json",
               success : function(data) {
                  if(data>0){
                	  alert("등록성공");
                  }else{
                     alert("등록실패");
                  }
               }
            });
         }
         ///////////////////////////////
         function useButton(){
        	 $("input[name=apvLA]",opener.document).remove();
        	 $("input[name=apvLR]",opener.document).remove();
        	 $("input[name=apvLE]",opener.document).remove();
             $('#apvL option').each(function(i,item){
             	var index=i+1;
             	var content=$(this).html();
             	var idx1=content.indexOf(']')+1;
             	var idx2=content.indexOf('(');
             	
             	var name=content.substring(idx1,idx2);
             	
             	$("#prior"+index,opener.document).html(name);
             	$(opener.location).attr("href", "javascript:returnApvLA("+$(this).val()+","+index+");");
             });
             	
             $('#apvLR option').each(function(i,item){
              	var index=i+1;
              	$(opener.location).attr("href", "javascript:returnApvLR("+$(this).val()+","+index+");");
              });
          
              	var value=$('#apvLE').val();
            	var contentE=$('#apvLE').attr("name");
            	console.log(contentE);
            	
            	var idx1E=value.indexOf(']')+1;
            	var idx2E=value.indexOf('(');
            	
            	var nameE=value.substring(idx1E,idx2E);
            	$("#requestName",opener.document).html(nameE);
            	$(opener.location).attr("href", "javascript:returnApvLE("+contentE+");");
            	
            	self.close();
         }
         
      </script>

   </section>

</body>
</html>