<%@ page language="java" contentType="text/plain; charset=UTF-8"
    pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.SQLException" %>
<%@ page import="user.UserDAO" %>
<%
	request.setCharacterEncoding("utf-8");
	//전송된 데이터 반환
	String id = request.getParameter("id");
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	String sql = null;
	
	try{
		String dbURL = "jdbc:mariadb://localhost:3306/BBS";
		String dbID = "root";
		String dbPassword = "junho";
		Class.forName("org.mariadb.jdbc.Driver");
		conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
	
		sql = "select userPassword from user where userID = ?";
		
		pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, id);
		
		
		rs = pstmt.executeQuery();
		if(rs.next()){//ID중복
%>
		{"result":"idDuplicated"}
<%			
		}else{//ID미중복
%>
		{"result":"idNotFound"}
<%			
		}
	}catch(Exception e){
%>
		{"result":"failure"}
<%
	e.printStackTrace();
	} finally {
	//다 종료시켜 줘야함
	if (rs != null)
		try {
			rs.close();
		} catch (SQLException e) {
		}
	if (pstmt != null)
		try {
			pstmt.close();
		} catch (SQLException e) {
		}
	if (conn != null)
		try {
			conn.close();
		} catch (SQLException e) {
	}
}
%>