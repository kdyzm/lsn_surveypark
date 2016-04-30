package com.kdyzm.service.impl;

import java.util.Collection;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kdyzm.dao.base.BaseDao;
import com.kdyzm.domain.Log;
import com.kdyzm.service.LogService;
import com.kdyzm.service.base.impl.BaseServiceImpl;
import com.kdyzm.utils.LogUtils;
import com.kdyzm.utils.PageSplitConfig;

@Service("logService")
public class LogServiceImpl extends BaseServiceImpl<Log> implements LogService {
	@Override
	@Resource(name = "logDao")
	public void setBaseDao(BaseDao<Log> baseDao) {
		super.setBaseDao(baseDao);
	}

	// 保存日志的方法
	public void saveLog(Log log) {
		this.saveEntity(log);
	}

	@Override
	public Collection<Log> getLogsByMN(Integer requestPage, String operatorDateFirst, String operatorDateLast,
			String operateResult, String operator) {
		int m = (requestPage - 1) * PageSplitConfig.pageSize;
		int n = PageSplitConfig.pageSize;
		String tableName = LogUtils.createGenerateLogsTableName(0);// 当前月的日志表
		String talbeName1 = LogUtils.createGenerateLogsTableName(-1);// 上个月的日志表
		// String sql = "select * from " + tableName + " union select * from " +
		// talbeName1 + ") where 1=1 ";
		String sql1 = "select * from " + tableName + " where 1=1";
		String sql2 = "select * from " + talbeName1 + " where 1=1";
		// 这里时间的比较使用mysql内置的unix时间戳来实现：UNIX_TIMESTAMP
		String sql = "";
		if (operatorDateFirst != null && !operatorDateFirst.trim().equals("")) {
			sql += " and UNIX_TIMESTAMP(operatorDate)>=UNIX_TIMESTAMP('" + operatorDateFirst + "') ";
		}
		if (operatorDateLast != null && !operatorDateLast.trim().equals("")) {
			sql += " and UNIX_TIMESTAMP(operatorDate)<=UNIX_TIMESTAMP('" + operatorDateLast + "') ";
		}
		if (operateResult != null && !operateResult.trim().equals("")) {
			if (operateResult.equals("2")) {
				sql += " and  operateResult='FAILURE' ";
			} else {
				sql += " and  operateResult='SUCCESS' ";
			}
		}
		if (operator != null && !operator.trim().equals("")) {
			sql += " and operator like '%" + operator + "%' ";
		}
		sql1 += sql;
		sql2 += sql;
		sql = sql1 + " union " + sql2;
		sql = sql + " order by operatorDate desc";
		return this.baseDao.getEntitiesByMN(sql, m, n);
	}

	@Override
	public int getTotalLines(String operatorDateFirst, String operatorDateLast, String operateResult, String operator) {
		String tableName = LogUtils.createGenerateLogsTableName(0);// 当前月的日志表
		String talbeName1 = LogUtils.createGenerateLogsTableName(-1);// 上个月的日志表
		// String sql = "select * from " + tableName + " union select * from " +
		// talbeName1 + ") where 1=1 ";
		String sql1 = "select * from " + tableName + " where 1=1";
		String sql2 = "select * from " + talbeName1 + " where 1=1";
		// 这里时间的比较使用mysql内置的unix时间戳来实现：UNIX_TIMESTAMP
		String sql = "";
		if (operatorDateFirst != null && !operatorDateFirst.trim().equals("")) {
			sql += " and UNIX_TIMESTAMP(operatorDate)>=UNIX_TIMESTAMP('" + operatorDateFirst + "') ";
		}
		if (operatorDateLast != null && !operatorDateLast.trim().equals("")) {
			sql += " and UNIX_TIMESTAMP(operatorDate)<=UNIX_TIMESTAMP('" + operatorDateLast + "') ";
		}
		if (operateResult != null && !operateResult.trim().equals("")) {
			if (operateResult.equals("2")) {
				sql += " and  operateResult='FAILURE' ";
			} else {
				sql += " and  operateResult='SUCCESS' ";
			}
		}
		if (operator != null && !operator.trim().equals("")) {
			sql += " and operator like '%" + operator + "%' ";
		}
		sql1 += sql;
		sql2 += sql;
		sql = sql1 + " union " + sql2;
		sql = sql + " order by operatorDate desc";
		return this.baseDao.findAllEntitiesBySql(sql).size();
	}
}
