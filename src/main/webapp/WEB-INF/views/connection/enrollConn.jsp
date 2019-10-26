<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp">   
   <jsp:param value="거래처 등록" name="tabTitle"/> 
</jsp:include>

<style>
.form-control {
    display: block;
    width: 500px;
    height: calc(1.5em + .75rem + 2px);
    padding: .375rem .75rem;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #6e707e;
    background-color: #fff;
    background-clip: padding-box;
    border: 1px solid #d1d3e2;
    border-radius: .35rem;
    transition: border-color .15s ease-in-out,box-shadow .15s ease-in-out;
}
.connectionName {
   display: inline-block;
}
#postcode1, #postcode2, #addrBtn, #address, #address_etc {
   margin-bottom: 5px;
   display: inline-block;
}
.trf {
   margin-top: 5px;
}
</style>

<section>

   <div class="card shadow mb-4">
      <div class="card-header py-3">
         <h6 class="m-0 font-weight-bold text-primary">거래처 등록</h6>
        </div>
      <div class="card-body">
         <br/>
         
         <form name="enrollConnection" class="forms-sample" action="${path }/connection/enrollConnEnd.do" method="post" onsubmit="return enroll_validate();">
            <div class="form-group">
               <label>거래처 구분</label>
               <div class="col-sm-4">
                  <div class="form-radio">
                     <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="conCateg" id="conCategory1" value="매입" checked=""> 매입처 <i class="input-helper"></i>
                     </label>
                  </div>
               
                  <div class="form-radio">
                     <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="conCateg" id="conCategory2" value="매출"> 판매처 <i class="input-helper"></i>
                     </label>
                  </div>
               
                  <div class="form-radio">
                     <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="conCateg" id="conCategory2" value="유통"> 유통업체 <i class="input-helper"></i>
                     </label>
                  </div>
               </div>
            </div>
            <br/>
            
            <div class="form-group">
               <label>* 거래처 상호(이름)</label>
               <div id="connectionName">
                  <input type="text" class="form-control connectionName" id="conName" name="conName" placeholder="거래처 상호(이름)" required />
                  <button type="button" class="btn btn-primary btn-fw connectionName" onclick="conNameDuplCheck();">중복검사</button>
                  <input type="hidden" id="conNameCheckResult" />
               </div>
            </div>
            <br/>
            
            <div class="form-group">
               <label>* 대표자명</label>
               <input type="text" class="form-control" id="conRepName" name="conRepName" placeholder="대표자명" required />
            </div>
            <br/>
            
            <div class="form-group">
               <label>* 전화번호</label>
               <input type="tel" class="form-control" id="conTel" name="conTel" placeholder="전화번호 (-없이 10자 내의 숫자)" required />
            </div>
            <br/>
            
            <div class="form-group">
               <label>핸드폰번호</label>
               <input type="tel" class="form-control" id="conPhone" name="conPhone" placeholder="핸드폰번호 (-없이 11자 내의 숫자)"/>
            </div>
            <br/>
            
            <div class="form-group">
               <label>사용구분</label>
               <div class="col-sm-4">
                  <div class="form-radio">
                     <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="conUseCk" id="conUseCk1" value="Y" checked=""> 사용 <i class="input-helper"></i>
                     </label>
                  </div>
                  <div class="form-radio">
                     <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="conUseCk" id="conUseCk2" value="N"> 사용안함 <i class="input-helper"></i>
                     </label>
                  </div>
               </div>
            </div>
            <br/>

            <div class="form-group">
               <label>이체정보</label>
               <div class="col-sm-4">
                  <div class="form-radio">
                     <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="conTransCk" id="conTransCk1" value="Y" checked=""> 입력 <i class="input-helper"></i>
                     </label>
                  </div>
                  <div class="form-radio">
                     <label class="form-check-label">
                        <input type="radio" class="form-check-input" name="conTransCk" id="conTransCk2" value="N"> 나중에 <i class="input-helper"></i>
                     </label>
                  </div>
                  <br>
                  <div class="form-group">
                     <label>은행명<input type="text" class="form-control trf" id="trfBkName" name="trfBkName" placeholder="은행명" /></label>
                     <label>계좌번호<input type="text" class="form-control trf" id="trfAccount" name="trfAccount" placeholder="계좌번호" /></label>
                     <label>예금주명<input type="text" class="form-control trf" id="trfAccHolder" name="trfAccHolder" placeholder="예금주명" /></label>
                     <label>비고<input type="text" class="form-control trf" id="trfNote" name="trfNote" placeholder="비고" /></label>
                  </div>
               </div>
            </div>
            <br/>

            <div class="form-group">         
               <label>* 주소</label>
               <br/>
               <input type="text" class="form-control" id="postcode1" name="postcode1" style="width:70px;" readonly/>
               -
               <input type="text" class="form-control" id="postcode2" name="postcode2" style="width:70px;" readonly/>
               &nbsp;&nbsp;
               <input type="button" class="btn btn-primary btn-fw connectionName" id="addrBtn" onClick="openDaumZipAddress();" value="주소검색" />
               <br/>
               <input type="text" class="form-control" id="address" name="address" style="width:300px" readonly/>
               <input type="text" class="form-control" id="address_etc" name="address_etc" style="width:200px" placeholder="상세주소"/>
               <script type="text/JavaScript" src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
               <script>
                  //다음 주소 API
                  function openDaumZipAddress() {
                     new daum.Postcode({
                        oncomplete:function(data) {
                           jQuery("#postcode1").val(data.postcode1);
                           jQuery("#postcode2").val(data.postcode2);
                           jQuery("#address").val(data.address);
                           jQuery("#address_etc").focus();
                           console.log(data);
                        }
                     }).open();
                  }
               </script>
            </div>
            <br/>
            <button type="submit" class="btn btn-success mr-2">등록</button>
            <button class="btn btn-light" onclick="submitCancel();">취소</button>
         </form>
      </div>
   </div>

   <form name="checkconNameDuplFrm" method="post">
      <input type="hidden" name="conCateg_" />
      <input type="hidden" name="conName_" />
   </form>
