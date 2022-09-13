package com.fp.smartDoctor.treatment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
public class Clinic {

	private int clinicNo;
	private int chartNo;//문자는 안들어가나요??
	private int deptNo;
	private String enrollTime;
	private String enrollDate;
	private String diagnosisContent;
	private String surgery;
	private String enter;
	private String status;
	private String surgeryNo2;
	private String diseaseCode;
	private int empNo;
	private int fee;
	
	//수술실 예약 조회
	private String patientName;
	private String docName;
	private String leadTime;
	private String roomName;
	private String surgeryDate;
	private String surEndTime;
	private String surStartTime;
	private String surDate;
	private String memo;
	private int bookingNo;

}
