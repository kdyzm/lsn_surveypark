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
		width: 89%;
		border: 1px solid balck;
		border-collapse: collapse;
		margin: 0 auto;
		margin-top: 20px;
	}
	table td{
		border:1px solid black;
		padding: 5px;
		text-align: right;
	}
</style>
</head>
<!-- 进行权限管理的界面 -->
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
	<div style="background-color:#CCC;height:30px;width: 100%;line-height: 30px;font-size: 15px;text-align: left;padding-left: 20px;">
		角色管理的界面
		<div style="width: 100px;float: right;margin-right: 20px;">
			<s:a action="RoleAction_toSaveOrUpdateRolePage.action" namespace="/">
				添加角色
			</s:a>
		</div>
	</div>
	<div>
		<table>
			<tr>	
				<td>序号</td>
				<td>ID</td>
				<td>角色名称</td>
				<td>修改</td>
				<td>删除</td>
			</tr>
			<s:iterator value="%{#roleList}" var="role" status="st">
				<tr>
					<td><s:property value="#st.count"/></td>
					<td><s:property value="#role.roleId"/></td>
					<td><s:property value="#role.roleName"/></td>
					<td>
						<s:a action="RoleAction_toSaveOrUpdateRolePage.action" namespace="/">
							<s:param name="roleId" value="%{#role.roleId}"></s:param>
							修改
						</s:a>
					</td>
					<td>
						<s:a action="RoleAction_deleteRole.action" namespace="/">
							<s:param name="roleId" value="%{#role.roleId}"></s:param>
							删除
						</s:a>
					</td>
				</tr>
			</s:iterator>
		</table>
	</div>
</body>
</html>