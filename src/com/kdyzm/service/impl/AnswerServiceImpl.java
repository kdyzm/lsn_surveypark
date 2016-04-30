package com.kdyzm.service.impl;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.kdyzm.dao.impl.AnswerDaoImpl;
import com.kdyzm.domain.Answer;
import com.kdyzm.service.AnswerService;
@Service("answerService")
public class AnswerServiceImpl  implements AnswerService{
	@Resource(name="answerDao")
	private AnswerDaoImpl answerDao;

	@Override
	public void saveAnswer(Answer answer) {
		this.answerDao.saveEntity(answer);
	}

	@Override
	public void saveAllAnswers(List<Answer> answers) {
		String uuid=UUID.randomUUID().toString().replaceAll("-", "");
		for(Answer answer:answers){
			answer.setUuid(uuid);
			this.answerDao.saveEntity(answer);
		}
	}
	
}
