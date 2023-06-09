<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8" />
				<title>ByTO: 바이토 - 제품목록</title>
				<c:import url="../head.jsp"></c:import>
				<link rel="stylesheet" href="/static/css/product_list.css" />
			</head>

			<body>
				<c:import url="../header.jsp"></c:import>
				<section class="py-5">

					<div class="container">
						<!--
						<button type="button" class="btn btn-secondary"><a class="badge text-bg-light"
								href="${pageContext.request.contextPath}/product/search?q=c1&value=0">의류/잡화</a>
							<span class="badge text-bg-secondary"></span>
						</button>
						<button type="button" class="btn btn-secondary"><a class="badge text-bg-light"
								href="${pageContext.request.contextPath}/product/search?q=c1&value=1">전자기기</a>
							<span class="badge text-bg-secondary"></span>
						</button>
						<button type="button" class="btn btn-secondary"><a class="badge text-bg-light"
								href="${pageContext.request.contextPath}/product/search?q=c1&value=2">가구/인테리어</a>
							<span class="badge text-bg-secondary"></span>
						</button>
						<button type="button" class="btn btn-secondary"><a class="badge text-bg-light"
								href="${pageContext.request.contextPath}/product/search?q=c1&value=3">게임/취미</a>
							<span class="badge text-bg-secondary"></span>
						</button>
						<button type="button" class="btn btn-secondary"><a class="badge text-bg-light"
								href="${pageContext.request.contextPath}/product/search?q=c1&value=4">도서/음반/문구</a>
							<span class="badge text-bg-secondary"></span>
						</button>
						<button type="button" class="btn btn-secondary"><a class="badge text-bg-light"
								href="${pageContext.request.contextPath}/product/search?q=c1&value=5">공구/산업용품</a>
							<span class="badge text-bg-secondary"></span>
						</button>
						-->
						<!-- 검색 Form -->
						<div class="search-form text-center">
							<form action="${pageContext.request.contextPath}/product/search" method="get">
								<select class="form-select" name="q" id="q" aria-label="query">
									<option ${q=='product_name' ?'selected':''} value="product_name">제품
										이름</option>
									<option ${q=='user_id' ?'selected':''} value="user_id">작성자
										ID</option>
									<!--   <option ${q=='c1'?'selected':''} value="c1">대분류</option>
                            <option ${q=='c2'?'selected':''} value="c2">중분류</option>
                            <option ${q=='c3'?'selected':''} value="c3">소분류</option> -->
								</select> <input class="form-control" type="text" placeholder="검색..." name="value"
									aria-label="검색" value="" />
								<button type="submit" class="btn btn-outline-primary">검색</button>
							</form>
						</div>
						<!-- 페이지 제목 -->
						<div class="py-3">
							<h1>제품 목록</h1>
						</div>
						<c:import url="./importList.jsp"></c:import>
					</div>
				</section>
				<c:import url="../footer.jsp"></c:import>
			</body>

			</html>