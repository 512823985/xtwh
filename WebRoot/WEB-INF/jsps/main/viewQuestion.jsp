<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>查看问题</title>  
    <link rel="stylesheet" href="<%=basePath%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>/css/admin.css">
    <script src="<%=basePath%>/js/jquery.js"></script>
    <script src="<%=basePath%>/js/pintuer.js"></script>
  </head>
  
  <body>
    <div class="panel admin-panel">
	  <div class="panel-head"><strong class="icon-reorder"> 查看问题</strong></div>
	  <c:if test="${empty resolved }">
		  <div class="padding border-bottom">  
		  <a class="button button-little bg-green" href="${pageContext.request.contextPath }/reply/toReply.do?questionid=${question.id }"><span class="icon-plus-square-o"></span> 回复内容</a>
		  <%-- <button class="button button-little bg-blue" onclick="resolved(${question.id}, ${question.user.userId })"><span class="icon-wrench"></span> 完成处理</button> --%>
		  </div>
	  </c:if>
	  <div>
	  <table class="table" >
	    <tr style="text-align: left;">
	      <td>姓名：</td> 
	      <td>${question.user.userName }</td>   
	      <td>联系电话：</td> 
	      <td>${question.user.userPhone }</td>
	      <td>发表时间：</td>
	      <td><fmt:formatDate value="${question.time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>  
	      <td>IP地址：</td>
	      <td>${question.ip }</td>     
	    </tr>
	    <tr>
	    	<td style="text-align: left;" colspan="8">
	    		<div style="text-align: center;"><h3>【标题】:${question.title }</h3></div>
	    		<div>
		    		<b>【问题内容】</b>
		    		<p style="margin-left: 7px;">
	    				${question.content }
		    		</p>
	    		</div>
	    	</td>
	    </tr>
	    <c:if test="${not empty replyList }">
	  		<c:forEach items="${replyList }" var="reply" >
  				<tr style="text-align: left;border-top:1px solid #ddd;">
			      <td>姓名：</td> 
			      <td>${reply.username }</td>   
			      <td>联系电话：</td> 
			      <td>${reply.phone }</td>
			      <td>发表时间：</td>
			      <td><fmt:formatDate value="${reply.time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>  
			      <td>IP地址：</td>
			      <td>${reply.ip }</td>     
			    </tr>
			    <tr>
			    	<td style="text-align: left;" colspan="8">
			    		<b>【回复内容】</b>
			    		<p style="margin-left: 7px;">
		    				${reply.content }
			    		</p>
			    		
			    	</td>
			    </tr>
	  		</c:forEach>
	  	</c:if>
	  </table>
	  </div>
	</div>
	<script type="text/javascript">
  	function resolved(questionid, userId) {
  		var loginId = ${sessionScope.loginId};
  		if (loginId == userId) {
  			window.location = "${pageContext.request.contextPath }/question/resolved.do?questionid="+questionid;
  		} else {
  			alert("不能完成他人提交的问题");
  		}
  	}
  </script>
  </body>
</html>
