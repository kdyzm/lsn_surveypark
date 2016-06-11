package com.kdyzm.struts.action;

import java.util.Map;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.google.gson.Gson;
import com.kdyzm.domain.User;
import com.kdyzm.service.UserService;
import com.kdyzm.struts.action.base.BaseAction;

/**
 * TODO 泛型不能加上真是奇葩，加上就会报空指针异常
 * Action中的泛型不能加上，否则会出现问题（在BaseAction中的构造方法中会出现空指针异常！） 杜绝UserAction<User>这种形式的出现
 * 
 * @author kdyzm
 *
 */
@Controller("userAction")
@Scope("prototype")
public class UserAction extends BaseAction<User> implements SessionAware {
	private static final long serialVersionUID = 5516285232366457987L;
	private Logger logger = Logger.getLogger(UserAction.class);
	private Map<String, Object> session;
	@Resource(name = "userService")
	private UserService userService;

	@Override
	public void setSession(Map<String, Object> session) {
		this.session = session;
	}

	public String logout() {
		User user = (User) session.get("user");
		logger.info("用户 " + user.getNickName() + " 即将登出！");
		session.remove("user");
		return "logout";
	}

	public String toUserProfile() {
		Integer userId = this.model.getUserId();
		this.model = this.userService.getEntityById(userId);
		return "toUserProfile";
	}

	/**
	 * 执行更新用户信息的动作
	 * 
	 * @return
	 */
	public String doUpdateUserProfile() {
		System.out.println(new Gson().toJson(this.model));
		User user=this.userService.getEntityById(this.model.getUserId());
		user.setEmail(this.model.getEmail());
		user.setNickName(this.model.getNickName());
		user.setPassword(this.model.getPassword());
		this.userService.updateEntity(user);
		User oldUser=(User) ServletActionContext.getRequest().getSession().getAttribute("user");
		oldUser.setEmail(this.model.getEmail());
		oldUser.setNickName(this.model.getNickName());
		oldUser.setPassword(this.model.getPassword());
		return "toIndexPage";
	}
}
