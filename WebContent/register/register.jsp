<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/header.css" type="text/css">
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<style type="text/css">
	#content{
		width: 100%;
		height: 100%;
		background-color: #CDC;
		padding-top: 10px;
	}
	table {
		width: 60%;
		border-collapse: collapse;
		margin: 0 auto;
	}
	table td{
		padding: 5px;
		text-align: right;
		padding-left: 10px;
	}
	input {
		width: 80%;
	}
	.error{
		color: red;
	}
	
</style>
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
	<div id="content">
		<s:form action="RegisterAction_register.action" namespace="/">
			<table>
				<tr>
					<td width="30%">电子邮箱</td>
					<td width="70%">
						<s:textfield name="email"></s:textfield>
						<s:fielderror cssClass="error">
							<s:param>email</s:param>
						</s:fielderror>
					</td>
				</tr>
				<tr>
					<td>昵称</td>
					<td>
						<s:textfield name="nickName"></s:textfield>
						<s:fielderror cssClass="error">
							<s:param>nickName</s:param>
						</s:fielderror>
					</td>
				</tr>
				<tr>
					<td>密码</td>
					<td>
						<s:password name="password"></s:password>
						<s:fielderror cssClass="error">
							<s:param>password</s:param>
						</s:fielderror>
					</td>
				</tr>
				<tr>
					<td>请再次输入密码</td>
					<td>
						<s:password name="repeatPassword"></s:password>
						<s:fielderror cssClass="error">
							<s:param>repeatPassword</s:param>
						</s:fielderror>
					</td>
				</tr>
				<tr>
					<td colspan="2">
						<s:submit name="register" value="注册"></s:submit>
					</td>
				</tr>
			</table>
		</s:form>
	</div>
</body>
</html>