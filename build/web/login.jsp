<%-- 
    Document   : login
    Created on : 10/08/2025, 8:32:24 p. m.
    Author     : juans
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .login-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 320px;
            text-align: center;
        }
        .login-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .login-container input[type="text"],
        .login-container input[type="password"] {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .login-container input[type="submit"] {
            width: 95%;
            padding: 10px;
            background: #4CAF50;
            border: none;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
        }
        .login-container input[type="submit"]:hover {
            background: #45a049;
        }
        .error {
            color: red;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <%
        String error = null;
        if (request.getMethod().equalsIgnoreCase("POST")) {
            String usuario = request.getParameter("usuario");
            String contrasena = request.getParameter("contrasena");
            
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;
            
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_estudiantes", "root", "js1216");
                
                String sql = "SELECT * FROM usuarios WHERE usuario = ? AND contrasena = ?";
                ps = con.prepareStatement(sql);
                ps.setString(1, usuario);
                ps.setString(2, contrasena);
                rs = ps.executeQuery();
                
                if (rs.next()) {
                    session.setAttribute("usuario", usuario);
                    response.sendRedirect("menu.jsp");
                } else {
                    error = "Usuario o contraseña incorrectos";
                }
            } catch (Exception e) {
                error = "Error: " + e.getMessage();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException ignored) {}
                if (ps != null) try { ps.close(); } catch (SQLException ignored) {}
                if (con != null) try { con.close(); } catch (SQLException ignored) {}
            }
        }
    %>

    <div class="login-container">
        <h2>Inicio de Sesión</h2>
        <% if (error != null) { %>
            <p class="error"><%= error %></p>
        <% } %>
        <form action="login.jsp" method="post">
            <input type="text" name="usuario" placeholder="Usuario" required><br>
            <input type="password" name="contrasena" placeholder="Contraseña" required><br>
            <input type="submit" value="Iniciar Sesión">
        </form>
    </div>
</body>
</html>
