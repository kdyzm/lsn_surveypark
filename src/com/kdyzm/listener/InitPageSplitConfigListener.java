package com.kdyzm.listener;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import org.springframework.context.ApplicationEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.stereotype.Component;

import com.kdyzm.utils.PageSplitConfig;
@Component
public class InitPageSplitConfigListener implements ApplicationListener{
	@Override
	public void onApplicationEvent(ApplicationEvent arg0) {
		InputStream is=InitPageSplitConfigListener.class.getClassLoader().getResourceAsStream("init.properties");
		Properties initProperties=new Properties();
		try {
			initProperties.load(is);
		} catch (IOException e) {
			e.printStackTrace();
		}
		PageSplitConfig.splitPageLength=Integer.parseInt(initProperties.getProperty("splitPageLength"));
		PageSplitConfig.pageSize=Integer.parseInt(initProperties.getProperty("pageSize"));
	}
}
