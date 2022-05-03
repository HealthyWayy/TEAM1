package com.team1.health.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.team1.health.dao.MyPageDAO;

@Service
public class MyPageServiceImpl implements MyPageService{
	@Inject
	MyPageDAO dao;
}
