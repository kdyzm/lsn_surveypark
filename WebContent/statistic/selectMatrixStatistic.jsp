<%@ page language="java" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<link rel="stylesheet"
	href="${pageContext.servletContext.contextPath}/css/header.css"
	type="text/css">
<title>Insert title here</title>
<style type="text/css">
	table{
		border: 1px solid black;
		border-collapse: collapse;
		width: 95%;
		margin: 0 auto;
		margin-top: 20px;
		background-color:   ;
	}
	table td{
		border: 1px solid black;
		padding: 5px;
	}
</style>
</head>
<body>
	<%@ include file="/header.jsp"%>
	<div>
		<div style="height: 50px;line-height: 50px;width: 100%;background-color: #CCC;padding-left: 30px;font-weight: bold;">矩阵式类型的问题调查结果统计</div>
		<table>
			<tr>
				<td colspan='<s:property value="%{osms.size+1}"/>'>
					&nbsp;&nbsp;<s:property value="%{question.title}"/>
				</td>
			</tr>
			<tr>
				<td colspan='<s:property value="%{osms.size+1}"/>'>
					&nbsp;&nbsp;
					<s:iterator value="%{question.matrixSelectOptionArr}" status="st">
						<input readonly="readonly" style="width: 10px;height: 10px;background-color: <s:property value='%{#colors[#st.index]}'/>">
					<s:property/>
					</s:iterator>
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
							<s:iterator value="%{question.matrixSelectOptionArr}" var="op" status="ost">
								<input style="height:10px;float:left;background-color: <s:property value='%{colors[#ost.index]}'/>;width:<s:property value="getWidth(#rst.index,#cst.index,#ost.index)"/>px;" readonly="readonly"/>
								<span style="font-size:12px;float:right;display: inline-block;text-align: right;"><s:property value="getPercent(#rst.index,#cst.index,#ost.index)"/></span>
								<br/>
							</s:iterator>
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