<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--
  Created by IntelliJ IDEA.
  User: Надія
  Date: 21.06.2019
  Time: 23:21
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>Simple Login Form</title>
    <link rel="stylesheet" type="text/css" href="resources/css/reset.css">
    <link rel="stylesheet" type="text/css" href="resources/css/structure.css">
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
</head>

<body>

<c:url value="/check_user" var="login_"/>
<form class="box login" action="${login_}" method='post'>
    <fieldset class="boxBody">
        <label>Username</label>
        <input type="text" name='user_login' value='' tabindex="1" placeholder="put username" required>
        <%--        <label><a href="#" class="rLink" tabindex="5">Forget your password?</a>Password</label>--%>
        <label>Password</label>
        <input type="password" name='password_login' tabindex="2" placeholder="put password" required>
    </fieldset>
    <footer>
        <input type="hidden"
               name="${_csrf.parameterName}"
               value="${_csrf.token}"/>
        <%--        <label><input type="checkbox" tabindex="3">Keep me logged in</label>--%>
        <input type="submit" class="btnLogin" value="Login" tabindex="4">
        <c:if test="${not empty error}">
            <span class="error">${error}</span>
        </c:if>
    </footer>
</form>
<footer id="main">

    <a href="https://github.com/Lozitsky/SpringSecurity">Simple Login Form (HTML5/CSS3 Coded) </a>
</footer>
</body>
</html>
