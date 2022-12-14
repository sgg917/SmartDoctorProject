package com.fp.smartDoctor.treatment.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.fp.smartDoctor.reception.model.vo.Prescription;

import com.fp.smartDoctor.treatment.model.vo.Clinic;
import com.fp.smartDoctor.treatment.model.vo.Disease;
import com.fp.smartDoctor.treatment.model.vo.Medicine;
import com.fp.smartDoctor.treatment.model.vo.Patient;
import com.fp.smartDoctor.treatment.model.vo.PreMed;
import com.fp.smartDoctor.treatment.model.vo.RevOProom;
import com.fp.smartDoctor.treatment.model.vo.RevPatientRoom;
import com.fp.smartDoctor.treatment.model.vo.Surgery;

@Repository
public class TreatmentDao {

	
	//수술실 예약 상세조회
	public Clinic selectRevOProom(SqlSessionTemplate sqlSession,int bookingNo) {
		return sqlSession.selectOne("treatmentMapper.selectOProom", bookingNo);
	}
	
	//수술실 예약을 위한 정보조회
	public Clinic selectforInsertRevOP(SqlSessionTemplate sqlSession, int clinicNo) {
		//ListSurgeryBooking list  = new ListSurgeryBooking();
		
		Clinic c = sqlSession.selectOne("treatmentMapper.forinsertOProom",clinicNo);
		return c;
	}
	
	
	
	//수술실 예약 풀캘린더 정보 조회
	public List<RevOProom> getCalendar(SqlSessionTemplate sqlSession)  {
		List<RevOProom> calendar = sqlSession.selectList("treatmentMapper.calendarList");
		return calendar;
	}
	
	//수술실 중복 체크
	/*
	public int checkOverlapRsv(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.selectOne("treatmentMapper.checkOverlapRsv", paraMap);
	}
	*/
	
	//수술실 시간 중복 방지
	public ArrayList<Clinic> blockOverlap(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return (ArrayList)sqlSession.selectList("treatmentMapper.selectOverlap", map);
	}
	
	//수술실 예약(insert)
	public int insertReservation(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.insert("treatmentMapper.insertReservation", paraMap);
	}
	
	//수술실 예약 취소
	public int cslRsvOP(SqlSessionTemplate sqlSession, int bookingNo) {
		return sqlSession.update("treatmentMapper.rsvCancel",bookingNo);
	}
	
	// 진료중인 환자 조회
	public Patient selectNowPatient(SqlSessionTemplate sqlSession, Patient p, String empNo) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("Patient", p);
		map.put("empNo", empNo);
		
		return sqlSession.selectOne("treatmentMapper.selectNowPatient", map);
	}
	
	// 진료할 환자의 과거 내역 조회
	public ArrayList<Clinic> selectPatientInto(SqlSessionTemplate sqlSession, String chartNo) {
		return (ArrayList)sqlSession.selectList("treatmentMapper.selectPatientInfo", chartNo);
	}
	
	// 질병 리스트 조회
	public ArrayList<Disease> selectDiseaseList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("treatmentMapper.selectDiseaseList");
	}
	
	// 수술 전체 리스트 조회
	public ArrayList<Surgery> selectSurgeryList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("treatmentMapper.selectSurgeryList");
	}
	
	
	public ArrayList<Medicine> selectMedList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("treatmentMapper.selectMedList");
	}
	
	
	
	
	//입원실 예약 상세조회
		public Clinic selectRevProom(SqlSessionTemplate sqlSession,int bookingNo) {
		return sqlSession.selectOne("treatmentMapper.selectProom", bookingNo);
	}
	
	//입원실 예약을 위한 정보조회
	public Clinic selectforInsertRevPR(SqlSessionTemplate sqlSession, int clinicNo) {
		//ListSurgeryBooking list  = new ListSurgeryBooking();
		
		Clinic c = sqlSession.selectOne("treatmentMapper.forinsertProom",clinicNo);
		return c;
	}
	
	
	
	
	//입원실 예약 풀캘린더 정보 조회
	public List<RevPatientRoom> getpCalendar(SqlSessionTemplate sqlSession)  {
		List<RevPatientRoom> calendar = sqlSession.selectList("treatmentMapper.pcalendarList");
		return calendar;
	}
	
	
	//입원실 예약(insert)
	public int insertPR(SqlSessionTemplate sqlSession, HashMap<String, String> paraMap) {
		return sqlSession.insert("treatmentMapper.insertp", paraMap);
	}

	
	// 진료 업데이트
	public int updateClinic(SqlSessionTemplate sqlSession, Clinic c) {
		return sqlSession.update("treatmentMapper.updateClinic", c);
	}
	//입원실 예약 후 수납 입원료 업데이트
	public int updatePRpay(SqlSessionTemplate sqlSession, int clinicNo) {
		return sqlSession.update("treatmentMapper.updatePRpay",clinicNo);
	}
		
	// 처방전 입력
	public int insertPre(SqlSessionTemplate sqlSession, Prescription pre) {
		return sqlSession.insert("treatmentMapper.insertPre", pre);
	}
	
	// 처방약 입력
	public int insertPmed(SqlSessionTemplate sqlSession, PreMed pmd) {
		return sqlSession.insert("treatmentMapper.insertPmed", pmd);
	}
	
	// 수납 입력
	public int insertPay(SqlSessionTemplate sqlSession, String clinicNo, String surgeryNo2, String meals) {
		
		HashMap<String, Object> map = new HashMap<>();
		map.put("clinicNo", clinicNo);
		map.put("surgeryNo2", surgeryNo2);
		map.put("meals", meals);
		
		return sqlSession.insert("treatmentMapper.insertPay", map);
	}
	
	public int updatePatient(SqlSessionTemplate sqlSession, String chartNo) {
		return sqlSession.update("treatmentMapper.updatePatient", chartNo);
	}
	
	// 진료 대기 환자 조회
	public ArrayList<Clinic> ajaxWaitingPList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("treatmentMapper.ajaxWaitingPList");
	}
}