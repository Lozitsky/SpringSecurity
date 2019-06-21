<%--
  Created by IntelliJ IDEA.
  User: Надія
  Date: 21.06.2019
  Time: 1:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Insert title here</title>


</head>

<body>

<c:if test="${not empty error}">
    ${error}
</c:if>

<%--<c:url value='' var="login_"/>--%>
<c:url value="/check_user" var="login_"/>
<form name='form_login' action="${login_}" method='post'>
    <table>
        <tr>
            <td>User:</td>
            <td><input type='text' name='user_login' value=''></td>
        </tr>
        <tr>
            <td>Password:</td>
            <td><input type='password' name='password_login'/></td>
        </tr>
        <tr>
            <td><input type="hidden"
                       name="${_csrf.parameterName}"
                       value="${_csrf.token}"/></td>
        </tr>
        <tr>
            <td><input name="submit" type="submit" value="submit"/></td>
        </tr>
    </table>
</form>


</body>
</html>