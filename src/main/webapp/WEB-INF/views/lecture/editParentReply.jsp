<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    
    <jsp:include page="/WEB-INF/views/common/header.jsp"/>
    
    <title>수강평 수정</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f5f5f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
        }

        .guidelines-container {
            background-color: #fff;
            width: 100%;
            max-width: 800px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
            border-left: 6px solid #007bff;
            margin-bottom: 20px;
        }

        .guidelines-container h3 {
            color: #007bff;
            margin-bottom: 10px;
        }

        .guidelines-container ul {
            margin: 0;
            padding-left: 20px;
            color: #333;
            line-height: 1.6;
        }

        .guidelines-container ul li {
            margin-bottom: 10px;
            font-size: 16px;
        }

        .edit-container {
            background-color: #fff;
            width: 100%;
            max-width: 600px;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }

        textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 16px;
            resize: none;
        }

        .btn {
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            text-align: center;
            text-decoration: none;
        }

        .btn-primary {
            background-color: #362D4B;
            color: #fff;
            border: none;
        }

        .btn-primary:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #f8f9fa;
            color: #333;
            border: 1px solid #ccc;
        }

        .btn-secondary:hover {
            background-color: #e2e6ea;
        }
        
        
            .guidelines-container h3 {
        color: #362D4B; /* 글씨 색깔 */
        font-size: 28px; /* 글씨 크기 */
        font-weight: bold; /* 글씨 굵기 */
        margin-bottom: 10px;
    }
        
    </style>
    
</head>
<body>

    <!-- 수강평 작성 가이드 -->
    <div class="guidelines-container">
        <h3 >수강평 작성(수정) 시 유의사항</h3>
        <ul>
            <li>강의에 대한 구체적인 피드백을 제공해주세요.</li>
            <li>긍정적인 부분과 개선할 점을 균형 있게 작성해주세요.</li>
            <li>다른 수강생들에게 유익한 정보를 포함해주세요.</li>
            <li>비속어나 부적절한 표현을 삼가주세요.</li>
            <li>강의와 무관한 내용은 포함하지 마세요.</li>
        </ul>
    </div>

    <!-- 수강평 수정 -->
    <div class="edit-container">
        <h2>수강평 수정</h2>
        <form action="${pageContext.request.contextPath}/lecture/editParentReply.do" method="post">
            <input type="hidden" name="reviewNo" value="${review.reviewNo}">
            <input type="hidden" name="lectureNo" value="${lectureNo}">
            <textarea name="reviewContent" rows="5" placeholder="수강평 내용을 입력하세요">${review.reviewContent}</textarea>
            <div class="buttons">
                <button type="submit" class="btn btn-primary">수정 완료</button>
                <a href="${pageContext.request.contextPath}/lecture/registrationClassMain.do?lectureNo=${lectureNo}" class="btn btn-secondary">취소</a>
            </div>
        </form>
    </div>

    <jsp:include page="/WEB-INF/views/common/footer.jsp"/>

</body>
</html>
