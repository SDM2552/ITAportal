<!-- login.jsp -->
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <link rel="stylesheet" href="css/common.css">
    <link rel="stylesheet" href="css/loginRegister/login.css">
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="../notice/dashboard.jsp" method="post">
        <div class="form-group">
            <label for="logId">logId:</label>
            <input type="text" id="logId" name="logId" required>
        </div>
        <div class="form-group">
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
        </div>
        <div class="form-group">
            <button type="submit">Login</button>
        </div>
    </form>
</div>
</body>
</html>