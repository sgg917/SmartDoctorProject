<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>SMART DOCTOR</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="resources/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet"
	href="resources/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="resources/css/style.css">
<!-- End layout styles -->
<link rel="icon" type="image/png" sizes="16x16"
	href="resources/images/favicon-16x16.png">


<!--@@ fullcalendar CDN 가져가세용~-->
<link href='resources/fullcalendar/lib/main.css' rel='stylesheet' />
<script src='resources/fullcalendar/lib/main.js'></script>
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>


<style>
.wrap111 {
	width: 100%;
	height: 100%;
	background-color: white;
	border-radius: 30px 10px;
	box-shadow: 3px 3px 3px 3px lightgray;
	text-align: center;
}

.table1 {
	margin: auto;
}

.smallbtn1 {
	border-radius: 10px 10px 10px 10px;
	width: 50px;
	height: 20px;
	background-color: rgb(26, 188, 156);
	font-size: 0.8em;
	display: inline-block;
}

th {
	height: 50px;
	text-align: left;
}

.part1 {
	width: 50%;
	float: left;
	margin: auto;
}

.calender1 {
	width: 48%;
	height: 650px;
	float: right;
	margin-right: 10px;
	color: rgb(65, 125, 122);
}

.wrap22 {
	width: 95%;
	margin: auto;
}

/* 풀캘린더 style */
#calendar{
	color:black;
}

.fc .fc-button{
	height:30px;
	padding:1;
	font-size:0.8em;
}

.fc .fc-toolbar-title{
	font-size:1.5em;
}


/* 모달 style */
.wrap112{
	width:700px;
	background-color: #F2F2F2;
	text-align: center;
	border-radius: 30px 10px;
}

.mymodal2 .modal-backdrop {
  /* display: block; 검은색레이어*/
  display: none;
  /* background clickable */
}

</style>




</head>


