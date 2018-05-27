<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>注册页面</title>
    
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<link rel="stylesheet" href="<%=basePath%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>/css/admin.css">
    <script src="<%=basePath%>/js/jquery.js"></script>
    <script src="<%=basePath%>/js/pintuer.js"></script> 
  </head>
  
  <body>
    <div class="panel admin-panel">
	  <div class="panel-head"><strong><span class="icon-key"></span> 注册账号</strong></div>
	  <div class="body-content">
	    <form method="post" class="form-x" action="${pageContext.request.contextPath }/user/register.do">
	      <div class="form-group">
	        <div class="label">
	          <label for="sitename">姓名：</label>
	        </div>
	        <div class="field">
	          <input type="text" class="input w50" id="userName" name="userName" size="50" placeholder="请输入姓名" data-validate="required:请输入姓名" />       
	        </div>
	      </div>       
	      <div class="form-group">
	        <div class="label">
	          <label for="sitename">密码：</label>
	        </div>
	        <div class="field">
	          <input type="password" class="input w50" id="userPwd" name="userPwd" size="50" placeholder="请输入密码" data-validate="required:请输入密码" />       
	        </div>
	      </div>      
	      <div class="form-group">
	        <div class="label">
	          <label for="sitename">手机号码：</label>
	        </div>
	        <div class="field">
	          <input type="text" class="input w50" id="userPhone" name="userPhone" size="50" placeholder="请输入手机号码" data-validate="required:请输入手机号码" />         
	        </div>
	      </div>
	      
	      <div class="form-group">
	        <div class="label">
	          <label></label>
	        </div>
	        <div class="field">
	          <button class="button bg-main icon-check-square-o" type="submit"> 提交</button>   
	        </div>
	      </div>      
	    </form>
	  </div>
	</div>
  </body>
</html>
