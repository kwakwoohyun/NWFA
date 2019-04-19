package com.skhu.NWFA.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.skhu.NWFA.dao.testDao;
import com.skhu.NWFA.model.testModel;

@Service
public class testServiceImpl implements testService {
	
	@Autowired
	private testDao dao;

	@Override
	public List<testModel> printModel() {
		// TODO Auto-generated method stub
		return dao.getModel();
	}
	
	
}
