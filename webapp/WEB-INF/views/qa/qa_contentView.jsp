<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
        <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
            <!DOCTYPE html>
            <html>

            <head>
                <meta charset="UTF-8" />
                <title>ByTO: 바이토 - ${n.qa_title}</title>
                <c:import url="../head.jsp" />
                <script>
                    qareplyList = {};
                    function toggleQaReply(qareply_num) {
                        $(`#form-${"${qareply_num}"}`).slideToggle();
                    }
                    function editQaReply(qareply_num) {
                        const qareply = $(`#qareply-${"${qareply_num}"}`);
                        if (qareplyList[qareply_num] === undefined) {
                            qareplyList[qareply_num] = qareply.text();
                            let html = `
                    <form action="${pageContext.request.contextPath}/qareply/edit" method="post">
                        <div class="input-group edit-qareply">
                            <textarea name="qareply_content" class="form-control" rows="4" aria-describedby="qareply" required>${"${qareply.text()}"}</textarea>
                            <button class="btn btn-outline-secondary qareply-btn" type="submit">댓글 수정</button>
                        </div>
                        <input type="hidden" name="qareply_num" value="${"${qareply_num}"}" />
                    </form>`;
                            qareply.css("white-space", "normal");
                            qareply.html(html);
                        } else {
                            qareply.text(qareplyList[qareply_num]);
                            qareply.css("white-space", "pre");
                            qareplyList[qareply_num] = undefined;
                        }
                    }
                    function deleteQaReply(qareply_num) {
                        $.ajax({
                            type: "post",
                            url: "${pageContext.request.contextPath}/qareply/delete",
                            data: { qareply_num },
                            success: function (response) {
                                alert("댓글이 삭제되었습니다.");
                                location.href = location.href.split("#")[0];
                            },
                        });
                    }

                    function loginbutton(loginbutton) {
                        alert("로그인")
                    }

                    // 댓글 입력
                    $(".add-qareply-form").submit(function (e) {
                        e.preventDefault();
                        if ("${sessionScope.user_id}" === "") {
                            const goLogin = confirm("로그인이 필요한 기능입니다. 로그인하시겠습니까?");
                            if (goLogin) {
                                location.href = `${pageContext.request.contextPath}/member/loginForm?refer=${"${location.href}"}`;
                            } else {
                                $(this)[0].reset();
                            }
                        } else {
                            $(this)[0].submit();
                        }
                    });
                </script>
            </head>

            <body>
                <!-- navbar 영역 시작 -->
                <c:import url="../header.jsp" />
                <!-- navbar 영역 끝 -->

                <section class="py-5">
                    <div class="container">
                        <div class="py-3">
                            <h1>Q/A 문의내역</h1>

                        </div>
                        <hr class="dropdown-divider" />
                        <c:import url="/qa/Board"></c:import>
                        <div class="col-md-12">
                            <form id="contentForm" action="${pageContext.request.contextPath}">
                                <input type="hidden" name="qa_num" value="${n.qa_num}" />
                                <div class="mb-3">
                                    <h1>${n.qa_title}</h1>

                                </div>
                                
								 <div class="mb-3">
                      			     <h1>${n.qa_user}</h1>
                       			 </div>

                                <div class="mb-3">
                                    <fmt:formatDate value="${n.qa_date}" pattern="YYYY년 MM월 dd일 hh:mm" />
                                </div>
                                <hr class="dropdown-divider" />
                                <div class="mb-3">
                                    <div class="content fs-2" style="white-space: pre">${n.qa_content}</div>
                                </div>
                                <hr class="dropdown-divider" />
                            </form>
                            <!--폼끝 -->

                            <div class="dropdown-divider my-3"></div>
                            <div class="qareplys" id="qareply-add-form">
                                <!-- 댓글 등록 폼 -->

                                <form action="${pageContext.request.contextPath}/qareply/add" method="post"
                                    class="add-qareply-form">
                                    <div class="input-group add-qareply">
                                        <textarea name="qareply_content" class="form-control" rows="4"
                                            aria-describedby="qareply" required></textarea>


                                        <c:choose>
                                            <c:when test="${user_type==1 || user_type==2}">
                                                <button class="btn btn-outline-secondary qareply-btn" type="submit">댓글
                                                    등록</button>
                                            </c:when>
                                            <c:otherwise>
                                                <button class="btn btn-outline-secondary qareply-btn" type="reset"
                                                    id="loginbutton">로그인 후 등록가능</button>
                                            </c:otherwise>
                                        </c:choose>




                                    </div>
                                    <input type="hidden" name="aaa" value="댓글" />
                                    <input type="hidden" name="user_id" value="${sessionScope.user_id}" />
                                    <input type="hidden" name="qa_num" value="${n.qa_num}" />
                                    <input type="hidden" name="parent_qareply_num" value="-1" />
                                </form>

                                <!-- 댓글 목록 -->
                                <ul class="list-group qareplys">
                                    <c:forEach var="qareply" items="${r.qareplys}">
                                        <c:set var="status"
                                            value="${qareply.qareply_content==null?'deleted':n.user_id==qareply.user_id?'seller':'other'}" />
                                        <c:set var="className"
                                            value="${qareply.qareply_content==null?'deleted':n.user_id==qareply.user_id?'primary':'info'}" />
                                        <%-- 한개의 댓글 내용 --%>
                                            <c:choose>
                                                <%-- 댓글이 정상상태인 경우 --%>
                                                    <c:when test="${status!='deleted'}">
                                                        <li
                                                            class="list-group-item list-group-item-${className} ${status}">
                                                            <div class="qareply-content"
                                                                id="qareply-${qareply.qareply_num}">
                                                                ${qareply.qareply_content}</div>
                                                            <div class="qareply-writer">

                                                            </div>
                                                            <div class="qareply-menu mt-3">
                                                                <c:if test="${sessionScope.user_id!=null}">
                                                                    <a onclick="toggleQaReply(`${qareply.qareply_num}`)"
                                                                        title="댓글"><i class="fas fa-qareply"></i> 댓글</a>
                                                                </c:if>
                                                                <c:if test="${qareply.user_id==sessionScope.user_id}">
                                                                    <span> | </span>
                                                                    <a onclick="editQaReply(`${qareply.qareply_num}`)"
                                                                        title="수정"><i class="fas fa-edit"></i> 수정</a>
                                                                    <span> | </span>
                                                                    <a onclick="deleteQaReply(`${qareply.qareply_num}`)"
                                                                        title="삭제"><i class="fas fa-trash"></i> 삭제</a>
                                                                </c:if>
                                                            </div>
                                                        </li>
                                                        <%-- 댓글 내용 끝 & 댓글의 댓글 추가 폼 --%>



                                                            <form
                                                                action="${pageContext.request.contextPath}/qareply/add"
                                                                method="post" class="add-child-qareply-form"
                                                                id="form-${qareply.qareply_num}" style="display: none">
                                                                <div class="input-group">
                                                                    <textarea name="qareply_content"
                                                                        class="form-control" rows="4"
                                                                        aria-describedby="qareply" required></textarea>
                                                                    <button
                                                                        class="btn btn-outline-secondary child-qareply-btn"
                                                                        type="submit">댓글 등록</button>
                                                                </div>
                                                                <input type="hidden" name="user_id"
                                                                    value="${sessionScope.user_id}" />
                                                                <input type="hidden" name="qa_num"
                                                                    value="${n.qa_num}" />
                                                                <input type="hidden" name="parent_qareply_num"
                                                                    value="${qareply.qareply_num}" />
                                                            </form>




                                                            <%-- 댓글의 댓글 폼 끝 --%>
                                                    </c:when>
                                                    <%-- 댓글이 삭제된 상태인 경우 --%>
                                                        <c:otherwise>
                                                            <li
                                                                class="list-group-item list-group-item-${className} ${status}">
                                                                <div class="qareply-content">삭제된 댓글 입니다.</div>
                                                            </li>
                                                        </c:otherwise>
                                            </c:choose>
                                            <%-- 하위 댓글이 있는 경우 --%>
                                                <c:if test="${not empty qareply.child_qareply}">
                                                    <c:forEach var="c_qareply" items="${qareply.child_qareply}">
                                                        <c:set var="child_status"
                                                            value="${c_qareply.qareply_content==null?'deleted':n.user_id==c_qareply.user_id?'seller':'other'}" />
                                                        <c:set var="child_className"
                                                            value="${c_qareply.qareply_content==null?'deleted':n.user_id==c_qareply.user_id?'primary':'info'}" />
                                                        <c:choose>
                                                            <c:when test="${child_status!='deleted'}">
                                                                <li
                                                                    class="list-group-item list-group-item-${child_className} ${child_status} child-qareply">
                                                                    <div id="qareply-${c_qareply.qareply_num}"
                                                                        class="child qareply-content">
                                                                        ${c_qareply.qareply_content}</div>
                                                                    <div class="child qareply-writer">
                                                                        <c:if
                                                                            test="${n.user_id==sessionScope.user_id && n.qa_result != 2}">

                                                                        </c:if>
                                                                        ${c_qareply.member.user_nickname}
                                                                        (${c_qareply.user_id})
                                                                        <c:if
                                                                            test="${n.user_id==sessionScope.user_id && n.qa_result != 2}">

                                                                        </c:if>
                                                                    </div>
                                                                    <%-- 댓글 쓴 사람==로그인 한 사람 --%>
                                                                        <c:if
                                                                            test="${c_qareply.user_id==sessionScope.user_id}">
                                                                            <div class="child qareply-menu mt-3">
                                                                                <a onclick="editQaReply(`${c_qareply.qareply_num}`)"
                                                                                    title="수정"><i
                                                                                        class="fas fa-edit"></i> 수정</a>
                                                                                <span> | </span>
                                                                                <a onclick="deleteQaReply(`${c_qareply.qareply_num}`)"
                                                                                    title="삭제"><i
                                                                                        class="fas fa-trash"></i> 삭제</a>
                                                                            </div>
                                                                        </c:if>
                                                                </li>
                                                            </c:when>
                                                            <c:otherwise>
                                                                <li
                                                                    class="list-group-item list-group-item-${child_className} ${child_status} child-qareply">
                                                                    <div class="child qareply-content">삭제된 댓글 입니다.</div>
                                                                </li>
                                                            </c:otherwise>
                                                        </c:choose>
                                                    </c:forEach>
                                                </c:if>
                                    </c:forEach>
                                </ul>
                            </div>


                            <!-- 목록버튼 -->
                            <form id="contentForm2" action="${pageContext.request.contextPath}">
                                <div class="mb-3">
                                    <hr class="dropdown-divider" />
                                    <c:if test="${user_type==1}">
                                        <button class="btn btn-danger del-btn" type="button"
                                            onclick="location.href=`${pageContext.request.contextPath}/qa/qa_delete?qa_num=${n.qa_num}`">
                                            삭제
                                        </button>
                                    </c:if>

                                    <button class="btn btn-primary list-btn" type="button"
                                        onClick="history.back();">목록으로</button>
                                </div>

                            </form>

                        </div>
                    </div>
                </section>
                <!-- footer 영역 시작 -->
                <c:import url="../footer.jsp" />
                <!-- footer 영역 끝 -->
            </body>

            </html>