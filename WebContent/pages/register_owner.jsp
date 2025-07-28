<!DOCTYPE html>
<html>
<head>
    <title>Register Fuel Station Owner</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f8f8;
        }
        form {
            max-width: 500px;
            margin: auto;
            background: white;
            padding: 20px;
            border-radius: 10px;
        }
        input[type=text], input[type=password], input[type=email], input[type=number] {
            width: 100%;
            padding: 10px;
            margin-top: 10px;
        }
        button {
            margin-top: 15px;
            padding: 10px;
            background-color: #28a745;
            color: white;
            border: none;
            width: 100%;
        }
    </style>
</head>
<body>
    <h2 style="text-align:center;">Fuel Station Owner Registration</h2>
    <form action="../RegisterOwnerServlet" method="post">
        <label>Full Name:</label>
        <input type="text" name="name" required>

        <label>Fuel Station Name:</label>
        <input type="text" name="station_name" required>

        <label>Email:</label>
        <input type="email" name="email" required>

        <label>Contact Number:</label>
        <input type="text" name="phone" required>

        <label>Address:</label>
        <input type="text" name="address" required>

        <label>City:</label>
        <input type="text" name="city" required>

        <label>Latitude:</label>
        <input type="text" name="latitude" required placeholder="e.g. 25.2677">

        <label>Longitude:</label>
        <input type="text" name="longitude" required placeholder="e.g. 82.9913">

        <label>Password:</label>
        <input type="password" name="password" required>

        <button type="submit">Register</button>
    </form>
</body>
</html>
