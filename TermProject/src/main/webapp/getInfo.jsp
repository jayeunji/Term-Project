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
	// 정보수정 화면으로 가기전에
	// 아이디 기준으로 회원정보를 조회해서 다음 화면으로 전달
	
	String id = (String)session.getAttribute("employee_id");

    //DB연결에 필요한 변수 선언
   String url = "jdbc:oracle:thin:@203.247.166.95:1521:xe";
   String uid = "DB201830327";
   String upw = "201830327";
   
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
   
   String sql = "select * from employees where employee_id = ?";
   
   try{
      // 드라이버 호출
      Class.forName("oracle.jdbc.OracleDriver");
      
      // conn 생성
      conn = DriverManager.getConnection(url, uid, upw);
      
      // pstmt 생성
      pstmt = conn.prepareStatement(sql);
      pstmt.setString(1, id);
      
      // sql실행
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
         
         // 포워드로 전달하기 위해
         request.setAttribute("employee_id", id);
         request.setAttribute("first_name", first);
         request.setAttribute("last_name", last);
         request.setAttribute("email", email);
         request.setAttribute("phone", phone);
         request.setAttribute("hire_date", hire);
         request.setAttribute("manager_id", manager);
         request.setAttribute("job_title", job);
         
         // 포워드 이동
         request.getRequestDispatcher("update.jsp").forward(request, response);
         
      } else{ // 세션이 만료된 경우
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
