<%@ page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:include page="/WEB-INF/views/common/header.jsp">
   <jsp:param name="pageTitle" value=""/>
</jsp:include>

<style>
	.img-avatar {
    height: 42px;
    border-radius: 20px;
    width: 42px;
}
	.message-feed.right {
	    text-align: right;
}
	.message-feed {
	    padding: 20px;
}
	.mf-content {
	    padding: 12px 17px 13px;
	    border-radius: 2px;
	    display: inline-block;
	    max-width: 80%;
}
	.mf-date {
	    display: block;
	    color: #B3B3B3;
	    margin-top: 7px;
}
	.bg-secondary {
	    background-color: #dde4eb
	    !important;
	    box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.14), 0 3px 1px -2px rgba(0, 0, 0, 0.2), 0 1px 5px 0 rgba(0, 0, 0, 0.12);
}
	.pull-left {
	    float: left;
}
	.msb-reply {
	    position: relative;
	    margin-top: 30px;
	    border-top: 1px solid #eee;
	    background: #f8f8f8;
}
	.msb-reply textarea {
	    width: 100%;
	    font-size: 13px;
	    border: 0;
	    padding: 10px 15px;
	    resize: none;
	    height: 60px;
	    background: 0 1;
}
	.msb-reply button {
	    position: absolute;
	    top: 0;
	    right: 0;
	    border: 0;
	    height: 100%;
	    width: 60px;
	    font-size: 25px;
	    color : #4e73df!important;
	    background: 0 0;
}
</style>
<section id="content">
<div></div>
<br/><br/><br/>
     <div class="text-history" name="text-history"    id="text-history">
      <input type="hidden" name="sender" id = "sender" value="${loginEmp['EMPNO']}">
      <input type="hidden" name="roomNo" value="${cr.roomNo}">
      <input type = "hidden" id = "crSender" value = "${cr.sender }"/>
     	<c:forEach items="${list }" var="list">
		     	  <c:if test="${list['SENDER'] != loginEmp['EMPNO']}">
			          <div class="message-feed feed" id="msg" name="msg">
			              <div class="pull-left">
			                   <img src="${path }/resources/b4/img/avatar.png" alt="" class="mr-2 img-avatar">
			              </div>
			              <div class="media-body">
			                   <div class="mf-content bg-secondary    text-dark">${list['CHATTEXT']}</div> <!-- 텍스트내용 -->
			                   <small class="mf-date"><i class="far    fa-clock">${list['SENDDATE']}</i></small> <!-- 날짜 -->
			              </div>
			          </div>
		          </c:if>
		          <c:if test="${list['SENDER'] == loginEmp['EMPNO']}">
			          <div class="message-feed right" id="msg" name="msg">
			              <div class="media-body">
			                   <div class="mf-content bg-primary    text-white">${list['CHATTEXT']}</div> <!-- 텍스트내용 -->
			                   <small class="mf-date"><i class="far fa-clock">${list['SENDDATE']}</i></small> <!-- 날짜 -->
			              </div>
			          </div>
			      </c:if>
		</c:forEach>
		</div>
        <br/><br/><br/> 
        <div class="fixed-bottom msb-reply">
          <Input type="hidden" name="receiver" value="${empNo}"> 
          <textarea name="chatText" id="text" class="text" placeholder="Message..."></textarea>
          <button type="button" onclick="send();" id="enter">
              <i class="far fa-paper-plane"></i>
          </button>
     	</div>
          

</section>
<!-- 메세지 보낼때 -->
<script>
var crSender = $('#crSender').val();
var sender = $('#sender').val();

// method to scroll down
	function scrollDown(){
		window.scrollTo(0,document.body.scrollHeight);
	}

window.onload = function(){
	scrollDown();
}
	
//creating web socket
     /* var socket = new  WebSocket("ws://192.168.120.171:9090/bm/chatRoom"); */
	var socket = new  WebSocket("ws://192.168.110.5:9090/bm/chatRoom");
     
     // This method is triggered when it's received
     socket.onmessage = function(e) {
          console.log(e);
          d = JSON.parse(e.data);
          receive(d);
     }
     
     function receive(d){
     
          var msg = {
        		  "receiver" : d["receiver"],
                  "sender" : d["sender"],
                  "chatText" : d["chatText"],
                  "roomNo" : d["roomNo"]
          };

          var date =  document.createTextNode(formatAMPM(new Date()));
		
          
          if(crSender != sender) {
        	  
        	  /* inputting image */
        	  var imgDiv = $("<div>").attr({
        		 "class" : "pull-left" 
        	  });
        	  
        	  var img = $("<img>").attr({
        		 "src" :  "${path }/resources/b4/img/avatar.png",
        		 "class" : "mr-2 img-avatar"
        	  });
				imgDiv.append(img);
				
        	  /* inputting text */
        	  var div = $("<div>").attr({
	              "class" : "mf-content bg-secondary  text-dark"
	          });
	          var small = $("<small>").attr({
	              "class" : "mf-date"
	          });
	          var wrap = $("<div>").attr({
	              "class" : "message-feed feed",
	              "id" : "msg",
	              "name" : "msg"
	          });
	          div.append(msg["chatText"]);
	          small.append("<i class='far fa-clock'></i>  ").append(date);
	          wrap.append(imgDiv);
	          wrap.append(div).append(small);
	          $("#text-history").append(wrap);
	          $("#text").val("");
	          scrollDown();
          } else {
		
	          var div = $("<div>").attr({
	              "class" : "mf-content bg-primary  text-white"
	          });
	          var small = $("<small>").attr({
	              "class" : "mf-date"
	          });
	          var wrap = $("<div>").attr({
	              "class" : "message-feed right"
	          });
	          div.append(msg["chatText"]);
	          small.append("<i class='far fa-clock'></i>  ").append(date);
	          wrap.append(div).append(small);
	          $("#text-history").append(wrap);
	          $("#text").val("");
	          scrollDown();
          }
     	
     }
     
     function send() {
          // creating a JSON and Sending it to Java
          var msg = {
              "receiver" : "${empNo}",
              "sender" : "${loginEmp['EMPNO']}",
              "roomNo" : "${cr.roomNo}",
              "chatText" : $('#text').val()
          };

          socket.send(JSON.stringify(msg));
     }
     // 날짜/ 시간
     function formatAMPM(date) {
          var hours = date.getHours();
          var minutes = date.getMinutes();
          var ampm = hours >= 12 ? 'PM' : 'AM';
          hours = hours % 12;
          hours = hours ? hours : 12; // the hour '0'  should be '12'
          minutes = minutes < 10 ? '0' + minutes :  minutes;
          var strTime = hours + ':' + minutes + ' ' +  ampm;
          return strTime;
     }
     $('#text').keyup(function(event) {
          var keycode = (event.keyCode ? event.keyCode :  event.which);
          if (keycode == '13') {
              send();
          }
     });

</script>