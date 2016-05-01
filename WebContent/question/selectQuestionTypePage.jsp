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
	table{
		width: 50%;
		margin: 0 auto;
		margin-top: 20px;
	}
	select {
		width: 100%;
		font-size: 17px;
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
	<div>
		<table>
			<tr>
				<td width="30%">请选择一种题型</td>
				<td width="70%">
					<s:form action="QuestionAction_toDesignQuestionPage.action" namespace="/">
						<s:hidden name="pageId"></s:hidden>
						<s:hidden name="surveyId"></s:hidden>
						<select name="questionType" onchange="javascript:this.form.submit();">
							<option value="-1">-----请选择一种题型-----</option>
							<option value="0">非矩阵式横向单选按钮</option>
							<option value="1">非矩阵式纵向单选按钮</option>
							<option value="2">非矩阵式横向复选按钮</option>
							<option value="3">非矩阵式纵向复选按钮</option>
							
							<option value="4">非矩阵式下拉列表</option>
							
							<option value="5">非矩阵式文本框</option>
							
							<option value="6">矩阵式单选按钮</option>
							<option value="7">矩阵式复选按钮</option>
							
							<option value="8">矩阵式下拉列表</option>
						</select>
					</s:form>
				</td>
			</tr>
		</table>
	</div>	
</body>
</html>