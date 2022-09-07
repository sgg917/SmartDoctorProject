<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Purple Admin</title>
<!-- plugins:css -->
<link rel="stylesheet"
	href="assets/vendors/mdi/css/materialdesignicons.min.css">
<link rel="stylesheet" href="assets/vendors/css/vendor.bundle.base.css">
<!-- endinject -->
<!-- Plugin css for this page -->
<!-- End plugin css for this page -->
<!-- inject:css -->
<!-- endinject -->
<!-- Layout styles -->
<link rel="stylesheet" href="assets/css/style.css">
<!-- End layout styles -->
<link rel="shortcut icon" href="assets/images/favicon.ico" />
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- fullcalendar CDN -->
<link
	href='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.css'
	rel='stylesheet' />
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/main.min.js'></script>
<!-- fullcalendar 언어 CDN -->
<script
	src='https://cdn.jsdelivr.net/npm/fullcalendar@5.8.0/locales-all.min.js'></script>


<link href='/resources/fullcalendar-5.6.0/lib/main.css' rel='stylesheet' />
<script src='/resources/fullcalendar-5.6.0/lib/main.js'></script>
<script>
   
         document.addEventListener('DOMContentLoaded', function() {
           var calendarEl = document.getElementById('calendar');
           var calendar = new FullCalendar.Calendar(calendarEl, {
             initialView: 'dayGridMonth'
           });
           calendar.render();
         });
   
   </script>

<!--아래는 내가 먹인 스타일임 다 가져가야함-->
<style>
.wrap11 {
	width: 100%;
	height: 90%;
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
	padding-left: 10px;
	color: rgb(65, 125, 122);
}

.wrap22 {
	width: 95%;
	margin: auto;
}
</style>




</head>


</head>
<body>

	<div class="container-scroller">



		<jsp:include page="common/navbar.jsp" />

		<div class="main-panel">
			<div class="content-wrapper">
				<!-- 이 안에서 작업해 주세요 -->
				<h3>
					<b>차트번호 0321-0987 수술실 수정</b>
				</h3>
				<hr>
				<br>

				<div class="wrap11">
					<br>
					<div class="wrap22">
						<div class="part1">
							<table class="table1">
								<tr>
									<td colspan="2" width="600px">
										<div class="smallbtn1">입력</div>
										<div style="display: inline-block; margin-left: 30px;">
											<h3>2022-08-30</h3>
										</div>
										<hr>
									</td>
								</tr>
								<tr>
									<th>차트번호</th>
									<td><input type="text" style="width: 300px;"></td>
								</tr>
								<tr>
									<th>수진자명</th>
									<td><input type="text" style="width: 300px;"></td>
								</tr>
								<tr>
									<th>수술실</th>
									<td>
									<select name="OProom" id="" style="width: 300px;">
											<option value="x">선택안함</option>
											<option value="a">operatingA</option>
											<option value="b">operatingB</option>
											<option value="c">operatingC</option>
											<option value="d">operatingD</option>
									</select> <!--
				                    <button onclick="test();">확인</button>
				                    <br>
				                    선택한 나라: <span id="result">선택안함</span> --> <script>
				                        function test(){
				                            //현재 선택된(selected 상태) option 요소 가져오기
				                            console.log($("option:selected").val());
				                            console.log($("option:selected").html());
				                
				                            $("#result").html($("option:selected").html());
				                
				                        }
				                    </script>
				                    </td>
								</tr>
								<tr>
									<th>예약날짜</th>
									<td><input type="date" style="width: 300px;"><br></td>
								</tr>
								<tr>
									<th>예약시각</th>
									<td><input type="time" style="width: 300px;"></td>
								</tr>
								<tr>
									<th>예상완료시각</th>
									<td><input type="text" readonly
										value="차트에서 소요시간 가져와서 + 로 완료시각 만들기" style="width: 300px;"></td>
								</tr>
								<tr>
									<th>진료과</th>
									<td><select name="OProom" id="" style="width: 300px;">
											<option value="x">선택안함</option>
											<option value="gd">외과</option>
											<option value="med">내과</option>
											<option value="np">이비인후과</option>
											<option value="ent">정신과</option>
									</select> <!--
			                    <button onclick="test();">확인</button>
			                    <br>
			                    선택한 나라: <span id="result">선택안함</span> --> <script>
			                        function test(){
			                            //현재 선택된(selected 상태) option 요소 가져오기
			                            console.log($("option:selected").val());
			                            console.log($("option:selected").html());
			                
			                            $("#result").html($("option:selected").html());
			                
			                        }
			                    </script></td>
								</tr>
								<tr>
									<th>담당의</th>
									<td><input type="text" style="width: 300px;"></td>
								</tr>
								<tr>
									<th>특이사항</th>
									<td><textarea type="text"
											style="width: 300px; height: 100px; resize: none;"></textarea></td>
								</tr>


							</table>
						</div>
						<br> <br>
						<button type="button" class="btn btn-danger"
							style="height: 30px; width: 100px; padding: 0%; color: black; background-color: rgb(65, 125, 122);">수정</button>
						<button type="button" class="btn btn-danger"
							style="height: 30px; width: 100px; padding: 0%; color: black;">수술취소</button>
						<button type="button" class="btn btn-secondary"
							style="height: 30px; width: 100px; padding: 0%; color: black;">뒤로가기</button>
						<br> <br> <br>
					</div>
					<div id='calendar' class="calender1"></div>
				</div>
				<jsp:include page="common/footer.jsp" />
			</div>


		</div>

		<!-- plugins:js -->
		<script src="resources/vendors/js/vendor.bundle.base.js"></script>
		<!-- endinject -->
		<!-- Plugin js for this page -->
		<script src="resources/vendors/chart.js/Chart.min.js"></script>
		<script src="resources/js/jquery.cookie.js" type="text/javascript"></script>
		<!-- End plugin js for this page -->
		<!-- inject:js -->
		<script src="resources/js/off-canvas.js"></script>
		<script src="resources/js/hoverable-collapse.js"></script>
		<script src="resources/js/misc.js"></script>
		<!-- endinject -->
		<!-- Custom js for this page -->
		<script src="resources/js/dashboard.js"></script>
		<script src="resources/js/todolist.js"></script>
		<!-- End custom js for this page -->
</body>
</html>