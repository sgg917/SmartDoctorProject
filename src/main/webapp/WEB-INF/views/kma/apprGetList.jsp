<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    .appr-report-tb>tbody>tr:hover{
 		cursor: pointer;
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
						전자결재 &nbsp;|&nbsp; <b>결재문서함</b>
					</p>
					<hr>
					<br>
					<br>
					<div class="appr-table-wrapper" style="margin-left:40px;">

						<div class="input-group appr-search-div">
							<select name="">
								<option>제목</option>
								<option>결재양식</option>
							</select> <input type="text" class="form-control"
								placeholder="검색어를 입력해주세요">
							<button class="btn appr-write-btn btn-sm" type="button">
								<img src="resources/images/kma/search.png">
							</button>
						</div>
						<table class="table appr-report-tb" id="appr-all-table">
							<!-- 첨부는 제목 옆에 클립 -->
							<thead>
								<tr>
									<th>기안일</th>
									<th>결재양식</th>
									<th>제목</th>
									<th>기안자</th>
									<th>문서번호</th>
									<th>결재상태</th>
								</tr>
							</thead>
							<tbody>
								<c:choose>
									<c:when test="${ empty list }">
										<tr>
											<td colspan="7" align=center>조회 가능한 문서가 없습니다.</td>
										</tr>
									</c:when>
									<c:otherwise>
										<c:forEach var="a" items="${ list }">
											<tr>
												<td>${ a.enrollDate }</td>
												<td>${ a.formTitle }</td>
												<td>${ a.apprTitle } &nbsp;
													<c:if test="${ not empty a.originName }">
														<i class="mdi mdi-paperclip" style="color: gray;"></i>
														<span style="color: gray;">1</span>
													</c:if>
												</td>
												<td>${ a.empName }</td>
												<td class="apprNo">${ a.apprNo }</td>
												<td>
													<c:choose>
														<c:when test="${ a.apprStatus eq '대기' || a.apprStatus eq '진행' }">
															<label class="badge" style="background:RGB(65, 125, 122); border:none;">진행중</label>
														</c:when>
														<c:when test="${ a.apprStatus eq '반려' }">
															<label class="badge" style="background:crimson; border:none;">반려</label>
														</c:when>
														<c:otherwise>
															<label class="badge" style="background:gray; border:none;">완료</label>
														</c:otherwise>
													</c:choose>
												</td>
											</tr>
										</c:forEach>
									</c:otherwise>
								</c:choose>
							</tbody>
						</table>
						
						<script>
							$(function(){
			            		$(".appr-report-tb>tbody>tr").click(function(){
			            			location.href = 'apprGetDetail.si?apprNo=' + $(this).find(".apprNo").text();
			            		})
			            	})
						</script>
						
						<!-- 페이징 -->
						<nav aria-label="Page navigation example" class="appr-page">
							<ul class="pagination">
								<c:choose>
									<c:when test="${ pi.currentPage eq 1 }">
										<li class="page-item disabled"><a class="page-link">Previous</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="apprGetList.si?cpage=${ pi.currentPage - 1 }">Previous</a></li>
									</c:otherwise>
								</c:choose>
								
								<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
										<li class="page-item"><a class="page-link" href="apprGetList.si?cpage=${ p }">${ p }</a></li>
								</c:forEach>
								
								<c:choose>
									<c:when test="${ pi.currentPage eq pi.maxPage }">
										<li class="page-item disabled"><a class="page-link">Next</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="apprGetList.si?cpage=${ pi.currentPage + 1 }">Next</a></li>
									</c:otherwise>
								</c:choose>
								
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>