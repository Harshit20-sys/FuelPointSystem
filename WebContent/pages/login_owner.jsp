<!DOCTYPE html>
<html>
<head>
    <title>Owner Login - Fuel Point</title>
    <style>
        body {
            background: #e0f7fa;
            font-family: Arial;
        }
        .login-container {
            width: 400px;
            margin: 100px auto;
            padding: 25px;
            background: white;
            border-radius: 8px;
            box-shadow: 0 0 8px #aaa;
        }
        input[type="email"], input[type="password"], input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border-radius: 5px;
            border: 1px solid #ccc;
        }
        input[type="submit"] {
            background: #008080;
            color: white;
            border: none;
            cursor: pointer;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Owner Login</h2>
        <form method="post" action="<%= request.getContextPath() %>/LoginOwnerServlet">
            
            <input type="email" name="email" placeholder="Email" required />
            <input type="password" name="password" placeholder="Password" required />
            <input type="submit" value="Login" />
        </form>
    </div>
</body>
</html>
