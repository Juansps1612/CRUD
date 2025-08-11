<%-- 
    Document   : logout
    Created on : 10/08/2025, 8:36:31 p. m.
    Author     : juans
--%>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    session.invalidate();
    response.sendRedirect("login.jsp");
%>