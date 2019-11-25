package com.ch.podo.inquiry.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ch.podo.inquiry.model.dao.InquiryDao;

@Service("inquiryService")
public class InquiryServiceImpl implements InquiryService{

	@Autowired
	private InquiryDao inquiryDao;
}
