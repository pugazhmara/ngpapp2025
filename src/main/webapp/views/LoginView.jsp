<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Pugazh - Login Portal</title>
  <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600;700&display=swap" rel="stylesheet">
  <style>
    /* Base styles */
    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }
    
    body {
      font-family: 'Poppins', sans-serif;
      height: 100vh;
      overflow: hidden;
      background: #0f0c29;
      display: flex;
      justify-content: center;
      align-items: center;
      perspective: 1000px;
    }
    
    /* Floating particles background */
    .particles {
      position: absolute;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      z-index: -1;
    }
    
    .particle {
      position: absolute;
      background: rgba(255, 255, 255, 0.5);
      border-radius: 50%;
      animation: float 15s infinite linear;
    }
    
    @keyframes float {
      0% {
        transform: translateY(0) rotate(0deg);
        opacity: 1;
      }
      100% {
        transform: translateY(-1000px) rotate(720deg);
        opacity: 0;
      }
    }
    
    /* Glassmorphism card */
    .login-container {
      width: 380px;
      padding: 40px;
      background: rgba(255, 255, 255, 0.1);
      border-radius: 20px;
      backdrop-filter: blur(15px);
      border: 1px solid rgba(255, 255, 255, 0.2);
      box-shadow: 0 25px 45px rgba(0, 0, 0, 0.2);
      transform-style: preserve-3d;
      animation: cardEntrance 1.5s ease-out, floatCard 8s ease-in-out infinite;
      transition: all 0.5s ease;
    }
    
    @keyframes cardEntrance {
      from {
        opacity: 0;
        transform: translateY(50px) rotateX(30deg);
      }
      to {
        opacity: 1;
        transform: translateY(0) rotateX(0);
      }
    }
    
    @keyframes floatCard {
      0%, 100% {
        transform: translateY(0) rotateX(0) rotateY(0);
      }
      50% {
        transform: translateY(-20px) rotateX(5deg) rotateY(5deg);
      }
    }
    
    .login-container:hover {
      transform: translateY(-10px) rotateX(2deg) rotateY(2deg);
      box-shadow: 0 35px 60px rgba(0, 0, 0, 0.4);
    }
    
    /* Header styles */
    h2 {
      color: #fff;
      text-align: center;
      margin-bottom: 30px;
      font-size: 2.2rem;
      font-weight: 700;
      text-shadow: 0 2px 10px rgba(0, 0, 0, 0.3);
      position: relative;
      animation: textGlow 3s ease-in-out infinite alternate;
    }
    
    @keyframes textGlow {
      from {
        text-shadow: 0 0 5px #fff, 0 0 10px #fff, 0 0 15px #e60073, 0 0 20px #e60073;
      }
      to {
        text-shadow: 0 0 10px #fff, 0 0 20px #ff4da6, 0 0 30px #ff4da6, 0 0 40px #ff4da6;
      }
    }
    
    /* Form elements */
    .input-group {
      position: relative;
      margin-bottom: 25px;
    }
    
    label {
      position: absolute;
      top: 15px;
      left: 15px;
      color: rgba(255, 255, 255, 0.7);
      font-size: 0.9rem;
      pointer-events: none;
      transition: all 0.3s ease;
    }
    
    input {
      width: 100%;
      padding: 15px;
      background: rgba(255, 255, 255, 0.1);
      border: none;
      border-radius: 10px;
      color: #fff;
      font-size: 1rem;
      outline: none;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }
    
    input:focus {
      background: rgba(255, 255, 255, 0.2);
      box-shadow: 0 0 15px rgba(255, 255, 255, 0.3);
    }
    
    input:focus + label,
    input:valid + label {
      top: -10px;
      left: 10px;
      font-size: 0.7rem;
      background: linear-gradient(45deg, #ff6a00, #ee0979);
      padding: 0 10px;
      border-radius: 20px;
      color: white;
    }
    
    /* Submit button */
    .submit-btn {
      width: 100%;
      padding: 15px;
      background: linear-gradient(45deg, #ff6a00, #ee0979);
      border: none;
      border-radius: 10px;
      color: white;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: all 0.3s ease;
      box-shadow: 0 5px 15px rgba(238, 9, 121, 0.4);
      position: relative;
      overflow: hidden;
    }
    
    .submit-btn:hover {
      transform: translateY(-3px);
      box-shadow: 0 8px 25px rgba(238, 9, 121, 0.6);
    }
    
    .submit-btn:active {
      transform: translateY(1px);
    }
    
    .submit-btn::before {
      content: '';
      position: absolute;
      top: 0;
      left: -100%;
      width: 100%;
      height: 100%;
      background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
      transition: 0.5s;
    }
    
    .submit-btn:hover::before {
      left: 100%;
    }
    
    /* Register link */
    .register-link {
      display: block;
      text-align: center;
      margin-top: 25px;
      color: rgba(255, 255, 255, 0.7);
      font-size: 0.9rem;
      text-decoration: none;
      transition: all 0.3s ease;
      position: relative;
    }
    
    .register-link:hover {
      color: white;
    }
    
    .register-link::after {
      content: '';
      position: absolute;
      bottom: -5px;
      left: 50%;
      width: 0;
      height: 2px;
      background: linear-gradient(45deg, #ff6a00, #ee0979);
      transition: all 0.3s ease;
    }
    
    .register-link:hover::after {
      width: 100%;
      left: 0;
    }
    
    /* Additional decorative elements */
    .circle {
      position: absolute;
      border-radius: 50%;
      background: linear-gradient(45deg, #ff6a00, #ee0979);
      opacity: 0.1;
      z-index: -1;
      animation: pulse 8s infinite ease-in-out;
    }
    
    @keyframes pulse {
      0%, 100% {
        transform: scale(1);
      }
      50% {
        transform: scale(1.2);
      }
    }
    
    /* Responsive adjustments */
    @media (max-width: 480px) {
      .login-container {
        width: 90%;
        padding: 30px;
      }
    }
  </style>
</head>
<body>
  <!-- Floating particles -->
  <div class="particles" id="particles"></div>
  
  <!-- Decorative circles -->
  <div class="circle" style="width: 300px; height: 300px; top: -150px; right: -150px;"></div>
  <div class="circle" style="width: 200px; height: 200px; bottom: -100px; left: -100px; animation-delay: 1s;"></div>
  
  <!-- Login container -->
  <div class="login-container">
    <h2>Welcome Back</h2>
    <form action="/NGPWEBAPP/LoginController" method="post">
      <div class="input-group">
        <input type="text" name="uname" required>
        <label>Username</label>
      </div>
      
      <div class="input-group">
        <input type="password" name="pass" required>
        <label>Password</label>
      </div>
      
      <button type="submit" class="submit-btn">Login</button>
    </form>
    
    <a href="/NGPWEBAPP/views/RegisterView.jsp" class="register-link">Don't have an account? Register now</a>
  </div>

  <script>
    // Create floating particles
    document.addEventListener('DOMContentLoaded', function() {
      const particlesContainer = document.getElementById('particles');
      const particleCount = 30;
      
      for (let i = 0; i < particleCount; i++) {
        const particle = document.createElement('div');
        particle.classList.add('particle');
        
        // Random properties
        const size = Math.random() * 10 + 5;
        const posX = Math.random() * window.innerWidth;
        const posY = Math.random() * window.innerHeight;
        const delay = Math.random() * 15;
        const duration = 10 + Math.random() * 20;
        
        particle.style.width = `${size}px`;
        particle.style.height = `${size}px`;
        particle.style.left = `${posX}px`;
        particle.style.top = `${posY}px`;
        particle.style.animationDelay = `${delay}s`;
        particle.style.animationDuration = `${duration}s`;
        
        particlesContainer.appendChild(particle);
      }
      
      // Add interactive tilt effect
      const card = document.querySelector('.login-container');
      
      document.addEventListener('mousemove', (e) => {
        const xAxis = (window.innerWidth / 2 - e.pageX) / 25;
        const yAxis = (window.innerHeight / 2 - e.pageY) / 25;
        card.style.transform = `rotateY(${xAxis}deg) rotateX(${yAxis}deg)`;
      });
      
      // Reset when mouse leaves
      document.addEventListener('mouseleave', () => {
        card.style.transform = 'rotateY(0) rotateX(0)';
      });
    });
  </script>
</body>
</html>