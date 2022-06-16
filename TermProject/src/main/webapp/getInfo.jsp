<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

<%
	// �������� ȭ������ ��������
	// ���̵� �������� ȸ�������� ��ȸ�ؼ� ���� ȭ������ ����
	
	String id = (String)session.getAttribute("employee_id");

    //DB���ῡ �ʿ��� ���� ����
   String url = "jdbc:oracle:thin:@203.247.166.95:1521:xe";
   String uid = "DB201830327";
   String upw = "201830327";
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String sql = "select * from employees where employee_id = ?";
   
   try{
      // ����̹� ȣ��
      Class.forName("oracle.jdbc.OracleDriver");
      
      // conn ����
      conn = DriverManager.getConnection(url, uid, upw);
      
      // pstmt ����
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      
      // sql����
      rs = pstmt.executeQuery();
      
      if(rs.next()){
         id = rs.getString("employee_id");
         String first = rs.getString("first_name");
         String last = rs.getString("last_name");
         String email = rs.getString("email");
         String phone = rs.getString("phone");
         String hire = rs.getString("hire_date");
         String manager = rs.getString("manager_id");
         String job = rs.getString("job_title");
         
         // ������� �����ϱ� ����
         request.setAttribute("employee_id", id);
         request.setAttribute("first_name", first);
         request.setAttribute("last_name", last);
         request.setAttribute("email", email);
         request.setAttribute("phone", phone);
         request.setAttribute("hire_date", hire);
         request.setAttribute("manager_id", manager);
         request.setAttribute("job_title", job);
         
         // ������ �̵�
         request.getRequestDispatcher("update.jsp").forward(request, response);
         
      } else{ // ������ ����� ���
         response.sendRedirect("login.jsp");
      }
   } catch(Exception e){
      e.printStackTrace();
      response.sendRedirect("login.jsp");
   } finally{
      try{
         if(conn != null) conn.close();
         if(pstmt != null) pstmt.close();
         if(rs != null) rs.close();
      } catch(Exception e){
         e.printStackTrace();
      }
   }
%>


</body>
</html>
