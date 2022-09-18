package com.fp.smartDoctor.treatment.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fp.smartDoctor.treatment.model.dao.TreatmentDao;
import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Disease;
import com.fp.smartDoctor.treatment.model.vo.Medicine;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;
import com.fp.smartDoctor.treatment.model.vo.Surgery;


@Service
public class TreatmentServiceImpl implements TreatmentService{

	@Autowired
	private SqlSessionTemplate sqlSession;	
	@Autowired
	private TreatmentDao tDao;
	
	
	
	//수술예약 상세조회 서비스(select)
	@Override
	public Clinic selectRevOProom(int bookingNo) {
		return tDao.selectRevOProom(sqlSession, bookingNo);
	}
	
	//수술예약을위한 정보조회 서비스(select)
	@Override
	public  Clinic selectforInsertRevOP(int clinicNo) {
		return tDao.selectforInsertRevOP(sqlSession, clinicNo);
	}
	
	// 수술실 캘린더 조회
	@Override
	public List<RevOProom> getCalendar() {
		return tDao.getCalendar(sqlSession);
	}

	//입력받은 날짜 중복여부 체크
	/*
	@Override
	public int checkOverlapRsv(HashMap<String, String> paraMap) {
		return tDao.checkOverlapRsv(sqlSession, paraMap);
	}
	*/
	
	//시간 중복 막기
	@Override
	public ArrayList<Clinic> blockOverlap(HashMap<String, String> map) {
		return tDao.blockOverlap(sqlSession, map);
	}
	//수술실 예약
	@Override
	public int insertReservation(HashMap<String, String> paraMap) {
		return tDao.insertReservation(sqlSession, paraMap);
	}

	//수술실 예약 취소
	@Override
	public int cslRsvOP(int bookingNo) {
		return tDao.cslRsvOP(sqlSession, bookingNo);
	}

	//수술실 예약 업데이트
	@Override
	public int updateRevOProom(RevOProom op) {
		return 0;
	}

	// 진료중인 환자 조회
	@Override
	public Patient selectNowPatient(Patient p) {
		Patient nowPatient = tDao.selectNowPatient(sqlSession, p);
		return nowPatient;
	}

	// 진료할 환자의 과거 내역 조회
	@Override
	public ArrayList<Clinic> selectPatientInfo(String chartNo) {
		ArrayList<Clinic> list = tDao.selectPatientInto(sqlSession, chartNo);
		return list;
	}

	// 질병 전체 리스트 조회
	@Override
	public ArrayList<Disease> selectDiseaseList() {
		ArrayList<Disease> list = tDao.selectDiseaseList(sqlSession);
		return list;
	}

	// 수술 전체 리스트 조회
	@Override
	public ArrayList<Surgery> selectSurgeryList() {
		ArrayList<Surgery> list = tDao.selectSurgeryList(sqlSession);
		return list;
	}

	// 약 전체 리스트 조회
	@Override
	public ArrayList<Medicine> selectMedList() {
		ArrayList<Medicine> list = tDao.selectMedList(sqlSession);
		return list;
	}
	
	
	

}
