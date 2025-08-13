<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pugazh - Register</title>
<style>
    /* Animated background */
    body {
      margin: 0;
      padding: 0;
      font-family: Arial, sans-serif;
      height: 100vh;
      display: flex;
      justify-content: center;
      align-items: center;
      background: linear-gradient(270deg, #ff6a00, #ee0979, #00c6ff);
      background-size: 600% 600%;
      animation: bgAnimation 10s ease infinite;
    }

    @keyframes bgAnimation {
      0% { background-position: 0% 50%; }
      50% { background-position: 100% 50%; }
      100% { background-position: 0% 50%; }
    }

    /* Form container */
    .form-container {
      background: rgba(255, 255, 255, 0.15);
      padding: 30px 40px;
      border-radius: 15px;
      box-shadow: 0 0 20px rgba(0,0,0,0.3);
      backdrop-filter: blur(10px);
      animation: fadeIn 1.5s ease;
      width: 320px;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(-20px); }
      to { opacity: 1; transform: translateY(0); }
    }

    h2 {
      color: white;
      text-align: center;
      margin-bottom: 20px;
    }

    label {
      display: block;
      margin-top: 12px;
      font-weight: bold;
      color: white;
    }

    input[type="name"], input[type="password"], 
    input[type="email"], input[type="text"] {
      width: 100%;
      padding: 10px;
      margin-top: 5px;
      border: none;
      border-radius: 8px;
      outline: none;
      transition: 0.3s;
    }

    input:focus {
      box-shadow: 0 0 10px #fff;
    }

    input[type="submit"] {
      width: 100%;
      margin-top: 20px;
      padding: 10px;
      background: linear-gradient(to right, #ff512f, #dd2476);
      border: none;
      border-radius: 8px;
      color: white;
      font-weight: bold;
      cursor: pointer;
      transition: 0.3s;
    }

    input[type="submit"]:hover {
      background: linear-gradient(to right, #dd2476, #ff512f);
      transform: scale(1.05);
      box-shadow: 0 0 10px white;
    }
</style>
</head>
<body>
  <div class="form-container">
    <h2>Register</h2>
    <form action="/NGPWEBAPP/RegisterServlet" method="POST">
      <label>Name</label>
      <input type="name" name="uname" placeholder="Enter your name" required>

      <label>Password</label>
      <input type="password" name="pass" placeholder="Enter your password" required>

      <label>Mobile</label>
      <input type="text" name="mobile" placeholder="Enter your mobile" required>

      <label>Email</label>
      <input type="email" name="email" placeholder="Enter your email" required>

      <label>Pin</label>
      <input type="text" name="pin" placeholder="Enter your pin" required>

      <input type="submit" value="Register">
    </form>
  </div>
</body>
</html>