</head>
<body>

	<div class="container-scroller">
		<jsp:include page="../common/navbar.jsp" />
		<div class="main-panel">
			<div class="content-wrapper">
			
				<div class="wrap111">
				
					<form id="enrollForm" method="post" action="insert.op">
						<!-- 숨겨서 넘길 값--> 
						<input type="hidden" id="clinicNo" class="form-control" value="${ c.clinicNo }" name="clinicNo"> 
						<input type="hidden" id="surgeryNo" class="form-control" value="${ c.surgeryNo2 }" name="surgeryNo"> 
						<input type="hidden" id="leadTime" class="form-control" value="${ c.leadTime }" name="leadTime">
						 
						 
	
						<br>
						<h3> <b>차트번호 ${c.clinicNo} 수술실 예약</b> </h3>
						<hr>
						<br><br>
						<div class="wrap22">
							<div class="part1">
								<table class="table1">
									<tr>
										<td colspan="2" width="600px">
											<div class="smallbtn1">입력</div>
											<div style="display: inline-block; margin-left: 30px;">
												<h3>예약일자<c:set var="ymd" value="<%=new java.util.Date()%>" />
													<fmt:formatDate value="${ymd}" pattern="yyyy-MM-dd" />
												</h3>
											</div>
											<hr>
										</td>
									</tr>
									<tr>
										<th>차트번호</th>
										<td><input readonly name="clinicNo" value="${c.clinicNo}" type="text"
											style="width: 300px; background-color:#F2F2F2;"></td>
									</tr>
									<tr>
										<th>수진자명</th>
										<td><input type="text" name="patentName" style="width: 300px;  background-color:#F2F2F2;" readonly value="${ c.patientName }"></td>
									</tr>
									<tr>
										<th>수술실</th>
										<td>
										<select name="roomName" id="roomName" style="width: 300px;">
												<option value="x">선택안함</option>
												<option value="operatingA">operatingA</option>
												<option value="operatingB">operatingB</option>
												<option value="operatingC">operatingC</option>
												<option value="operatingD">operatingD</option>
										</select> 
				                   
										</td>
									</tr>
									<tr>
										<th>예약날짜</th>
										<td>
										<input type="date" class="datepicker" name="surDate" style="width: 225px; height: 25.2px;">

									   	<select onchange="updateEndTime()" class="surStartTime"  name="surStartTime" id="surStartTime" style="width: 70px; height: 25.2px;">
											<option value="09:30">09:30</option>
											<option value="10:00">10:00</option>
											<option value="10:30">10:30</option>
											<option value="11:00">11:00</option>
											<option value="11:30">11:30</option>
											<option value="12:00">12:00</option>
											<option value="12:30">12:30</option>
											<option value="13:00">13:00</option>
											<option value="13:30">13:30</option>
											<option value="14:00">14:00</option>
											<option value="14:30">14:30</option>
											<option value="15:00">15:00</option>
											<option value="15:30">15:30</option>
											<option value="16:00">16:00</option>
											<option value="16:30">16:30</option>
											<option value="17:00">17:00</option>
											<option value="17:30">17:30</option>
											<option value="18:00">18:00</option>
											<option value="18:30">18:30</option>
											<option value="19:00">19:00</option>
									    </select>
									   <br>
								   </td>
									</tr>
									<tr>
										<th>예상완료시각</th>
										<td><input type="text" readonly style="width: 300px;  background-color:#F2F2F2;" name="surEndTime" id="surEndTime"></td>
									</tr>
									<tr>
										<th>담당의</th>
										<td><input type="text" style="width: 300px;" name="doctorName" value="${c.docName}"></td>
									</tr>
									<tr>
										<th>특이사항</th>
										<td>
										<textarea style="width: 300px; height: 100px; resize: none;"name="memo"></textarea>
										</td>
									</tr>
								</table>
								
								<br>
								<br>
								<button type="" class="btn btn-danger"
									style="height: 30px; width: 100px; padding: 0%; color: black; border: 0; background-color: rgb(65, 125, 122);">예약</button>

								<br><br><br><br><br><br><br><br>
							</div>
							<div id='calendar' class="calender1"></div>
						</div>
						<br><br><br><br><br><br>
					</form>
				</div>
			</div>
			<jsp:include page="../common/footer.jsp" />
		</div>
	</div>












	<!-- 수술실 상세조회 모달 -->
	<div class="modal fade insertModal" id="myModal1">
	    <div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="wrap112">
		
				<input type="hidden" id="clinicNo" class="form-control" value="${ c.clinicNo }" name="clinicNo"> 
				<input type="hidden" id="surgeryNo" class="form-control" value="${ c.surgeryNo2 }" name="surgeryNo"> 
				<input type="hidden" id="leadTime" class="form-control" value="${ c.leadTime }" name="leadTime"> 
				<br>
				<h3> <b>수술실 예약 조회</b> </h3>
				<hr>
				<div class="wrap221" style="width:100%">
					<div class="part1" style="width:100%">
						<table class="table1" style="width:100%">
							<tr>
								<td colspan="2">
									<div class="smallbtn1">조회</div>
									<div style="display: inline-block; margin-left: 30px;">
										<h3>${c.surDate}</h3>
									</div>
								</td>
							</tr>
							<tr>
								<th>차트번호</th>
								<td><input readonly name="clinicNo" value="${ c.clinicNo }" type="text"
									style="width: 300px;"></td>
							</tr>
							<tr>
								<th>수진자명</th>
								<td><input type="text" style="width: 300px;" readonly value="${c.patientName }"></td>
							</tr>
							<tr>
								<th>수술실</th>
								<td><input type="text" style="width: 300px;" readonly value="${c.roomName }"></td>
							</tr>
							<tr>
								<th>예약날짜</th>
								<td><input type="date" style="width: 300px;" name="surDate" readonly value="${c.surDate }"><br></td>
							</tr>
							<tr>
								<th>예약시각</th>
								<td>
									<input type="time" style="width: 300px;" name="surStartTime" id="surStartTime" readonly value="${c.surStartTime }">
								</td>
							</tr>
							<tr>
								<th>예상완료시각</th>
								<td><input type="text" readonly value="${ c.surEndTime }" style="width: 300px;" name="surEndTime" id="surEndTime" readonly></td>
							</tr>
							<tr>
								<th>담당의</th>
								<td><input type="text" style="width: 300px;" readOnly value="${ c.docName }" name="doctorName"></td>
							</tr>
							<tr>
								<th>특이사항</th>
								<td>
								<textarea style="width: 300px; height: 100px; resize: none;"name="memo" readonly>${c.memo}</textarea>
								</td>
							</tr>
	
	
						</table>
	
						<br>
						<br>
	
						<button type="button" class="btn btn-danger" style="height: 30px; width: 100px; padding:0%; color:black; background-color: rgb(65, 125, 122);" data-toggle="modal" data-target="#myModal2" onclick="ModalClose()">수정</button>
	           			<button type="button" class="btn btn-danger" style="height: 30px; width: 100px; padding:0%; color:black; background-color: red">수술취소</button>
	         			<button type="button" class="btn btn-secondary" style="height: 30px; width: 100px; padding:0%; color:black;" onclick="ModalClose()">뒤로가기</button>
						<br><br><br><br><br>
						
					</div>
				</div>
				</div>
		    </div>
	    </div>
  	</div>








	<!-- 수술실 수정 모달-->
	<div class="modal fade insertModal mymodal2" id="myModal2">
	    <div class="modal-dialog">
		    <div class="modal-content">
		    	<div class="wrap112">
		
				<input type="hidden" id="clinicNo" class="form-control" value="${ c.clinicNo }" name="clinicNo"> 
				<input type="hidden" id="surgeryNo" class="form-control" value="${ c.surgeryNo2 }" name="surgeryNo"> 
				<input type="hidden" id="leadTime" class="form-control" value="${ c.leadTime }" name="leadTime"> 
				<br>
				<h3> <b>수술실 예약 수정</b> </h3>
				<hr>
				<div class="wrap221" style="width:100%">
					<div class="part1" style="width:100%">
						<table class="table1" style="width:100%">
							<tr>
								<td colspan="2">
									<div class="smallbtn1">수정</div>
									<div style="display: inline-block; margin-left: 30px;">
										<h3>${op.surDate}</h3>
									</div>
								</td>
							</tr>
							<tr>
								<th>차트번호</th>
								<td><input readonly name="clinicNo" value="${ c.clinicNo }" type="text"
									style="width: 300px;"></td>
							</tr>
							<tr>
								<th>수진자명</th>
								<td><input type="text" style="width: 300px;" readonly value="${c.patientName }"></td>
							</tr>
							<tr>
								<th>수술실</th>
								<td><input type="text" style="width: 300px;" value="${c.roomName }"></td>
							</tr>
							<tr>
								<th>예약날짜</th>
								<td><input type="date" style="width: 300px;" name="surDate"  value="${c.surDate }"><br></td>
							</tr>
							<tr>
								<th>예약시각</th>
								<td><input type="time" style="width: 300px;" name="surStartTime" id="surStartTime" value="${c.surStartTime }"></td>
							</tr>
							<tr>
								<th>예상완료시각</th>
								<td><input type="text" readonly value="${ c.surEndTime }" style="width: 300px;" name="surEndTime" id="surEndTime" readonly></td>
							</tr>
							<tr>
								<th>담당의</th>
								<td><input type="text" style="width: 300px;" readOnly value="${ c.docName }" name="docName"></td>
							</tr>
							<tr>
								<th>특이사항</th>
								<td>
								<textarea style="width: 300px; height: 100px; resize: none;"name="memo">${c.memo}</textarea>
								</td>
							</tr>
	
	
						</table>
	
						<br>
						<br>
	
						<button type="button" class="btn btn-danger" style="height: 30px; width: 100px; padding:0%; color:black; background-color: rgb(65, 125, 122);">수정</button>
	           			<button type="button" class="btn btn-danger" style="height: 30px; width: 100px; padding:0%; color:black; background-color: red">수술취소</button>
	         			<button type="button" class="btn btn-secondary" style="height: 30px; width: 100px; padding:0%; color:black;" data-dismiss="modal">뒤로가기</button>
						<br><br><br><br><br>
						
					</div>
				</div>
				</div>
		    </div>
	    </div>
  	</div>















	<script>
	
		$(function() {

			$.ajax({
				url : "list.ca",
				success : function(list) {

					//console.log(list);

					let data = [];/* 내가 넘겨주고자 하는 값을 리스트로 다시 담아줘야함! */
					for (let i = 0; i < list.length; i++) {
						let obj = {
							title : list[i].clinicNo,
							start : list[i].surDate,
							end : list[i].surDate,
							textColor : list[i].textColor,
							backgroundColor : list[i].backgroundColor
						};
						data.push(obj);
					}

					// -------------------- 캘린더 렌더링 --------------------
					var initialLocaleCode = 'ko';
					var calendarEl = document.getElementById('calendar');
					var calendar = new FullCalendar.Calendar(calendarEl, {
						initialView : 'dayGridMonth',
						locale : 'ko', // 한국어 설정
						 headerToolbar: {
						    left: 'prev,next today',
						    center: 'title',
						    right: 'dayGridMonth,timeGridWeek,timeGridDay'
						},
						selectable : true,
						droppable : true,
						editable : true,
						events : data,
						eventClick: function(arg) {
							ModalOpen(arg);	//이벤트 클릭 시 모달 호출
					    }
					});

					calendar.render();
					// ------------------------------------------------------------

				},
				error : function() {
					console.log("통신 실패")
				}

			})

		});
	
		
		
		function clickRevBtn(){
		     
		   // db에 넣기
		   $.ajax({
		      url:"insert.op",
		      data:{surgeryNo:surgeryNo,
		    	  	clinicNo:clinicNo, 
		    	  	roomName:roomName, 
		    	  	surDate:surDate,
		    	  	surEndTime:surEndTime
		    	  	surStartTime:surStartTime,
		    	  	doctorName:docName,
		    	  	memo:memo
		            },
		      type:"POST",
		      dataType:"JSON",
		      success:function(json){
		         
		         
		         // 예약일로 입력한 값이 db에서 중복되는지 안되는지로 나눔
		         if (json.n == 1) {
		            alert("수술실 예약 되었습니다.");
		            
		         }else if (json.n == -1/*아닌거같음*/) {
		            // 중복된 예약(시간)으로 예약에 실패했을 때
		            alert("해당 시간에는 이미 예약이 있습니다.");
		         }
		         else{
		            // db오류
		            alert("DB 오류");
		         }
		         location.reload();
		         
		      },
		      error: function(){
		         alert("오류로 인한 예약실패");
		       }
		   });
		  }
		
		function ModalOpen(arg){
			$('#myModal1').modal('show');
		  }
		
		function ModalClose(){
			$("#myModal1").modal("hide");
		}
	</script>
	<!-- 계속 새로운 일정이 들어가면 또 새로 바로 띄워주게하기위해서 ajax를 function으로 빼줘서 사용하는것이 좋음-->

	<script>
		$(".surEndTime").change(function updateEndTime(){
			var Sum = function(){			
				var timeS = $(".surStartTime>option:selected").text();			
				var timeE = ${c.leadTime}			
				var result = parseDate(timeS) + parseDate(timeE);			
				document.getElementsById("surEndTime").value=result;		
				}
			
			 $(".surEndTime").html(Sum);
		})	
	</script>
</body>
</html>