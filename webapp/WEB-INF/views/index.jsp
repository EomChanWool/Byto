<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
			<!DOCTYPE html>
			<html>

			<head>
				<title>ByTO: 바이토</title>
				<c:import url="./head.jsp"></c:import>
				<link href="${pageContext.request.contextPath}/static/css/index.css" rel="stylesheet" />
			</head>

			<body>
				<c:import url="./header.jsp"></c:import>
				<!-- Section-->
				<section class="py-5">
					<!-- Header-->
					<header class="py-5">
						<div class="text-center text-white">
							<h1>ByTO: 바이토</h1>
							<p class="text-white-50">자유로운 중고제품 구매 / 판매 공간</p>

						</div>

					</header>

					<div id="carouselExampleCaptions" class="carousel slide" data-bs-ride="carousel">
						<div class="carousel-indicators">
							<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="0"
								class="active" aria-current="true" aria-label="Slide 1"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="1"
								aria-label="Slide 2"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="2"
								aria-label="Slide 3"></button>
							<button type="button" data-bs-target="#carouselExampleCaptions" data-bs-slide-to="3"
								aria-label="Slide 4"></button>
						</div>
						<div class="carousel-inner">
							<div class="carousel-item active">
								<div>
									<img src="/img/carousel/5.png" class="d-block w-100" height="300px" alt="...">
								</div>
								<div class="carousel-caption d-none d-md-block">
									<h5 class="m-0 text-center text-white">의류/잡화</h5>
									<a class="btn btn-success2 mt-auto"
										href="${pageContext.request.contextPath}/product/search?q=c1&value=0">카테고리
										이동</a>
								</div>
							</div>
							<div class="carousel-item">
								<img src="/img/carousel/22.png" class="d-block w-100" height="300px" alt="...">

								<div class="carousel-caption d-none d-md-block">
									<h5 class="m-0 text-center text-white">전자기기</h5>
									<a class="btn btn-success2 mt-auto"
										href="${pageContext.request.contextPath}/product/search?q=c1&value=1">카테고리
										이동</a>
								</div>
							</div>
							<div class="carousel-item">
								<img src="/img/carousel/19.png" class="d-block w-100" height="300px" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5 class="m-0 text-center text-dark">가구/인테리어</h5>
									<a class="btn btn-success2 mt-auto"
										href="${pageContext.request.contextPath}/product/search?q=c1&value=2">카테고리
										이동</a>
								</div>
							</div>
							<div class="carousel-item">
								<img src="/img/carousel/32.png" class="d-block w-100" height="300px" alt="...">
								<div class="carousel-caption d-none d-md-block">
									<h5 class="m-0 text-center text-dark">게임/취미</h5>
									<a class="btn btn-success2 mt-auto"
										href="${pageContext.request.contextPath}/product/search?q=c1&value=3">카테고리
										이동</a>
								</div>
							</div>

						</div>
						<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide="prev">
							<span class="carousel-control-prev-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Previous</span>
						</button>
						<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleCaptions"
							data-bs-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="visually-hidden">Next</span>
						</button>
					</div>
					<br>
					<br>
					<div class="small text-center">
						<h3> 최근 등록된 상품</h3>
					</div>
					<br>


					<div class="container">
						<c:if test="${empty list}">
							<div class="py-5">
								<h1>등록된 제품이 없습니다..</h1>
								<h1>가장 먼저 제품을 등록해보세요!!!</h1>
								<h3>
									<a href="${pageContext.request.contextPath}/product/add">제품
										등록하기</a>
								</h3>
							</div>
						</c:if>
						<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
							<!-- 한 제품목록의 시작 -->
							<c:forEach var="item" items="${list}">
								<div class="col mb-5">
									<div class="card h-100">
										<!-- Product image-->
										<div class="product-img">
											<a
												href="${pageContext.request.contextPath}/product/view?product_num=${item.product_num}">
												<img class="card-img-top"
													src="${pageContext.request.contextPath}${item.path1}"
													alt="${item.product_name}" />
											</a>
										</div>
										<!-- Product details-->
										<div class="card-body p-4">
											<div class="text-center">
												<!-- Product name-->
												<h5 class="fw-bolder">${item.product_name}</h5>
												<!-- Product price-->
												<fmt:formatNumber value="${item.product_price}" pattern="#,###원" />
											</div>
										</div>
										<!-- Product actions-->
										<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
											<div class="text-center">
												<a class="btn btn-outline-dark mt-auto"
													href="${pageContext.request.contextPath}/product/view?product_num=${item.product_num}">상품페이지로
													이동</a>
											</div>
										</div>
									</div>
								</div>
							</c:forEach>
							<!-- 한 제품목록의 끝 -->
						</div>
					</div>
				</section>
				<c:import url="./footer.jsp"></c:import>
			</body>

			</html>