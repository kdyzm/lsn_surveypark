<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/header.css"
	type="text/css">
	<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>Insert title here</title>
<style type="text/css">
	table {
		border: 1px solid black;
		border-collapse: collapse;
		width: 80%;
		margin: 0 auto;
		margin-top: 20px;
	}
	table td{
		border: 1px solid black;
		padding: 5px;
	}
	input,button,select,textarea{
		width: 80%;
	}
	.radio{
		width:20px;
	}
</style>
</head>
<!-- 针对0/1/2/3种类型的题型 -->
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
		<s:form action="QuestionAction_saveQuestion.action" namespace="/">
			<s:hidden name="questionId"></s:hidden>
			<s:hidden name="questionType"></s:hidden>
			<s:hidden name="pageId"></s:hidden>
			<s:hidden name="surveyId"></s:hidden>
			<table>
				<tr>
					<td colspan="2">非矩阵型问题设计</td>
				</tr>
				<tr>
					<td>问题标题</td>
					<td>
						<s:textfield name="title"></s:textfield>
					</td>
				</tr>
				<tr>
					<td>问题选项</td>
					<td>
						<s:textarea name="optionText">
							
						</s:textarea>
					</td>
				</tr>
				<tr>
					<td>是否含有“其它”选项</td>
					<td>
						<s:checkbox name="other"></s:checkbox>
					</td>
				</tr>
				<tr>
					<td>“其它”项类型</td>
					<td>
						<input class="radio" type="radio" name="otherType" value="0">无
						<input class="radio" type="radio" name="otherType" value="1">文本框
						<input class="radio" type="radio" name="otherType" value="2">下拉列表框
					</td>
				</tr>
				<tr>
					<td>“其它”项下拉列表选项</td>
					<td>
						<s:textarea name="otherSelectOptions"></s:textarea>
					</td>
				</tr>
				<tr>
					<td>
						<s:submit value="确定"></s:submit>
					</td>
					<td>
						<button onclick="javascript:window.history.go(-1);">返回</button>
					</td>
				</tr>
			</table>		
		</s:form>
	</div>
</body>
</html>