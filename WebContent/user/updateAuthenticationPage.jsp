<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.servletContext.contextPath}/css/header.css" type="text/css">
<script type="text/javascript" src="${pageContext.servletContext.contextPath}/js/jquery-1.4.1.js"></script>
<link href="http://libs.baidu.com/bootstrap/3.0.3/css/bootstrap.min.css" rel="stylesheet">
   	<script src="http://libs.baidu.com/jquery/2.0.0/jquery.min.js"></script>
   	<script src="http://libs.baidu.com/bootstrap/3.0.3/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$().ready(function(){
		$("button[id='toRight']").unbind("click");
		$("button[id='toRight']").bind("click",function(){
			var noneownRoles=$("select[name='noneownRoles']");
			var ownRoles=$("select[name='ownRoles']");
			$("select[name='ownRoles'] option:selected").each(function(){
				noneownRoles.prepend($(this).clone());
				$(this).remove();
			});
			return false;
		});
		$("button[id='toLeft']").unbind("click");
		$("button[id='toLeft']").bind("click",function(){
			var noneownRoles=$("select[name='noneownRoles']");
			var ownRoles=$("select[name='ownRoles']");
			$("select[name='noneownRoles'] option:selected").each(function(){
				ownRoles.prepend($(this).clone());
				$(this).remove();
			});
			return false;
		});
		$("button[id='allToRight']").unbind("click");
		$("button[id='allToRight']").bind("click",function(){
			var noneownRoles=$("select[name='noneownRoles']");
			var ownRoles=$("select[name='ownRoles']");
			$("select[name='ownRoles'] option").each(function(){
				noneownRoles.append($(this).clone());
				$(this).remove();
			});
			return false;
		});
		$("button[id='allToLeft']").unbind("click");
		$("button[id='allToLeft']").bind("click",function(){
			var noneownRoles=$("select[name='noneownRoles']");
			var ownRoles=$("select[name='ownRoles']");
			$("select[name='noneownRoles'] option").each(function(){
				ownRoles.append($(this).clone());
				$(this).remove();
			});
			return false;
		});
		$("#submit").unbind("click");
		$("#submit").bind("click",function(){
			$("select[name='ownRoles'] option").each(function(){
				$(this).attr("selected","selected");
			});
			return true;
		});
	});
</script>
<style type="text/css">
	table{
		border: 1px solid black;
		width: 90%;
		margin: 0 auto;
		margin-top: 20px;
		border-collapse: collapse;
	}
	table td{
		border: 1px solid black;
		padding: 5px;
		text-align: center;
	}
	input[type="text"]{
		border: 1px solid gray;
		width: 99%;
	}
	textarea {
		border: 1px solid gray;
		width: 99%;
		margin: 0 auto;
		height:150px;
		margin-top: 5px;
		margin-bottom: 5px;
	}
	input[type="submit"]{
		border:1px solid gray;
		width: 100px;
	}
	input[type="reset"]{
		border:1px solid gray;
		width: 100px;
	}
	button{
		width: 150px;
		height: 30px;
		text-align: center;
		line-height: 20px;
		font-size: 12px;
		margin-bottom: 5px;
	}
	select {
		height: 300px;
		width: 150px;
		text-align: center;
	}
</style>
</head>
<body>
	<nav class="navbar navbar-default" id="nav">
		<div class="container-fluid">
			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
				   <li><s:a cssStyle="active" action="IndexAction_toIndexPage.action" namespace="/">首页</s:a></li>
					<li><s:a action="SurveyAction_createNewSurvey.action" namespace="/">新建调查</s:a></li>
					<li><s:a action="SurveyAction_toMySurveyPage.action" namespace="/">我的调查</s:a></li>
					<li><s:a action="EntrySurveyAction_toEntrySurveyPage.action" namespace="/">参与调查</s:a></li>
					<li><s:a action="RegisterAction_toRegisterPage.action" namespace="/">用户注册</s:a></li>
					<li  class="active"><s:a action="AuthenticationAction_toAuthenticationManagementPage.action" namespace="/">用户授权管理</s:a></li>
					<li><s:a action="RoleAction_toRoleManagementPage.action" namespace="/">角色管理</s:a> </li>
					<li><s:a action="RightAction_toRightManagementPage.action" namespace="/">权限管理</s:a></li>
					<li><s:a action="LogAction_findAllLogs.action" namespace="/">日志管理</s:a></li>
				</ul>
			</div>
		</div>
	</nav>
	<br/>
	<!-- 替换bootstrap表单 -->
	<div class="container">
		<s:form cssClass="form-horizontal" cssStyle="width:80%;margin:0 auto;" role="form"
			action="AuthenticationAction_saveOrUpdateAuthentication.action"
			namespace="/">
			<s:hidden name="userId"></s:hidden>
			<div class="form-group">
				<label for="email" class="col-sm-2 control-label">电子邮箱</label>
				<div class="col-sm-10">
					<s:textfield cssClass="form-control" name="email"></s:textfield>
				</div>
			</div>
			<div class="form-group">
				<label for="nickName" class="col-sm-2 control-label">昵称</label>
				<div class="col-sm-10">
					<s:textfield cssClass="form-control" name="nickName"></s:textfield>
				</div>
			</div>
			<table style="border:0px solid;margin:0 auto;">
				<tr>
					<td style="border:0px;float:right;">
						<s:select cssStyle="width:300px;" cssClass="form-control" list="%{roles}" name="ownRoles" multiple="true" size="20" listKey="roleId" listValue="roleName"></s:select>
					</td>
					<td style="border: 0px;text-align: center;">
							<button id="toRight">&gt;</button><br/>
							<button id="toLeft">&lt;</button><br/>
							<button id="allToRight">&gt;&gt;</button><br/>
							<button id="allToLeft">&lt;&lt;</button>
					</td>
					<td  style="border: 0px;">
						<s:select cssStyle="width:300px;" cssClass="form-control" list="%{#noneOwnRoles}" name="noneownRoles" multiple="true" size="20" listKey="roleId" listValue="roleName"></s:select>
					</td>
				</tr>
			</table>
			<br/>
			<br/>
			<div class="form-group" style="width:200px;margin:0 auto;">
				<div class="col-sm-10">
					<s:submit cssStyle="margin:0 auto;" cssClass="btn btn-primary" value="确认" id="submit"></s:submit>
				</div>
			</div>
		</s:form>
	</div>
</body>
</html>