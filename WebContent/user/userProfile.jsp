<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/header.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/js/jquery-1.4.1.js"></script>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css"
	rel="stylesheet">
<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<style type="text/css">
#content {
	width: 100%;
	height: 100%;
	padding-top: 10px;
}

table {
	width: 60%;
	border-collapse: collapse;
	margin: 0 auto;
}

table td {
	padding: 5px;
	text-align: right;
	padding-left: 10px;
}

input {
	width: 80%;
}

.error {
	color: red;
}
</style>
</head>
<body>
	<nav class="navbar navbar-default" id="nav">
	<div class="container-fluid">
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><s:a cssStyle="active"
						action="IndexAction_toIndexPage.action" namespace="/">首页</s:a></li>
				<li><s:a action="SurveyAction_createNewSurvey.action"
						namespace="/">新建调查</s:a></li>
				<li><s:a action="SurveyAction_toMySurveyPage.action"
						namespace="/">我的调查</s:a></li>
				<li><s:a action="EntrySurveyAction_toEntrySurveyPage.action"
						namespace="/">参与调查</s:a></li>
				<li><s:a action="RegisterAction_toRegisterPage.action"
						namespace="/">用户注册</s:a></li>
				<li class="active"><s:a
						action="AuthenticationAction_toAuthenticationManagementPage.action"
						namespace="/">用户授权管理</s:a></li>
				<li><s:a action="RoleAction_toRoleManagementPage.action"
						namespace="/">角色管理</s:a></li>
				<li><s:a action="RightAction_toRightManagementPage.action"
						namespace="/">权限管理</s:a></li>
				<li><s:a action="LogAction_findAllLogs.action" namespace="/">日志管理</s:a></li>
			</ul>
		</div>
	</div>
	</nav>
	<br/>
	<br/>
	<div class="container">
		<s:form cssClass="form-horizontal" role="form" cssStyle="width:50%;margin:0 auto;" action="UserAction_doUpdateUserProfile.action" namespace="/">
			<s:hidden name="userId"></s:hidden>
			<!-- 修改昵称 -->
			<div class="form-group">
				<label for="nickName" class="col-sm-2 control-label">昵称</label>
				<div class="col-sm-10">
					<input name="nickName" type="text" class="form-control"
						value='<s:property value="nickName"/>' required autofocus>
				</div>
			</div>
			<!-- 修改密码 -->
			<div class="form-group">
				<label for="password" class="col-sm-2 control-label">密码</label>
				<div class="col-sm-10">
					<input name="password" type="password" class="form-control"
						 required autofocus>
				</div>
			</div>
			
			<!-- 重复密码 -->
			<div class="form-group">
				<label for="repeatPassword" class="col-sm-2 control-label">重复输入密码</label>
				<div class="col-sm-10">
					<input name="repeatPassword" type="password" class="form-control"
					 required autofocus>
				</div>
			</div>
			
			<!-- 修改邮箱 -->
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">邮箱</label>
				<div class="col-sm-10">
					<input name="repeatPassword" type="email" class="form-control"
					 value='<s:property value="email"/>'required autofocus>
				</div>
			</div>
			
			<s:submit cssClass="btn btn-lg btn-primary btn-block" value="提交"></s:submit>
			
			<%-- <table>
				<tr>
					<td>昵称</td>
					<td><s:textfield name="nickName"></s:textfield></td>
				</tr>
				<tr>
					<td>密码</td>
					<td><s:textfield name="password"></s:textfield></td>
				</tr>
				<tr>
					<td>重复密码</td>
					<td><s:textfield name="repeatPassword"></s:textfield></td>
				</tr>
				<tr>
					<td>邮箱</td>
					<td><s:textfield name="email"></s:textfield></td>
				</tr>
				<tr>
					<td colspan="2"><s:submit value="提交"></s:submit></td>
				</tr>
			</table> --%>
		</s:form>
	</div>
</body>
</html>