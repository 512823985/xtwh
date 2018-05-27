<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<base href="<%=basePath%>">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    <title>显示问题列表</title>  
    <link rel="stylesheet" href="<%=basePath%>/css/pintuer.css">
    <link rel="stylesheet" href="<%=basePath%>/css/admin.css">
    <script src="<%=basePath%>/js/jquery.js"></script>
    <script src="<%=basePath%>/js/pintuer.js"></script> 
</head>
<form method="post" action="">
  <div class="panel admin-panel">
    <div class="panel-head"><strong class="icon-reorder"> 问题管理</strong></div>
    <div class="padding border-bottom">
      <ul class="search" style="padding-left:10px;">
        <li>
          <input type="text" id="keywords" placeholder="请输入搜索关键字" name="keywords" class="input" style="width:250px; line-height:17px;display:inline-block" />
          <a href="javascript:void(0)" class="button border-main icon-search" onclick="changesearch()" > 搜索</a></li>
      </ul>
    </div>
    <table class="table table-hover text-center">
      <tr>
      	<th>序号</th>
        <th>姓名</th>       
        <th>电话</th>
        <th>IP地址</th>
        <th>所属类别</th>
        <th width="25%">标题</th>
         <th width="150">提交时间</th>
        <th>操作</th>       
      </tr>
      	<c:forEach items="${pageInfo.list }" var="question" varStatus="status">    
	        <tr>
	          <td>${status.index+1 }</td>
	          <td>${question.user.userName }</td>
	          <td>${question.user.userPhone }</td>
	          <td>${question.ip }</td>
	          <td>${question.category }</td>  
	          <td>${question.title }</td>
	          <td><fmt:formatDate value="${question.time }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
	          <td>
	          	<div class="button-group">
	          		<button type="button" class="button border-green" id="checkall" onclick="view(${question.id});"><span class="icon-check"></span> 查看</button>
	      			<%-- <a type="button" onclick="checkUser(${question.id}, ${question.user.userId },${question.replyed });" class="button border-main"><span class="icon-edit"></span>修改</a>
	       			<a class="button border-red" href="javascript:void(0)" onclick="return del(${question.id}, ${question.user.userId }, ${question.replyed })"><span class="icon-trash-o"></span> 删除</a> --%>
	      		</div>
	          </td>
	        </tr>
        </c:forEach>  
      <tr>
        <td colspan="8">
        	<div class="pagelist"> 
        		<c:if test="${pageInfo.hasPreviousPage }">
	        		<a href="${pageContext.request.contextPath }/question/search.do?page=${pageInfo.pageNum-1}&keywords=${keywords}&code=${code}">上一页</a> 
        		</c:if>
        		
        		<c:forEach var="idx" items="${pageInfo.navigatepageNums }">
        			<c:choose>
		        		<c:when test="${idx==pageInfo.pageNum }">
		        			<span class="current">${idx }</span>
		        		</c:when>
		        		<c:otherwise>
		        			<a href="${pageContext.request.contextPath }/question/search.do?page=${idx}&keywords=${keywords}&code=${code}">${idx }</a>
		        		</c:otherwise>
	        		</c:choose>
        		</c:forEach>
        		
        		<c:if test="${pageInfo.hasNextPage }">
        			<a href="${pageContext.request.contextPath }/question/search.do?page=${pageInfo.pageNum+1}&keywords=${keywords}&code=${code}">下一页</a>
        		</c:if>
        	</div>
        </td>
      </tr>
    </table>
  </div>
</form>
<script type="text/javascript">

function changesearch(){	
	window.location="${pageContext.request.contextPath}/question/search.do?keywords="+$("#keywords").val()+"&code=${code}";
}

function view(id) {
	window.location="${pageContext.request.contextPath}/question/view.do?id="+id;
}

function checkUser(id, userId,replyed) {
	var loginId = ${sessionScope.loginId};
	if (loginId == userId && replyed == "0") {
		window.location="${pageContext.request.contextPath }/question/toEdit.do?id="+id;
	} else {
		alert("不能修改他人提交的,或者已有回复的问题");
	}
}

function del(id, userId, replyed){
	var loginId = ${sessionScope.loginId};
	if (loginId == userId && replyed == "0") {
		if(confirm("您确定要删除吗?")){
			$.ajax({
				type:"post",
				url:"${pageContext.request.contextPath}/question/del.do",
				data:"id="+id,
				success:function(msg) {
					alert(msg);
					window.location="${pageContext.request.contextPath}/question/list.do";
				}
			});
		}
	} else {
		alert("不能删除他人提交的，或者已有回复的问题");
	}
}

$("#checkall").click(function(){ 
  $("input[name='id[]']").each(function(){
	  if (this.checked) {
		  this.checked = false;
	  }
	  else {
		  this.checked = true;
	  }
  });
})

function DelSelect(){
	var Checkbox=false;
	 $("input[name='id[]']").each(function(){
	  if (this.checked==true) {		
		Checkbox=true;	
	  }
	});
	if (Checkbox){
		var t=confirm("您确认要删除选中的内容吗？");
		if (t==false) return false; 		
	}
	else{
		alert("请选择您要删除的内容!");
		return false;
	}
}

</script>
</body>
</html>