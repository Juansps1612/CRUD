<%-- 
    Document   : eliminar
    Created on : 10/08/2025, 8:36:09 p. m.
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
    
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        // Cambia 'root' y '' a tus credenciales reales de MySQL
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_estudiantes", "root", "js1216");
        
        String sql = "DELETE FROM estudiantes WHERE id = ?";
        ps = con.prepareStatement(sql);
        ps.setInt(1, id);
        ps.executeUpdate();
        
        response.sendRedirect("listar.jsp");
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    } finally {
        if (ps != null) ps.close();
        if (con != null) con.close();
    }
%>
