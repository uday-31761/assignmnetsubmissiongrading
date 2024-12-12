<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
String message=(String)session.getAttribute("msg");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Student</title>
</head>
<body>

<%@include file="adminnavbar.jsp" %>
 <main>
    <h3 style="text-align: center;"><u>student record fetch</u></h3>
    <div class="form-container">
        <form method="post" action="viewstudentbyid">
            <table>
                <tr>
                    <td><label for="uemail">Enter studentId </label></td>
                    <td><input type="number" id="uid" name="uid" required/></td>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="search"/>
                    </td>
                </tr>
            </table>
        </form>
        
        
        <h3 style="text-align: center; color: white">VIEW STUDENTS By Id</h3>
<br>
<table align="center" border=3 width=80% cellpadding="5px">
    <tr bgcolor="lightblue">
        <th>ID</th>
        <th>NAME</th>
        <th>GENDER</th>
        <th>DEPARTMENT</th>
        <th>EMAIL</th>
        <th>CONTACT</th>
    </tr>
        <tr bgcolor="white" align="center">
            <td><c:out value="${st.id}"/></td>
            <td><c:out value="${st.name}"/></td>
            <td><c:out value="${st.gender}"/></td>
            <td><c:out value="${st.department}"/></td>
            <td><c:out value="${st.email}"/></td>
            <td><c:out value="${st.contact}"/></td>
        </tr>
</table>
    </div>
    </main>
    
</body>
</html>