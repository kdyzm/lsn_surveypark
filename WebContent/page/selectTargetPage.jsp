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
		border: 1px solid black;
		width: 80%;
		margin: 0 auto;
		border-collapse: collapse;
	}
	table td{
		border:1px solid black;
		padding:5px;
	}
	.innertable{
		width:100%;
	}
	.surveyTitle{
		background-color: #CCC;
	}
	.sourcePage{
		background-color: gray;
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
	<br/>
	<br/>
	<div style="text-align: center;margin-bottom: 10px;">同一个调查内是移动，不同调查中是复制;灰色背景的部分是源页面</div>
	<table>
		<!-- 遍历所有调查 -->
		<s:iterator value="%{surveys}" var="survey">
			<tr class="surveyTitle">
				<td colspan="2">
					<s:property value="%{#survey.title}"/>
				</td>
			</tr>
			<tr>
				<td></td>
				<td>
					<table class="innertable">
						<s:iterator value="%{pages}" var="page">
							<tr>
								<s:if test="%{#page.pageId==#sourcePage.pageId}">
									<td class="sourcePage">
										<s:property value="%{#page.title}"/>
									</td>
								</s:if>
								<s:else>
									<td>
										<s:property value="%{#page.title}"/>
									</td>
								</s:else>
								<td>
									<s:form action="PageAction_copyOrRemovePage.action" namespace="/">
										<s:hidden name="oldPageId" value="%{#sourcePage.pageId}"></s:hidden>
										<s:hidden name="newPageId" value="%{#page.pageId}"></s:hidden>
										<s:hidden name="newSurveyId" value="%{#survey.surveyId}"></s:hidden>
										<s:radio name="position" list="#{0:'之前',1:'之后'}" value="0"></s:radio>
										<s:submit value="确定"></s:submit>
									</s:form>
								</td>
							</tr>
						</s:iterator>
					</table>
				</td>
			</tr>
			
		</s:iterator>
	</table>
</body>
</html>