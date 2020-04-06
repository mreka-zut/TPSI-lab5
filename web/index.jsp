<%-- 
    Document   : index
    Created on : 2020-03-21, 16:50:10
    Author     : micha
--%>
<%@page session="true" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <p>Liczba wyświetleń w sesji: ${sessionScope.counter}</p>

        <form action='/lab5/studentAdd' method='post'>
            <table style="text-align: left">
                <tr>
                    <td>
                        Imię:
                    </td>
                    <td>
                        <input type='text' name='name'>
                    </td>
                </tr>
                <tr>
                    <td>
                        Nazwisko:
                    </td>
                    <td>
                        <input type='text' name='surname'>
                    </td>
                </tr>
                <tr>
                    <td>
                        Email:
                    </td>
                    <td>
                        <input type='text' name='email'>
                    </td>
                </tr>
                <td></td>
                <td>            
                    <p><input type='submit'></p>
                </td>
            </table>
        </form>
        <div id="studentAddError" style="color: red;">${sessionScope.studentAddError}</div>
        <c:choose>
            <c:when test="${sessionScope.students == null}">
                <p>Nie dodano jeszcze żadnych studentów podczas tej sesji.</p>
            </c:when>    
                <c:otherwise>
                    <table style="text-align: center;width:30%;">
                    <tr>
                        <th>
                            Imię
                        </th>
                        <th>
                            Nazwisko
                        </th>
                        <th>
                            Email
                        </th>
                    </tr>
                    <c:forEach items="${sessionScope.students}" var="student">
                        <tr>
                            <td>
                                ${student.getName()}
                            </td>
                            <td>
                                ${student.getSurname()}
                            </td>
                            <td>
                                <a href="${student.getEmail()}">${student.getEmail()}</a>
                            </td>
                        </tr>
                    </c:forEach>
                    </table>
                </c:otherwise>
        </c:choose>
    </body>
</html>
