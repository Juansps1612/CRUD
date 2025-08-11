<%-- 
    Document   : nuevo
    Created on : 10/08/2025, 8:34:36 p. m.
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
    <title>Nuevo Estudiante</title>
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
        .form-container {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 350px;
            text-align: center;
        }
        .form-container h2 {
            margin-bottom: 20px;
            color: #333;
        }
        .form-container input[type="text"],
        .form-container input[type="number"] {
            width: 90%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 8px;
        }
        .form-container input[type="submit"] {
            width: 95%;
            padding: 10px;
            background: #4CAF50;
            border: none;
            color: white;
            border-radius: 8px;
            cursor: pointer;
            margin-top: 10px;
        }
        .form-container input[type="submit"]:hover {
            background: #45a049;
        }
        .back-link {
            display: inline-block;
            margin-top: 15px;
            background: #555;
            color: white;
            padding: 8px 14px;
            border-radius: 6px;
            text-decoration: none;
        }
        .back-link:hover {
            background: #333;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Agregar Nuevo Estudiante</h2>
        <form action="insertar.jsp" method="post">
            <input type="text" name="nombre" required placeholder="Nombre"><br>
            <input type="number" name="edad" required placeholder="Edad"><br>
            <input type="text" name="carrera" required placeholder="Carrera"><br>
            <input type="submit" value="Guardar">
        </form>
        <a class="back-link" href="menu.jsp">⬅ Volver al Menú</a>
    </div>
</body>
</html>
