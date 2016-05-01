<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
	<title>Insert title here</title>
	<style type="text/css">
		table {
				margin:0 auto;
				margin-top:20px;
				width: 50%; 
				border: 1px solid black;
				border-collapse: collapse;
			}
		table td{
			padding: 5px;
			text-align: center;
			border:1px solid black;
		}
		input {
			width: 70%;
		}
		#nav{
			width:90%;
			margin:0 auto;
		}
	</style>
	<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
</head>
<body>
<!-- 这里将首页和登陆界面合并成一个页面了 -->
	<%-- <ul class=" navbar nav nav-pills">
	   <li class="active"><s:a cssStyle="active" action="IndexAction_toIndexPage.action" namespace="/">首页</s:a></li>
		<li><s:a action="SurveyAction_createNewSurvey.action" namespace="/">新建调查</s:a></li>
		<li><s:a action="SurveyAction_toMySurveyPage.action" namespace="/">我的调查</s:a></li>
		<li><s:a action="EntrySurveyAction_toEntrySurveyPage.action" namespace="/">参与调查</s:a></li>
		<li><s:a action="RegisterAction_toRegisterPage.action" namespace="/">用户注册</s:a></li>
		<li><s:a action="AuthenticationAction_toAuthenticationManagementPage.action" namespace="/">用户授权管理</s:a></li>
		<li><s:a action="RoleAction_toRoleManagementPage.action" namespace="/">角色管理</s:a> </li>
		<li><s:a action="RightAction_toRightManagementPage.action" namespace="/">权限管理</s:a></li>
		<li><s:a action="LogAction_findAllLogs.action" namespace="/">日志管理</s:a></li>
	</ul> --%>
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
	<s:if test="%{#session.user != null}">
		<div>
			欢迎你,<s:property value="%{#session.user.nickName}"/>
		</div>
	</s:if>
	<s:else>
		<div id="content">
			<div style="text-align: center;"><s:actionerror/></div>
			<s:form namespace="/" action="LoginAction_chekEmailAndPassword.action">
				<table>
					<thead>
						<tr>
							<td colspan="2">用户登陆界面</td>
							<s:fielderror>
							</s:fielderror>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td>Email</td>
							<td>
								<s:textfield name="email" value="1234567@qq.com"></s:textfield>
							</td>
						</tr>
						<tr>
							<td>密码</td>
							<td>
								<s:textfield name="password" value="kdyzm"></s:textfield>
							</td>
						</tr>
						<tr>
							<td>
								<s:submit value="登陆"></s:submit>
							</td>
							<td>
								<s:reset value="重置"></s:reset>
							</td>
						</tr>
					</tbody>
				</table>
			</s:form>
		</div>
	</s:else>
</body>
</html>