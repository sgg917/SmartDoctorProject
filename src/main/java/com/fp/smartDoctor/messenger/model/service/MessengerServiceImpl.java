package com.fp.smartDoctor.messenger.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.messenger.model.dao.MessengerDao;

@Service
public class MessengerServiceImpl implements MessengerService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;	
	
	@Autowired
	private MessengerDao mDao;

	
}
