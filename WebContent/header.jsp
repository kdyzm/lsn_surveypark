<%@ page language="java" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<div id="header">
	<!-- <div class="header_top">欢迎使用SurveyDoor调查系统!</div> -->
	<%-- <div class="header_content">
		<s:a action="IndexAction_toIndexPage.action" namespace="/">[首页]</s:a>
		<s:a action="SurveyAction_createNewSurvey.action" namespace="/">[新建调查]</s:a>
		<s:a action="SurveyAction_toMySurveyPage.action" namespace="/">[我的调查]</s:a>
		<s:a action="EntrySurveyAction_toEntrySurveyPage.action" namespace="/">[参与调查]</s:a>
		<s:a action="RegisterAction_toRegisterPage.action" namespace="/">[用户注册]</s:a>
		<s:a action="AuthenticationAction_toAuthenticationManagementPage.action" namespace="/">[用户授权管理]</s:a>
		<s:a action="RoleAction_toRoleManagementPage.action" namespace="/">[角色管理]</s:a> 
		<s:a action="RightAction_toRightManagementPage.action" namespace="/">[权限管理]</s:a>
		<s:a action="LogAction_findAllLogs.action" namespace="/">[日志管理]</s:a>
	</div> --%>
	<br/>
	<ul class=" navbar nav nav-pills center">
	   <li><s:a cssStyle="active" action="IndexAction_toIndexPage.action" namespace="/">首页</s:a></li>
		<li><s:a action="SurveyAction_createNewSurvey.action" namespace="/">新建调查</s:a></li>
		<li><s:a action="SurveyAction_toMySurveyPage.action" namespace="/">我的调查</s:a></li>
		<li><s:a action="EntrySurveyAction_toEntrySurveyPage.action" namespace="/">参与调查</s:a></li>
		<li><s:a action="RegisterAction_toRegisterPage.action" namespace="/">用户注册</s:a></li>
		<li><s:a action="AuthenticationAction_toAuthenticationManagementPage.action" namespace="/">用户授权管理</s:a></li>
		<li><s:a action="RoleAction_toRoleManagementPage.action" namespace="/">角色管理</s:a> </li>
		<li><s:a action="RightAction_toRightManagementPage.action" namespace="/">权限管理</s:a></li>
		<li><s:a action="LogAction_findAllLogs.action" namespace="/">日志管理</s:a></li>
	</ul>
	<%-- 
	<nav class="navbar navbar-default">
	  <div class="container-fluid">
	    <!-- Brand and toggle get grouped for better mobile display -->
	    <div class="navbar-header">
	      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
	        <span class="sr-only">Toggle navigation</span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	        <span class="icon-bar"></span>
	      </button>
	      <a class="navbar-brand" href="#">Brand</a>
	    </div>
	    
	    <!-- Collect the nav links, forms, and other content for toggling -->
	    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
	      <ul class="nav navbar-nav">
		    <li><s:a action="IndexAction_toIndexPage.action" namespace="/">首页</s:a></li>
			<li><s:a action="SurveyAction_createNewSurvey.action" namespace="/">新建调查</s:a></li>
			<li><s:a action="SurveyAction_toMySurveyPage.action" namespace="/">我的调查</s:a></li>
			<li><s:a action="EntrySurveyAction_toEntrySurveyPage.action" namespace="/">参与调查</s:a></li>
			<li><s:a action="RegisterAction_toRegisterPage.action" namespace="/">用户注册</s:a></li>
			<li><s:a action="AuthenticationAction_toAuthenticationManagementPage.action" namespace="/">用户授权管理</s:a></li>
			<li><s:a action="RoleAction_toRoleManagementPage.action" namespace="/">角色管理</s:a> </li>
			<li><s:a action="RightAction_toRightManagementPage.action" namespace="/">权限管理</s:a></li>
			<li><s:a action="LogAction_findAllLogs.action" namespace="/">日志管理</s:a></li>
	        <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
	        <li><a href="#">Link</a></li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">Action</a></li>
	            <li><a href="#">Another action</a></li>
	            <li><a href="#">Something else here</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">Separated link</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">One more separated link</a></li>
	          </ul>
	        </li>
	      </ul>
	      <form class="navbar-form navbar-left" role="search">
	        <div class="form-group">
	          <input type="text" class="form-control" placeholder="Search">
	        </div>
	        <button type="submit" class="btn btn-default">Submit</button>
	      </form>
	      
	      
	      <ul class="nav navbar-nav navbar-right">
	        <li><a href="#">Link</a></li>
	        <li class="dropdown">
	          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Dropdown <span class="caret"></span></a>
	          <ul class="dropdown-menu">
	            <li><a href="#">Action</a></li>
	            <li><a href="#">Another action</a></li>
	            <li><a href="#">Something else here</a></li>
	            <li role="separator" class="divider"></li>
	            <li><a href="#">Separated link</a></li>
	          </ul>
	        </li>
	      </ul>
	    </div><!-- /.navbar-collapse -->
	  </div><!-- /.container-fluid -->
	</nav> --%>
	<%-- <div class="header_bottom">
		<marquee>
			<s:if test="%{#session.user!=null}">
				欢迎你，<s:property value="%{#session.user.nickName}"/>
			</s:if>
			<s:else>
				欢迎你，未登录用户
			</s:else>
		</marquee>
	</div> --%>
</div>
