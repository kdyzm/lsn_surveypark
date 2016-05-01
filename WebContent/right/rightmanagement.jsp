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
		$("#checkAllOrNot").unbind("click");
		$("#checkAllOrNot").bind("click",function(){
			var flag=isAllChecked();
			if(flag){
				$("input[type='checkbox']").each(function(){
					$(this).removeAttr("checked");
				});
			}else{
				$("input[type='checkbox']").each(function(){
					$(this).attr("checked","checked");
				});
			}
			return false;
		});
	});
	function isAllChecked(){
		var allCheckbox=$("input[type='checkbox']");
		var hasCheckedBox=$("input[type='checkbox']:checked");
		if(allCheckbox.length==hasCheckedBox.length){
			return true;
		}
		return false;
	}
</script>
<style type="text/css">
	/* table{
		width:96%;
		border: 1px solid balck;
		border-collapse: collapse;
		margin: 0 auto;
		margin-top: 20px;
	}
	table td{
		border:1px solid black;
		padding: 5px;
		text-align: right;
		min-width: 30px;
		font-size: 16px;
	} */
	/* .endtd{
		text-align: center;
	} */
	input[type='submit']{
		border:1px solid gray;
		width: 10%;
		height: 30px;
	}
	input[type='checkbox']{
		width:20px;
		height:20px;
		border:1px solid black;
	}
</style>
</head>
<!-- 进行权限管理的界面 -->
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
					<li><s:a action="AuthenticationAction_toAuthenticationManagementPage.action" namespace="/">用户授权管理</s:a></li>
					<li><s:a action="RoleAction_toRoleManagementPage.action" namespace="/">角色管理</s:a> </li>
					<li class="active"><s:a action="RightAction_toRightManagementPage.action" namespace="/">权限管理</s:a></li>
					<li><s:a action="LogAction_findAllLogs.action" namespace="/">日志管理</s:a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div style="background-color:#CCC;height:30px;width: 100%;line-height: 30px;font-size: 15px;text-align: left;padding-left: 20px;">
		权限管理的界面
		<div style="width: 100px;float: right;margin-right: 20px;">
			<s:a action="RightAction_toSaveOrUpdateRightPage.action" namespace="/">
				添加权限
			</s:a>
		</div>
	</div>
	<div class="container">
		<table class="table table-striped table-hover ">
			<thead>	
				<tr>
					<td>ID</td>
					<td>权限名称</td>
					<td>公共资源
						<s:a id="checkAllOrNot">全选/反选</s:a>
					</td>
					<td>权限URL</td>
					<td>权限位</td>
					<td>权限码</td>
					<td>修改</td>
					<td>删除</td>
				</tr>
			</thead>
			<s:form action="RightAction_updateBatchRights.action" namespace="/" method="post">
				<s:iterator value="rightList" status="st">
					<tr>
						<td>
							<%-- <s:textfield value="%{rightId}" name="%{'rightList['+#st.index+'].rightId'}" readonly="true"></s:textfield> --%>
							<s:property value="%{rightId}"/>
							<s:hidden name="%{'rightList['+#st.index+'].rightId'}" value="%{rightId}"></s:hidden>
						</td>
						<td>
							<s:textfield value="%{rightName}"  name="%{'rightList['+#st.index+'].rightName'}"></s:textfield>
						</td>
						<td>
							<s:checkbox value="%{common}"  name="%{'rightList['+#st.index+'].common'}"></s:checkbox>
						</td>
						<td align="right"><s:property value="rightUrl"/></td>
						<td><s:property value="rightPos"/></td>
						<td align="right"><s:property value="rightCodes"/></td>
						<td>
							<s:a action="RightAction_toSaveOrUpdateRightPage.action" namespace="/">
								<s:param name="rightId" value="%{rightId}"></s:param>
								修改
							</s:a>
						</td>
						<td>
							<s:a action="RightAction_deleteRight" namespace="/">
								<s:param name="rightId" value="%{rightId}"></s:param>
								删除
							</s:a>
						</td>
					</tr>
				</s:iterator>
				<tr>
					<td colspan="9" class="endtd">
						<s:submit value="确定"></s:submit>
					</td>
				</tr>
			</s:form>
		</table>
	</div>
</body>
</html>