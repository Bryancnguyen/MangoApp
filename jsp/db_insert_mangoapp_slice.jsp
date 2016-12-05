<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>INSERT Operation</title>
</head>
<body>
 
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql://localhost/mydb"
     user="root"  password="root"/>

<small>
Showing:<br/>
 <%= request.getParameter("username")%><br/>
 <%= request.getParameter("email")%><br/>
 <%= request.getParameter("password")%><br/>
</small>

<sql:update dataSource="${snapshot}" var="result">
INSERT INTO Slices VALUES ( NULL, '<%= request.getParameter("location")%>', NULL, NULL, NULL );
</sql:update>
 
<sql:query dataSource="${snapshot}" var="result">
SELECT * from Users;
</sql:query>
 
<table border="1" width="100%">
<tr>
   <th>idSlices</th>
   <th>Location</th>
   <th>Tourist</th>
   <th>primary_criteria</th>
   <th>secondary_criteria</th>
</tr>
<c:forEach var="row" items="${result.rows}">
<tr>
   <td><c:out value="${row.idSlices}"/></td>
   <td><c:out value="${row.Location}"/></td>
   <td><c:out value="${row.Tourist}"/></td>
   <td><c:out value="${row.primary_criteria}"/></td>
   <td><c:out value="${row.secondary_criteria}"/></td>
</tr>
</c:forEach>
</table>
<script>
window.location.href = "http://"+window.location.hostname+":80/MangoApp-gh-pages/pages/slice.html";
</script>
</body>
</html>