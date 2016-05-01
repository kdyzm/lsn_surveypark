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
	<style type="text/css">
		table{
			border: 1px solid black;
			border-collapse: collapse;
			width: 80%;
			margin: 0 auto;
			margin-top: 20px;
		}
		table td{
			border: 1px solid black;
			text-align: center;
			padding: 5px;
		}
		input,button {
	width: 70%;
}
	</style>
	<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-default" id="nav">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				   <li class="active"><s:a cssStyle="active" action="IndexAction_toIndexPage.action" namespace="/">首页</s:a></li>
					<li><s:a action="SurveyAction_createNewSurvey.action" namespace="/">新建调查</s:a></li>
					<li><s:a action="SurveyAction_toMySurveyPage.action" namespace="/">我的调查</s:a></li>
					<li><s:a action="EntrySurveyAction_toEntrySurveyPage.action" namespace="/">参与调查</s:a></li>
					<li><s:a action="RegisterAction_toRegisterPage.action" namespace="/">用户注册</s:a></li>
					<li><s:a action="AuthenticationAction_toAuthenticationManagementPage.action" namespace="/">用户授权管理</s:a></li>
					<li><s:a action="RoleAction_toRoleManagementPage.action" namespace="/">角色管理</s:a> </li>
					<li><s:a action="RightAction_toRightManagementPage.action" namespace="/">权限管理</s:a></li>
					<li><s:a action="LogAction_findAllLogs.action" namespace="/">日志管理</s:a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div>
		<s:form action="SurveyAction_editSurvey.action" namespace="/">
			<s:hidden name="surveyId"></s:hidden>
			<table>
				<tr>
					<td colspan="2">编辑调查页面</td>
				</tr>
				<tr>
					<td>调查标题：</td>
					<td><s:textfield name="title"></s:textfield></td>
				</tr>
				<tr>
					<td>"下一步"提示文本：</td>
					<td><s:textfield name="nextText"></s:textfield></td>
				</tr>
				<tr>
					<td>"上一步"提示文本：</td>
					<td><s:textfield name="preText"></s:textfield></td>
				</tr>
				<tr>
					<td>"完成"提示文本：</td>
					<td><s:textfield name="doneText"></s:textfield></td>
				</tr>
				<tr>
					<td>"退出"提示文本：</td>
					<td><s:textfield name="exitText"></s:textfield></td>
				</tr>
				<tr>
					<td><s:submit value="确定"></s:submit></td>
					<td>
						<button>返回</button>
					</td>
				</tr>
			</table>
		</s:form>
	</div>
</body>
</html>