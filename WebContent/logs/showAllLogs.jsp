<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib uri="/struts-tags" prefix="s"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/header.css"
	type="text/css">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/pageSplit.css"
	type="text/css">
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/js/jquery-1.4.1.js"></script>
<script type="text/javascript"
	src="${pageContext.servletContext.contextPath}/js/DatePicker/WdatePicker.js"></script>
<script type="text/javascript">
	$().ready(
			function() {
				$("#pageSplit a").each(
						function() {
							$(this).unbind("click");
							$(this).bind(
									"click",
									function() {
										var requestPage = $(this).attr("href")
												.split("requestPage=")[1];
										$("input[name='requestPage']").val(
												requestPage);
										$("form").submit();
										return false;
									});
						});
				$("#query").unbind("click");
				$("#query").bind("click", function() {
					$("form").submit();
				});
			});
</script>
<style type="text/css">
table {
	width: 89%;
	border: 1px solid balck;
	border-collapse: collapse;
	margin: 0 auto;
	margin-top: 20px;
}

table td {
	border: 1px solid black;
	padding: 5px;
	text-align: center;
}
</style>
</head>
<!-- 进行权限管理的界面 -->
<body>
	<%@ include file="/header.jsp"%>
	<div
		style="background-color: #CCC; height: 30px; width: 100%; line-height: 30px; font-size: 15px; text-align: left; padding-left: 20px;">
		日志管理的界面</div>
	<div>
		<fieldset
			style="width: 60%; padding: 10px; margin: 0 auto; margin-top: 20px;">
			<s:form cssStyle="width:80%;margin:0 auto;" namespace="/"
				action="LogAction_findAllLogs.action" method="POST">
				<s:hidden name="requestPage" value="%{#requestPage}"></s:hidden>
			操作时间：<s:textfield
					onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
					name="operatorDateFirst" value="%{#operatorDateFirst}" cssStyle="width:120px;"></s:textfield>-<s:textfield
					name="operatorDateLast" value="%{#operatorDateLast}"
					onClick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss'})"
					cssStyle="width:120px;"></s:textfield>
			&nbsp;
			操作结果：<s:radio name="operateResult" value="%{#operateResult}"
					list="#{1:'SUCCESS',2:'FAILURE'}"></s:radio>
				<br />
			操作人：<s:textfield name="operator" value="%{#operator}"/>
				<s:submit cssStyle="width:50px;margin-left:150px;margin-top:10px;"
					value="查询"></s:submit>
			</s:form>
		</fieldset>
		<table>
			<tr>
				<td>操作人</td>
				<td>操作名称</td>
				<td>操作参数</td>
				<td>操作结果</td>
				<td>结果消息</td>
				<td>操作时间</td>
			</tr>
			<s:iterator value="%{#logList}" status="st">
				<tr>
					<td><s:property value="operator" /></td>
					<td><s:property value="operatorName" /></td>
					<td><s:property
							value="@com.kdyzm.utils.StringUtils@setTagContentLimitLength(operateParams)" /></td>
					<td><s:property value="operateResult" /></td>
					<td><s:property value="resultMessage" /></td>
					<td><s:date name="operatorDate" format="yyyy-MM-dd HH:mm:ss" /></td>
				</tr>
			</s:iterator>
		</table>
	</div>
	<div id="pageSplit">
		<s:a action="LogAction_findAllLogs.action">首页
                <s:param name="requestPage" value="1"></s:param>
		</s:a>
		<s:a action="LogAction_findAllLogs.action">上一页
                <s:param name="requestPage"
				value="#requestPage-1>0?#requestPage-1:1"></s:param>
		</s:a>
		<s:iterator var="page" begin="%{#startIndex}" end="%{#endIndex}">
			<s:if test="#page==#requestPage">
				<s:a action="LogAction_findAllLogs.action"
					cssStyle="background-color: #91C0E3;">
					<s:param name="requestPage" value="#page"></s:param>
					<s:property value="#page" />
				</s:a>
			</s:if>
			<s:else>
				<s:a action="LogAction_findAllLogs.action">
					<s:param name="requestPage" value="#page"></s:param>
					<s:property value="#page" />
				</s:a>
			</s:else>
		</s:iterator>
		<s:if test="%{#totalPages>#endIndex}">
                ......
                <s:a action="LogAction_findAllLogs.action">
				<s:param name="requestPage" value="#endIndex+1"></s:param>
                共有
                <s:property value="%{#totalPages}" />页</s:a>
		</s:if>
		<s:else>
			<s:a action="LogAction_findAllLogs.action">
				<s:param name="requestPage" value="%{#totalPages}"></s:param>
                共有
                <s:property value="%{#totalPages}" />页</s:a>
		</s:else>
		<s:a action="LogAction_findAllLogs.action">
                下一页
                <s:param name="requestPage"
				value="#requestPage+1>#totalPages?#totalPages:#requestPage+1"></s:param>
		</s:a>
		<s:a action="LogAction_findAllLogs.action">
                尾页
                <s:param name="requestPage" value="#totalPages"></s:param>
		</s:a>
	</div>
</body>
</html>