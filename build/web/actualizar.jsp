<%-- 
    Document   : actualizar
    Created on : 10/08/2025, 8:35:49 p. m.
    Author     : juans
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    if (session.getAttribute("usuario") == null) {
        response.sendRedirect("login.jsp");
    }
    
    int id = Integer.parseInt(request.getParameter("id"));
    String nombre = request.getParameter("nombre");
    int edad = Integer.parseInt(request.getParameter("edad"));
    String carrera = request.getParameter("carrera");
    
    Connection con = null;
    PreparedStatement ps = null;
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Cambia 'root' y '' a tus credenciales reales de MySQL
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_estudiantes", "root", "js1216");
        
        String sql = "UPDATE estudiantes SET nombre = ?, edad = ?, carrera = ? WHERE id = ?";
        ps = con.prepareStatement(sql);
        ps.setString(1, nombre);
        ps.setInt(2, edad);
        ps.setString(3, carrera);
        ps.setInt(4, id);
        ps.executeUpdate();
        
        response.sendRedirect("listar.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
