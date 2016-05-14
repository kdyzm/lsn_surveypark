package com.kdyzm.struts.action;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestParam;

import com.kdyzm.domain.Log;
import com.kdyzm.domain.other.PageSplitData;
import com.kdyzm.service.LogService;
import com.kdyzm.struts.action.base.BaseAction;
import com.opensymphony.xwork2.ActionContext;

@Controller
@Scope("prototype")
public class LogAction extends BaseAction<Log> {
	private Logger logger=Logger.getLogger(LogAction.class);
	@Resource(name = "logService")
	private LogService logService;
	private static final long serialVersionUID = -1136113519139723083L;

	// 跳转到日志管理界面
	public String findAllLogs() throws Exception {
		// 获取请求参数开始
		HttpServletRequest request = ServletActionContext.getRequest();
		String requestPage = request.getParameter("requestPage");
		ActionContext.getContext().put("requestPage", requestPage);
		String operatorDateFirst = request.getParameter("operatorDateFirst");
		ActionContext.getContext().put("operatorDateFirst", operatorDateFirst);
		String operatorDateLast = request.getParameter("operatorDateLast");
		ActionContext.getContext().put("operatorDateLast", operatorDateLast);
		String operateResult = request.getParameter("operateResult");
		ActionContext.getContext().put("operateResult", (operateResult == null || operateResult.trim().equals("")) ? ""
				: (operateResult.equals("1") ? "1" : "2"));
		String operator = request.getParameter("operator");
		ActionContext.getContext().put("operator", operator);
		logger.info("获取的请求参数是：requestPage=" + requestPage);
		logger.info("operatorDateFirst:" + operatorDateFirst);
		logger.info("operatorDateLast:" + operatorDateLast);
		logger.info("operateResult:" + operateResult);
		logger.info("operator:" + operator);
		if (requestPage == null || "".equals(requestPage.trim())) {
			requestPage = "1";
		}
		Collection logs = this.logService.getLogsByMN(Integer.parseInt(requestPage), operatorDateFirst,
				operatorDateLast, operateResult, operator);
		int totalLines = this.logService.getTotalLines(operatorDateFirst, operatorDateLast, operateResult, operator);
		logger.info("totalLines:" + totalLines);
		PageSplitData.requestPage = Integer.parseInt(requestPage);
		PageSplitData.calculate(totalLines);

		logger.info("startIndex：" + PageSplitData.startIndex);
		logger.info("endIndex：" + PageSplitData.endIndex);
		logger.info("totalPages:" + PageSplitData.totalPages);
		logger.info("查询到的日志数量：" + logs.size());

		ActionContext.getContext().put("startIndex", PageSplitData.startIndex);
		ActionContext.getContext().put("endIndex", PageSplitData.endIndex);
		ActionContext.getContext().put("requestPage", PageSplitData.requestPage);
		ActionContext.getContext().put("totalPages", PageSplitData.totalPages);
		Collection<Log> logList = new ArrayList<Log>();
		for (Object log : logs) {
			Object[] temp = (Object[]) log;
			Log newLog = new Log();
			newLog.setLogId((String) temp[0]);
			newLog.setOperateParams((String) temp[1]);
			newLog.setOperateResult((String) temp[2]);
			newLog.setOperator((String) temp[3]);
			newLog.setOperatorDate((Date) temp[4]);
			newLog.setOperatorName((String) temp[5]);
			newLog.setResultMessage((String) temp[6]);
			logList.add(newLog);
		}
		ActionContext.getContext().put("logList", logList);
		return "toAllLogsPage";
	}
}
