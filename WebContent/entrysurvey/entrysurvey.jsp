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
	<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<style type="text/css">
.survey {
	display: inline-block;
	width: 150px;
	text-align: center;
	margin: 20px;
}

#nav {
	width: 90%;
	margin: 0 auto;
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
				<li class="active"><s:a action="EntrySurveyAction_toEntrySurveyPage.action"
						namespace="/">参与调查</s:a></li>
				<li><s:a action="RegisterAction_toRegisterPage.action"
						namespace="/">用户注册</s:a></li>
				<li><s:a
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
	<div style="width: 80%; margin: 0 auto; margin-top: 30px;">
		<s:iterator value="%{#surveys}" var="survey">
			<s:a cssClass="survey" action="EntrySurveyAction_toSurveyPage.action"
				namespace="/">
				<s:param name="surveyId" value="#survey.surveyId"></s:param>
				<img width="200px" alt="<s:property value='%{#survey.title}'/>"
					src='<s:property value="getLogoPath(#survey.logoPath)"/>' />
				<br />
				<s:property value="#survey.title" />
			</s:a>
		</s:iterator>
	</div>
</body>
</html>