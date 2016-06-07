package com.kdyzm.struts.action;

import java.util.Map;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.SessionAware;

import com.kdyzm.domain.User;
import com.kdyzm.struts.action.base.BaseAction;

/**
 * TODO 泛型不能加上真是奇葩，加上就会报空指针异常
 * Action中的泛型不能加上，否则会出现问题（在BaseAction中的构造方法中会出现空指针异常！） 杜绝UserAction<User>这种形式的出现
 * 
 * @author kdyzm
 *
 */
public class UserAction extends BaseAction<User> implements SessionAware {
	private static final long serialVersionUID = 5516285232366457987L;
	private Logger logger=Logger.getLogger(UserAction.class);
	private Map<String, Object> session;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}
	
	public String logout(){
		User user=(User)session.get("user");
		logger.info("用户 "+user.getNickName()+" 即将登出！");
		session.remove("user");
		return "logout";
	}

}
