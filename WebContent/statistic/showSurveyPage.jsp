<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/header.css" type="text/css">
<title>Insert title here</title>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<style type="text/css">
	*{
		margin: 0px;
		padding: 0px;
	}
	table {
		border: 1px solid black;
		border-collapse: collapse;
		width: 100%;
		margin: 0 auto;
	}	
	table td{
		border: 1px solid black;
		padding: 5px;
	}
	.title{
		width: 100%;
		background-color: #CCC;
		margin-bottom: 10px;
		text-align: left;
		padding-left: 20px;
		line-height: 30px;
	}
	.surveyTitle{
		width: 100%;
		background-color: gray;
		margin-bottom: 10px;
		text-align: left;
		padding-left: 20px;
		line-height: 30px;		
	}
	.pageTitle{
		width: 100%;
		background-color: gray;
		text-align: left;
		padding-left: 20px;
		line-height: 30px;	
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
		<div class="title">分析调查</div>
		<div class="surveyTitle"><s:property value="%{#survey.title}"/></div>
		<s:iterator value="%{#survey.pages}" var="page">
			<div class="page">
				<div class="pageTitle">
					<s:property value="%{#page.title}"/>
				</div>
				<div class="pageRight">
					<table>
						<s:iterator value="%{#page.questions}" var="question" status="qst">
							<tr>
								<s:if test="#qst.index==0">
									<td width="15px" rowspan='<s:property value="%{#page.questions.size()}"/>'></td>
								</s:if>
								<td align="left">
									<s:property value="#qst.count+'.'+#question.title"/>
									<div style="display:inline-block;float: right;margin-right: 10px;width: 30%;">
										<s:if test="#question.questionType==5">
											不可统计
										</s:if>
										<s:elseif test="#question.questionType>=6">
											<s:form action="StatisticAction_statisticMatrix.action" namespace="/">
												<s:hidden name="questionId">
													<s:property value="%{#question.questionId}"/>
												</s:hidden>
												<s:submit value="查看矩阵式统计图"/>
											</s:form>
										</s:elseif>
										<s:else>
											<s:form action="StatisticAction_statistic.action" namespace="/">
												<s:hidden name="questionId">
													<s:property value="%{#question.questionId}"/>
												</s:hidden>
												<s:select name="statisticType" cssStyle="width:150px;border:1px solid gray;text-align:center;" list="#{0:'平面饼图',1:'立体饼图',2:'横向平面柱状图',3:'纵向平面柱状图',4:'横向立体柱状图',5:'纵向立体柱状图',6:'平面折线图',7:'立体折线图'}"></s:select>
												<s:submit value="查看统计图"/>
											</s:form>
										</s:else>
									</div>
								</td>
							</tr>
						</s:iterator>
					</table>
				</div>
			</div>
		</s:iterator>
	</div>
</body>
</html>