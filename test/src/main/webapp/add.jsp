<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<form action="add" method="POST">
            <input type="text" name="username" placeholder="Username" required>
            <input type="email" name="email" placeholder="Email" required>
            <input type="number" name="id" placeholder="ID" required>
              <input type="text" name="address" placeholder="Address" required>
              <input type="password" name="password" placeholder="Password" required>
            <button type="submit">Submit</button>
        </form>

</body>
</html>