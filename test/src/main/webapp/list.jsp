<%@ page import="java.sql.*" %>
<%@ page import="com.ty.conn.Connection_Pool" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Students</title>
</head>
<body>

<h1>List Of Students</h1>

<table border="1">
<tr>
    <th>name</th>
    <th>email</th>
    <th>id</th>
    <th>address</th>
    <th>password</th>
</tr>

<%
Connection con = Connection_Pool.giveConnection();

String fetch = "SELECT * FROM users";
PreparedStatement pstm = con.prepareStatement(fetch);
ResultSet rs = pstm.executeQuery();

while (rs.next()) {
%>
<tr>
    <td><%= rs.getString(1) %></td>
    <td><%= rs.getString(2) %></td>
    <td><%= rs.getString(3) %></td>
    <td><%= rs.getString(4) %></td>
    <td><%= rs.getString(5) %></td>
</tr>
<%
}

Connection_Pool.submitConnection(con);
%>

</table>

</body>
</html>
