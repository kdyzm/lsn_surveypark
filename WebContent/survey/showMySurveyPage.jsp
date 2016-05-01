<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/header.css" type="text/css">
<style type="text/css">
	table{
		border: 1px solid black;
		border-collapse: collapse;
		width: 95%;
		text-align: center;
		margin:5px auto;		
	}
	table td{
		border: 1px solid black;
		padding: 5px;
	}
	a{
		color:blue;
		text-decoration: none;
	}
	#nav{
			width:90%;
			margin:0 auto;
		}
</style>
	<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body>
	<nav class="navbar navbar-default" id="nav">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				   	<li><s:a cssStyle="active" action="IndexAction_toIndexPage.action" namespace="/">首页</s:a></li>
					<li><s:a action="SurveyAction_createNewSurvey.action" namespace="/">新建调查</s:a></li>
					<li class="active"><s:a action="SurveyAction_toMySurveyPage.action" namespace="/">我的调查</s:a></li>
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
		<thead>
			<tr>
				<td>ID</td>
				<td>调查标题</td>
				<td>创建时间</td>
				<td>状态</td>
				<td>设计</td>
				<td>收集信息</td>
				<td>分析</td>
				<td>打开/关闭</td>
				<td>清除调查</td>
				<td>删除</td>
			</tr>
		</thead>
		<tbody>
			<s:iterator value="%{#surveys}">
				<tr>
					<td>
						<s:property value="surveyId"/>
					</td>
					<td>
						<s:property value="title"/>
					</td>
					<td>
						<s:date name="createDate" format="yyyy/MM/dd HH:mm:ss"/>
					</td>
					<td>
						<s:if test="%{closed}">
							打开
						</s:if>
						<s:else>
							关闭
						</s:else>
					</td>
					<td>
						<s:a action="SurveyAction_designSurveyPage.action" namespace="/">
							<s:param name="surveyId" value="%{surveyId}"></s:param>
						设计</s:a>
					</td>
					<td>
						<s:a action="SurveyAction_collectionInforForOneSurvey.action" namespace="/">
							<s:param name="surveyId" value="%{surveyId}"></s:param>
							收集信息
						</s:a>
					</td>
					<td>
						<s:a action="StatisticAction_toShowSurveyPage.action" namespace="/">
							<s:param name="surveyId" value="%{surveyId}"></s:param>
							分析
						</s:a>
					</td>
					<td>
						<s:a action="SurveyAction_openOrCloseSurvey.action" namespace="/">
							<s:param name="surveyId" value="%{surveyId}"></s:param>
							打开/关闭
						</s:a>
					</td>
					<td>
					<s:a action="SurveyAction_clearSurvey.action" namespace="/">
						<s:param name="surveyId" value="%{surveyId}"></s:param>
					清除调查</s:a>
					</td>
					<td>
					<s:a action="SurveyAction_deleteSurvey.action" namespace="/">
						<s:param name="surveyId" value="%{surveyId}"></s:param>
						删除
					</s:a>
					</td>
				</tr>
			</s:iterator>
		</tbody>
	</table>
	</div>
</body>
</html>