<%-- 
    Document   : editar
    Created on : 10/08/2025, 8:35:16 p. m.
    Author     : juans
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }
    
    int id = Integer.parseInt(request.getParameter("id"));
    
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_estudiantes", "root", "js1216");
        
        String sql = "SELECT * FROM estudiantes WHERE id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        rs = ps.executeQuery();
        
        if (rs.next()) {
            String nombre = rs.getString("nombre");
            int edad = rs.getInt("edad");
            String carrera = rs.getString("carrera");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Editar Estudiante</title>
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
        <h2>Editar Estudiante</h2>
        <form action="actualizar.jsp" method="post">
            <input type="hidden" name="id" value="<%= id %>">
            <input type="text" name="nombre" value="<%= nombre %>" required placeholder="Nombre"><br>
            <input type="number" name="edad" value="<%= edad %>" required placeholder="Edad"><br>
            <input type="text" name="carrera" value="<%= carrera %>" required placeholder="Carrera"><br>
            <input type="submit" value="Actualizar">
        </form>
        <a class="back-link" href="listar.jsp">⬅ Volver a la Lista</a>
    </div>
</body>
</html>
<%
        }
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
