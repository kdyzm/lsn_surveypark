package com.kdyzm.service;

import java.util.Collection;

import com.kdyzm.domain.Log;
import com.kdyzm.service.base.BaseService;

public interface LogService extends BaseService<Log>{
	public void saveLog(Log log);

	public Collection<Log> getLogsByMN(Integer requestPage, String operatorDateFirst, String operatorDateLast, String operateResult, String operator);

	public int getTotalLines(String operatorDateFirst, String operatorDateLast, String operateResult, String operator);
}
