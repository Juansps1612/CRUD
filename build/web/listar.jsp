<%-- 
    Document   : listar
    Created on : 10/08/2025, 8:33:54 p. m.
    Author     : juans
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }
    
    Connection con = null;
    Statement stmt = null;
    ResultSet rs = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_estudiantes", "root", "js1216");
        stmt = con.createStatement();
        rs = stmt.executeQuery("SELECT * FROM estudiantes");
%>
<!DOCTYPE html>
<html>
<head>
    <title>Listar Estudiantes</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f0f2f5;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            min-height: 100vh;
            margin: 0;
            padding: 20px;
        }
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 90%;
            max-width: 900px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            text-align: left;
        }
        th, td {
            padding: 12px;
            border-bottom: 1px solid #ddd;
        }
        th {
            background: #4CAF50;
            color: white;
        }
        tr:hover {
            background: #f5f5f5;
        }
        a.btn {
            background: #4CAF50;
            color: white;
            padding: 6px 12px;
            border-radius: 6px;
            text-decoration: none;
            font-size: 14px;
            transition: background 0.3s ease;
        }
        a.btn:hover {
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
    <div class="table-container">
        <h2>Lista de Estudiantes</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Edad</th>
                <th>Carrera</th>
                <th>Acciones</th>
            </tr>
            <%
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String nombre = rs.getString("nombre");
                    int edad = rs.getInt("edad");
                    String carrera = rs.getString("carrera");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= nombre %></td>
                <td><%= edad %></td>
                <td><%= carrera %></td>
                <td>
                    <a class="btn" href="editar.jsp?id=<%= id %>">Editar</a>
                    <a class="btn" style="background:#e74c3c" href="eliminar.jsp?id=<%= id %>" onclick="return confirm('¿Seguro que desea eliminar?')">Eliminar</a>
                </td>
            </tr>
            <%
                }
            %>
        </table>
        <a class="back-link" href="menu.jsp">⬅ Volver al Menú</a>
    </div>
</body>
</html>
<%
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (rs != null) rs.close();
        if (stmt != null) stmt.close();
        if (con != null) con.close();
    }
%>
