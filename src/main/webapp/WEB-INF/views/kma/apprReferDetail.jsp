<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	#line-dept>*{
		display:none
	}
</style>
</head>
<body>
	<jsp:include page="../common/navbar.jsp" />
	<div class="main-panel">
		<div class="content-wrapper">

			<div class="card">
				<div class="card-body">
					<p style="font-size: 22px;">
						전자결재 &nbsp;|&nbsp; <b>기안문서함</b>
					</p>
					<hr>
					<br>
					<div class="appr-table-wrapper" style="margin-left:30px;">
						<button type="button" class="btn btn-outline-success btn-green" 
							    style="width: 100px;" onclick="history.back();">
							<i class="mdi mdi-subdirectory-arrow-left menu-icon"></i>&nbsp; 
							<span>이전목록</span>
						</button>
					
						<table class="table table-bordered appr-table">
							<tr>
								<th width="225">기안부서</th>
								<td width="300">${ s.deptName }</td>
								<th width="225">기안자</th>
								<td width="300">${ s.empName }</td>
							</tr>
							<tr>
								<th width="225">문서번호</th>
								<td width="300" id="apprNo">${ s.apprNo }</td>
								<th width="225">문서보존기간</th>
								<td width="300">5년</td>
							</tr>
							<tr>
								<th width="225" height="150">신청</th>
								<td width="300" style="margin: 0; padding: 0;">
									<table class="table table-bordered appr-inner-table">
										<tr>
											<th>${ s.jobName }</th>
											<th></th>
											<th></th>
										</tr>
										<tr align="center">
											<td height="90">
												<img src="resources/images/kma/approved.png">${ s.enrollDate }
											</td>
											<td></td>
											<td></td>
										</tr>
										<tr align="center">
											<td>${ s.empName }</td>
											<td></td>
											<td></td>
										</tr>
									</table>
								</td>
								<th width="225" height="150">처리</th>
								<td width="300" style="margin: 0; padding: 0;">
									<table class="table table-bordered appr-inner-table">
										<tr id="line-job">
											<th></th>
											<th></th>
											<th></th>
										</tr>
										<tr align="center" id="line-appr">
											<td height="90"></td>
											<td></td>
											<td></td>
										</tr>
										<tr align="center" id="line-emp">
											<td></td>
											<td></td>
											<td></td>
										</tr>
										<tr id="line-dept">
											<td></td>
											<td></td>
											<td></td>
										</tr>
									</table>
								
									<script>
									
										$(document).ready(function(){ // 테이블에 출력할 요소
											
											let jobArr = [];
											<c:forEach var="i" items="${ line }">
												jobArr.push( "${i.jobName}" );
											</c:forEach>
											
											$('#line-job').children().each(function(index, item){ // 직급 출력

												$(item).text(jobArr[index]);
											})
											
											let empArr = [];
											let empNoArr = [];
											let deptArr = [];
											<c:forEach var="i" items="${ line }">
												empArr.push( "${i.empName}" );
												empNoArr.push( "${i.empNo}" );
												deptArr.push("${i.deptName}");
											</c:forEach>
											
											$('#line-emp').children().each(function(index, item){ // 이름 출력
													
												$(item).text(empArr[index]);
												//$(item).attr('id', empNoArr[index]);
											})
											
											$('#line-dept').children().each(function(index, item){ // 부서 출력
												
												if(deptArr[index] != "" && typeof deptArr[index] != 'undefined' && deptArr[index] != null){
													$(item).text(deptArr[index]);
												}
											})
											
											for(let i in empNoArr){
												$('#line-emp').append("<td style='display:none' class='empNo'>" + empNoArr[i] + "</td>");
											}
											
											
											let dateArr = [];
											<c:forEach var="i" items="${ line }">
												dateArr.push( "${i.lineDate}" );
											</c:forEach>
													
											$('#line-appr').children().each(function(index, item){ // 승인도장 + 날짜 출력
												
												if( dateArr[index] != "" && typeof dateArr[index] != 'undefined' ){ 
													$(item).html("<img src='resources/images/kma/approved.png'>" + dateArr[index]);
												}												
											})
											
											let refArr = [];
											<c:forEach var="r" items="${ ref }">
												refArr.push( "${r.empName}" );
											</c:forEach>
											
											$("#ref-name").text(refArr.join(", ")); // 참조자 이름 출력
											
											// -------- 재기안을 위한 data ------ //
											
											$("#line-emp").children('.empNo').each(function(index, item){ // 결재자들 form에 넘기기 
												$("#againReport").append("<input type='hidden' value='" + $(item).text() + "' name='lineList[" + index + "].empNo'>");
											})
											
											$("#line-dept").children().each(function(index, item){ // 결재자들 부서명 form에 넘기기 
												
												if( $(item).text() != null && $(item).text() != "" && $(item).text() != "undefined"){
													$("#againReport").append("<input type='hidden' value='" + $(item).text() + "' name='lineList[" + index + "].deptName'>");
												}
												
												
												
											})
											
											// 문서내용 form에 넘기기
											$("#againReport").append("<input type='hidden' value='" + $("#apprContent").html() + "' name='apprContent'>");
											
											// 제목 form에 넘기기
											$("#againReport").append("<input type='hidden' value='" + $("#apprTitle").text() + "' name='apprTitle'>");
										})
										
										
									</script>
								</td>
							</tr>
							<tr>
								<th>참조자</th>
								<td colspan="5" id="ref-name"></td>
							</tr>
							<tr>
								<th>제목</th>
								<td colspan="5" id="apprTitle">${ s.apprTitle }</td>
							</tr>
							<tr>
								<th>첨부파일</th>
								<td colspan="5">
									<i class="mdi mdi-paperclip"></i>&nbsp;
									<c:choose>
			                    		<c:when test="${ empty s.originName }">
			                    			첨부파일이 없습니다.
			                    		</c:when>
			                    		<c:otherwise>
			                        		<a href="${ s.changeName }" download="${ s.originName }">${ s.originName }</a>
			                        	</c:otherwise>
			                        </c:choose>
								</td>
							</tr>
						</table>
							
						<c:choose>
							<c:when test="${ s.formNo eq 1 }">
								<!-- 결재양식이 휴가신청서일 경우 -->
								<br><br>
								<h3 align="center" style="font-weight: 550;">휴가 신청서</h3>
								<br>
								<br>
								<table class="table table-bordered appr-table" >
		                            <tr>
		                              <th width="350">종류</th>
		                              <td>연차</td>
		                            </tr>
		                            <tr>
		                              <th>일수</th>
		                              <td>${ v.vacDays }일</td>
		                            </tr>
		                            <tr>
		                              <th>사유</th>
		                              <td>${ v.vacCause }</td>
		                            </tr>
		                        </table>
							</c:when>
							<c:when test="${ s.formNo eq 2 }">
								<!-- 결재양식이 연장근무일 경우 -->
								<br><br>
								<h3 align="center" style="font-weight: 550;">연장근무 신청서</h3>
								<br>
								<br>
								<table class="table table-bordered appr-table">
									<tr>
										<th width="350">근무날짜</th>
										<td>${ o.overDate }</td>
									</tr>
									<tr>
										<th>근무시작시간</th>
										<td colspan="5">${ o.startTime }</td>
									</tr>
									<tr>
										<th>근무종료시간</th>
										<td colspan="5">${ o.endTime }</td>
									</tr>
									<tr>
										<th>총근무시간</th>
										<td colspan="5">${ o.totalTime }시간</td>
									</tr>
									<tr>
										<th>근무사유</th>
										<td colspan="5">${ o.overCause }</td>
									</tr>
								</table>
							</c:when>
							<c:otherwise>
								<!-- 결재양식이 에디터폼일 경우 -->
								<table class="table table-bordered appr-table" >
									<tr>
										<td colspan="8" align="center" id="apprContent">
											<br><br>
											${ s.apprContent }
											<br><br>
										</td>
									</tr>
								</table>
							</c:otherwise>
						</c:choose>
						<br><br>
						<hr>
						<br><br>
						<table class="table table-bordered appr-table" id="appr-comment">
							<tr>
								<th colspan="5">&nbsp;결재의견 &nbsp;
									<span>(${fn:length(comment)})</span>
								</th>
							</tr>
							<c:choose> 
								<c:when test="${ empty comment }">
									<tr>
										<td colspan="5" align="center">
											결재의견이 없습니다.
										</td>
									</tr>
								</c:when>
								<c:otherwise>
									<c:forEach var="c" items="${ comment }">
										<tr>
											<td colspan="5">
												<b>${ c.empName }</b> &nbsp;&nbsp;|&nbsp;&nbsp;
												${ c.lineComment }
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>