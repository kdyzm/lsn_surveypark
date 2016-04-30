package com.kdyzm.domain.other;

import com.kdyzm.utils.PageSplitConfig;

public class PageSplitData {
	// 该条数据应该在调用响应方法之前赋值
	public static Integer requestPage; // 请求之后应该强调显示的页码，即响应之后的当前页或者响应时的响应页码。
	public static Integer startIndex; // 起始页码
	public static Integer endIndex; // 最后页码
	public static Integer totalPages; // 一共有多少页

	/**
	 * 
	 * @param total
	 */
	public static void calculate(int totalLines) {
		// 每页显示多少条数据
		int pageSize = PageSplitConfig.pageSize;
		// 分页长度
		int splitPageLength = PageSplitConfig.splitPageLength;
		// 已经得到了数据一共有多少条：totalLines 和 请求页 requestPage

		// 得到总页数
		totalPages = totalLines / pageSize + (totalLines % pageSize == 0 ? 0 : 1);

		// 计算startIndex和endIndex的关键原则就是endIndex-startIndex的结果是splitPageLength-1
		if (splitPageLength % 2 == 0) {// 分页长度是偶数,为了让当前页在中间，采用前多后少的分页方法
			// 这种情况下splitPageLength/2+splitPageLength/2==splitPageLength
			startIndex = requestPage - (splitPageLength / 2 + 1);// 正常情况（针对大数据）
			endIndex = requestPage + (splitPageLength / 2);// 特殊情况（针对大数据）
		} else {// 分页长度是奇数
				// 这种情况下splitPageLength/2+splitPageLength/2=splitPageLength-1，符合之前说的原则
			startIndex = requestPage - (splitPageLength / 2);// 这样就正好了
			endIndex = requestPage + (splitPageLength / 2);// 正好
		}
		if (startIndex <= 0) {
			startIndex = 1;
			if ((startIndex + splitPageLength - 1) > totalPages) {
				endIndex = totalPages;
			} else {
				endIndex = startIndex + splitPageLength - 1;
			}
		} else {// 正常情况
			if (endIndex > totalPages) {
				endIndex = totalPages;
				if ((endIndex - (splitPageLength - 1)) <= 0) {
					startIndex = 1;
				} else {
					startIndex = endIndex - (splitPageLength - 1);
				}
			} else {
				// 正常情况，不做处理
			}
		}
		// 需要传递的几个参数都计算完毕
	}

	public static Integer getRequestPage() {
		return requestPage;
	}

	public static Integer getStartIndex() {
		return startIndex;
	}

	public static Integer getEndIndex() {
		return endIndex;
	}

	public static Integer getTotalPages() {
		return totalPages;
	}
}