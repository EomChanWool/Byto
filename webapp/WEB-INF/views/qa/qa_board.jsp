<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ page trimDirectiveWhitespaces="true" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <title>ByTO: 바이토 - Q/A 목록</title>
                <c:import url="../head.jsp" />
            </head>

            <body>
                <c:import url="../header.jsp" />
                <section class="py-5">
                    <div class="container">
                        <div class="py-3">
                            <h1>Q/A 목록</h1>
                            <c:import url="${pageContext.request.contextPath}/api/member/getUserType" var="userType" />
                            <c:choose>
                                <c:when test="${userType == 1}">

                                </c:when>
                                <c:otherwise>
                                    <h6>로그인 후 이용이 가능 합니다</h6>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <table class="table table-hover">
                            <thead>
                                <tr>
                                    <th class="th_num">번호</th>
                                    <th class="th_title">제목</th>
                                    <th class="th_user">작성자</th>
                                    <th class="th_date">작성일</th>
                                    <th class="th_hit">조회</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:if test="${empty list}">
                                    <tr>
                                        <td colspan="5">등록된 문의가 없습니다.</td>
                                    </tr>
                                </c:if>

                                <c:if test="${not empty list}">
                                    <c:forEach var="n" items="${list}" varStatus="status">
                                        <tr>
                                            <td>${n.qa_num}</td>
                                            <td>
                                                <a class="link"
                                                    href="${pageContext.request.contextPath}/qa/qa_contentView?qa_num=${n.qa_num}">${n.qa_title}</a>
                                            </td>
                                            <td>${n.qa_user}</td>
                                            <td>${n.qa_date}</td>
                                            <td>${n.qa_hits}</td>
                                        </tr>
                                    </c:forEach>
                                </c:if>
                            </tbody>
                        </table>

                        <c:import url="${pageContext.request.contextPath}/api/member/getUserType" var="userType" />
                        <c:if test="${userType == 1}">
                            <div class="d-flex justify-content-end">
                                <button type="button" class="btn btn-secondary"
                                    onclick="location.href='${pageContext.request.contextPath}/qa/qa_writing'">
                                    질문 작성
                                </button>
                            </div>
                        </c:if>
                    </div>
                </section>
                <c:import url="../footer.jsp" />
            </body>

            </html>