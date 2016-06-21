<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html
xmlns="http://www.w3.org/1999/xhtml"
xmlns:th="http://www.thymeleaf.org"
xmlns:sec="http://www.thymeleaf.org/thymeleaf-extras-springsecurity3">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
        <div th:if="${param.error}">
用戶或密碼錯誤 ${param}
        </div>
        <div th:if="${param.logout}">
您已登出 
        </div>
        <form th:action="@{/login}" method="post">
            <div><label> 帳號: <input type="text" name="username"/> </label></div>
            <div><label> 密碼 : <input type="password" name="password"/> </label></div>
            <div><input type="submit" value="登录"/></div>
        </form>
    
</body>
</html>