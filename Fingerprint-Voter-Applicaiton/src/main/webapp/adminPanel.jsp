<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link href="css/body.css" rel='stylesheet' type='text/css' />

</head>
<body>
<%
    String message= request.getParameter("msg");
%>
<jsp:include page="adminHeader.jsp"></jsp:include>
<div class="limiter">
    <div class="container-login100">
        <div class="wrap-login100">
             <h1>Admin Login</h1>
    <form action="AdminLoginServlet" method="post">
        <label for="adminId">Admin ID:</label>
        <input type="text" id="adminId" name="adminId" required><br><br>

        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>

        <input type="submit" value="Login">
    </form>
            <div class="login100-more" style="background-image: url('images/vot.jpg');"></div>
        </div>

    </div>
</div>
</body>
</html>
