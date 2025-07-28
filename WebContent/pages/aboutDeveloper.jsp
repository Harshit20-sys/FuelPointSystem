<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>About the Developer</title>
    <style>
        body {
            margin: 0;
            padding: 0;
            font-family: 'Segoe UI', sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            display: flex;
            width: 70%;
            max-width: 1000px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 18px rgba(0, 0, 0, 0.15);
            overflow: hidden;
            border: 1px solid #ddd;
        }

        .left-section {
            width: 28%; /* ✅ Reduced width from 35% */
            bbackground-color: none;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 20px;
        }

        .left-section img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            border-radius: 10px;
}


        .right-section {
            width: 72%; /* ✅ Increased right section width */
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .right-section h2 {
            color: #007bff;
            font-size: 26px;
            margin-bottom: 10px;
        }

        .right-section p {
            font-size: 16px;
            margin: 8px 0;
            color: #333;
        }

        .back-btn {
            margin-top: 25px;
            padding: 10px 25px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            display: inline-block;
            width: fit-content;
        }

        .back-btn:hover {
            background-color: #0056b3;
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
                width: 90%;
            }

            .left-section, .right-section {
                width: 100%;
                text-align: center;
                padding: 20px;
            }

            .right-section {
                padding-top: 0;
            }
        }
    </style>
</head>
<body>

    <div class="container">
        <!-- Left: Image -->
        <div class="left-section">
            <img src="../logo.jpg" alt="Harshit Singh">
        </div>

        <!-- Right: Details -->
        <div class="right-section">
            <h2>HARSHIT SINGH {Backend Developer}</h2>
            <p><strong>MSC(CSA)</strong> Student at <strong>Banaras Hindu University</strong></p>
            <p>Passionate about <strong>full-stack development, I designed and developed the Fuel Point System to streamline fuelpump operations and enhance the public experience. With a strong foundation in Java, web technologies, and database systems, I aim to build meaningful tech solutions that solve real-world problems.</strong></p>
            <p><strong>Email:</strong> harshit20@bhu.ac.in</p>
            <p><strong>Alternate Email:</strong> harshitgaharwar20@gmail.com</p>
            <p><strong>Contact:</strong> +91-7440526001</p>

            <a href="../index.jsp" class="back-btn">←</a>
        </div>
    </div>

</body>
</html>