</section>

<script>
$(document).ready(function() {
   
   $("input:radio[name=conTransCk]").click(function() {
       if($("input[name=conTransCk]:checked").val() == "N") {
           $("input[name=trfBkName]").attr("disabled",true);
           $("input[name=trfAccount]").attr("disabled",true);
           $("input[name=trfAccHolder]").attr("disabled",true);
           $("input[name=trfNote]").attr("disabled",true);

         $("input[name=trfBkName]").attr("required",false);
         $("input[name=trfAccount]").attr("required",false);
         $("input[name=trfAccHolder]").attr("required",false);
       }
       else {
           $("input[name=trfBkName]").attr("disabled",false);
           $("input[name=trfAccount]").attr("disabled",false);
           $("input[name=trfAccHolder]").attr("disabled",false);
           $("input[name=trfNote]").attr("disabled",false);

         $("input[name=trfBkName]").attr("required",true);
         $("input[name=trfAccount]").attr("required",true);
         $("input[name=trfAccHolder]").attr("required",true);
       }
   });
});


function conNameDuplCheck(){
   var regExpConName = /^[가-힣a-zA-Z]+$/;
   
   var conCateg = $("input[name=conCateg]:checked").val().trim();
   var conName = $("#conName").val().trim();
   
   if(conName==="") {
      alert("거래처명을 입력해주세요!");
   }
   
   else{
      if(!regExpConName.test(enrollConnection.conName.value)) {
         alert("거래처 상호(이름)는 한글과 영어만 입력 가능합니다.");
         document.getElementById("conName").value = "";
      }
      else {
         var url = "${path}/connection/checkConNameDupl.do";
         var name = "거래처 중복검사";
          var option = "width=300, height=200, top=100, left=500, location=no, menubar=no, status=no"
          var popup = open("", name, option);
          
          checkconNameDuplFrm.conCateg_.value = conCateg;
          checkconNameDuplFrm.conName_.value = conName;
          checkconNameDuplFrm.target = name;
          checkconNameDuplFrm.action = url;
          checkconNameDuplFrm.submit();         
      }   
   }
}


function enroll_validate() {
   var regExpRepName = /^[가-힣a-zA-Z]+$/;
   var regExpConTel = /^[0-9]{8,10}$/;
   var regExpConPhone = /^01([0|1|6|7|8|9]{1})([0-9]{3,4})([0-9]{4})$/;
   
   var regExpBankName = /^[가-힣a-zA-Z]+$/;
   var regExpAccount = /[0-9]/;
   
   if($('#conNameCheckResult').val() != "Y") {
      $('#conName').focus();
      alert("거래처 상호(이름) 중복검사를 확인해주세요.");
      return false;
   }
   if(!regExpRepName.test(enrollConnection.conRepName.value)) {
      conRepName.focus();
      alert("대표자명은 한글과 영어만 입력 가능합니다.");
      return false;
   }
   if(!regExpConTel.test(enrollConnection.conTel.value)) {
      conTel.focus();
      alert("전화번호는 8~10자 내의 숫자만 가능합니다.");
      return false;
   }
   if(($('#conPhone').val() != "") && (!regExpConPhone.test(enrollConnection.conPhone.value))) {
      conPhone.focus();
      alert("핸드폰번호는 11자 내의 숫자만 가능합니다.");
      return false;
   }
   console.log($("input[name=conTransCk]:checked"));
   if($("input[name=conTransCk]:checked").val() == "Y") {
      if(!regExpBankName.test(enrollConnection.trfBkName.value)) {
         trfBkName.focus();
         alert("은행명은 한글과 영어만 입력 가능합니다.");
         return false;
      }
      if(!regExpAccount.test(enrollConnection.trfAccount.value)) {
         trfAccount.focus();
         alert("계좌번호는 숫자만 입력 가능합니다.");
         return false;
      }
      if(!regExpBankName.test(enrollConnection.trfAccHolder.value)) {
         trfAccHolder.focus();
         alert("예금주명은 한글과 영어만 입력 가능합니다.");
         return false;
      }
   }
    if(enrollConnection.postcode1.value == "") {
      postcode1.focus();
      alert("주소검색을 통해 우편번호 및 주소를 입력하세요.")
      return false;
   } 
   return true;
}


function submitCancel(){
   location.href="${path}/connection/connList.do";
}
</script>












