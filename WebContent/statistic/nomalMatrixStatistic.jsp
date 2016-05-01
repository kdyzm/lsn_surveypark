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
	table{
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
		<div style="height: 50px;line-height: 50px;width: 100%;background-color: #CCC;padding-left: 30px;font-weight: bold;">矩阵式类型的问题调查结果统计</div>
		<table>
			<tr>
				<td colspan='<s:property value="%{osms.size+1}"/>'>
					&nbsp;&nbsp;<s:property value="%{question.title}"/>
				</td>
			</tr>
			<!-- 首先遍历表头 -->
			<tr>
				<td>&nbsp;</td>
				<s:iterator value="%{question.matrixColTitleArr}">
					<td align="center">
						<s:property/>
					</td>
				</s:iterator>
			</tr>
			<s:iterator value="%{question.matrixRowTitleArr}" var="row" status="rst">
				<tr>
					<td align="center">
						<s:property/>
					</td>
					<s:iterator value="%{question.matrixColTitleArr}" var="col" status="cst">
						<td align="center">
							<s:property value="getPercent(#rst.index,#cst.index)"/>
						</td>
					</s:iterator>
				</tr>
			</s:iterator>
			<tr>
				<td colspan='<s:property value="%{osms.size+1}"/>'>
					&nbsp;&nbsp;&nbsp;一共有&nbsp;<s:property value="%{count}"/>&nbsp;人参与了问卷！
				</td>
			</tr>
		</table>
	</div>
</body>
</html>