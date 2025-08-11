<%-- 
    Document   : menu
    Created on : 10/08/2025, 8:33:11 p. m.
    Author     : juans
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>Menú Principal</title>
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
        .menu-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 350px;
            text-align: center;
        }
        .menu-container h2 {
            color: #333;
            margin-bottom: 10px;
        }
        .menu-container h3 {
            color: #555;
            margin-bottom: 20px;
        }
        .menu-container ul {
            list-style: none;
            padding: 0;
        }
        .menu-container ul li {
            margin: 10px 0;
        }
        .menu-container ul li a {
            display: block;
            padding: 10px;
            background: #4CAF50;
            color: white;
            text-decoration: none;
            border-radius: 8px;
            transition: background 0.3s ease;
        }
        .menu-container ul li a:hover {
            background: #45a049;
        }
    </style>
</head>
<body>
    <div class="menu-container">
        <h2>Bienvenido, <%= session.getAttribute("usuario") %></h2>
        <h3>Menú de Opciones</h3>
        <ul>
            <li><a href="listar.jsp">Listar Estudiantes</a></li>
            <li><a href="nuevo.jsp">Agregar Nuevo Estudiante</a></li>
            <li><a href="logout.jsp">Cerrar Sesión</a></li>
        </ul>
    </div>
</body>
</html>
