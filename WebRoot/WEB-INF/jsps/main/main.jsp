<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
    <title>信息系统运维管理网上平台</title>  
    <link rel="stylesheet" href="<%=basePath%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>/css/admin.css">
    <script src="<%=basePath%>/js/jquery.js"></script>   

  </head>
  
  <body style="background-color:#f2f9fd;">
	<div class="header bg-main">
	  <div class="logo margin-big-left fadein-top">
	    <h1><img src="images/logo.jpg" class="radius-circle rotate-hover" height="50" alt="" />信息系统运维管理网上平台</h1>
	  </div>
	  <div class="head-l">
	  	<a class="button button-little bg-red" href="${pageContext.request.contextPath }/user/index.do">
	  		<span class="icon-power-off"></span> 退出登录
	  	</a> 
	  </div>
	</div>
	<div class="leftnav">
	  <div class="leftnav-title"><strong><span class="icon-list"></span>菜单列表</strong></div>
	  <h2><span class="icon-user"></span>在线服务</h2>
	  <ul style="display:block">
	  	<%-- 
	    <li><a href="info.html" target="right"><span class="icon-caret-right"></span>网站设置</a></li>
	    <li><a href="pass.html" target="right"><span class="icon-caret-right"></span>修改密码</a></li>
	    <li><a href="page.html" target="right"><span class="icon-caret-right"></span>单页管理</a></li>
	    <li><a href="column.html" target="right"><span class="icon-caret-right"></span>栏目管理</a></li>
	     --%> 
	    <li><a href="${pageContext.request.contextPath }/question/toAdd.do?userid=${user.userId}" target="right"><span class="icon-caret-right"></span>提交问题</a></li>
	    <li>
	    	<a id="sp1" target="right">
	    		<span class="icon-caret-right"></span>问题管理
	    		<ul style="display:block;padding-left: 30px;border-top: none;">
		    		<li><a href="${pageContext.request.contextPath }/question/list.do?code=330901" target="right"><span class="icon-caret-right"></span>政治部</a></li>
		    		<li><a href="${pageContext.request.contextPath }/question/list.do?code=330902" target="right"><span class="icon-caret-right"></span>治安支队</a></li>
	    			<li><a href="${pageContext.request.contextPath }/question/list.do?code=330903" target="right"><span class="icon-caret-right"></span>指挥中心</a></li>
	    			<li><a href="${pageContext.request.contextPath }/question/list.do?code=330904" target="right"><span class="icon-caret-right"></span>刑侦支队</a></li>
	    			<li><a href="${pageContext.request.contextPath }/question/list.do?code=330905" target="right"><span class="icon-caret-right"></span>情报中心</a></li>
	    			<li><a href="${pageContext.request.contextPath }/question/list.do?code=330906" target="right"><span class="icon-caret-right"></span>科信处</a></li>
	    			<li><a href="${pageContext.request.contextPath }/question/list.do?code=330907" target="right"><span class="icon-caret-right"></span>禁毒支队</a></li>
	    			<li><a href="${pageContext.request.contextPath }/question/list.do?code=330908" target="right"><span class="icon-caret-right"></span>合成作战中心</a></li>
	    			<li><a href="${pageContext.request.contextPath }/question/list.do?code=330909" target="right"><span class="icon-caret-right"></span>法制支队</a></li>
	    			<li><a href="${pageContext.request.contextPath }/question/list.do?code=330910" target="right"><span class="icon-caret-right"></span>出入境管理局</a></li>
	    			<li><a href="${pageContext.request.contextPath }/question/list.do?code=330911" target="right"><span class="icon-caret-right"></span>反恐中心</a></li>
	    		</ul>
	    	</a>
	    </li>
	    <%-- <li><a href="${pageContext.request.contextPath }/question/list.do" target="right"><span class="icon-caret-right"></span>未处理问题</a></li>--%>
	    <%-- <li><a href="${pageContext.request.contextPath }/question/resolvedList.do?" target="right"><span class="icon-caret-right"></span>已处理问题</a></li>  --%>    
	    
	  </ul>
	  <%--   
	  <h2><span class="icon-pencil-square-o"></span>栏目管理</h2>
	  <ul>
	    <li><a href="list.html" target="right"><span class="icon-caret-right"></span>内容管理</a></li>
	    <li><a href="add.html" target="right"><span class="icon-caret-right"></span>添加内容</a></li>
	    <li><a href="cate.html" target="right"><span class="icon-caret-right"></span>分类管理</a></li>        
	  </ul>
	  --%>   
	</div>
	<script type="text/javascript">
	$(function(){
	  $(".leftnav h2").click(function(){
		  $(this).next().slideToggle(200);	
		  $(this).toggleClass("on"); 
	  })
	  $(".leftnav ul li a").click(function(){
		    $("#a_leader_txt").text($(this).text());
	  		$(".leftnav ul li a").removeClass("on");
			$(this).addClass("on");
	  })
	});
	
	$(function(){
	  $("#sp1").click(function(){
		  $(this).next().slideToggle(200);	
		  $(this).toggleClass("on"); 
	  })
	  $("#sp1 ul li a").click(function(){
		    $("#a_leader_txt").text($(this).text());
	  		$("#sp1 ul li a").removeClass("on");
			$(this).addClass("on");
	  })
	});
	</script>
	<ul class="bread">
	  <li><span href="" target="right" class="icon-home"> 首页</span></li>
	  <li><a href="##" id="a_leader_txt">欢迎使用</a></li>
	  <li><b>当前用户：</b><span>${user.userName }</php></span></li>
	</ul>
	<div class="admin">
	  <iframe scrolling="auto" rameborder="0" src="${pageContext.request.contextPath }/question/welcome.do" name="right" width="100%" height="100%"></iframe>
	</div>
	<div style="text-align:center;">
	<p>来源:<a href="http://www.mycodes.net/" target="_blank">源码之家</a></p>
	</div>
  </body>
</html>
