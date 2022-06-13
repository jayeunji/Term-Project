package pknu.ce;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.io.Reader;
import java.nio.charset.StandardCharsets;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.*;

/**
 * Servlet class to provide REST API for STUDENT table
 * 
 * NOTE: set Eclipse JavaDoc VM option to '-locale ko_KR -encoding UTF-8 -charset UTF-8 -docencoding UTF-8'
 * 
 */
@WebServlet("/main/*")
public class Server extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public Server() {
		super();
	}


	/**
	 * 
	 * STUDENT 테이블에 대한 읽기는 제공하는 REST API URL 끝에 학번을 사용하는 경우에는 해당되는 
	 * STUDENT 데이터만 전송, 그렇지 않으면 모든 STUDENT 데이터를 전송한다.
	 * 
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		log("doGet");

		int sno = getId(request);
		log(String.format("SNO=%d \n", sno));

		try {

			Connection conn = getConnection();
			PreparedStatement st;

			if (sno > 0) {
				st = conn.prepareStatement("select * from student where sno = ?");
				st.setInt(1, sno);
			} else {
				st = conn.prepareStatement("select * from student");
			}

			ResultSet rs = st.executeQuery();

			JSONArray arr = new JSONArray();

			while (rs.next()) {
				JSONObject o = new JSONObject();

				o.put("SNO", rs.getInt("SNO"));
				o.put("SNAME", rs.getString("SNAME"));
				o.put("YEAR", rs.getInt("YEAR"));
				o.put("DEPT", rs.getString("DEPT"));

				arr.put(o);
			}

			rs.close();
			st.close();
			conn.close();

			JSONObject body = new JSONObject();
			body.put("DATA", arr);
			
			log(body.toString());

			PrintWriter out = response.getWriter();
			out.print(body);
			out.flush();

		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 클라이언트에서 전달된 STUDENT 데이터를 테이블에 갱신하기 위한 REST API
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		log("doPost");

		try {
			JSONObject obj = new JSONObject(readBody(request.getInputStream()));

			String sql = "update STUDENT set sname=?, year=?, dept=? where sno=?";

			Connection conn = getConnection();
			PreparedStatement st = conn.prepareStatement(sql);

			String sname = obj.getString("SNAME");
			int year = obj.getInt("YEAR");
			String dept = obj.getString("DEPT");
			int sno = obj.getInt("SNO");

			System.out.format("Updating STUDENT(%d, %s, %d, %s)\n", sno, sname, year, dept);

			st.setString(1, sname);
			st.setInt(2, year);
			st.setString(3, dept);
			st.setInt(4, sno);

			st.executeUpdate();

			conn.close();

		} catch (ClassNotFoundException | SQLException | ParseException e) {
			throw new ServletException(e);
		}
	}

	/**
	 * 새로운 STUDENT 데이터를 추가하는 REST API
	 * 
	 */
	protected void doPut(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		log("doPut");

		try {
			JSONObject obj = new JSONObject(readBody(request.getInputStream()));
			
			System.out.println("New Student: "+obj);

			String sql = "insert into STUDENT(SNO,SNAME,YEAR,DEPT) values (?, ?, ?, ?)";

			Connection conn = getConnection();
			PreparedStatement st = conn.prepareStatement(sql);

			st.setInt(1, obj.getInt("SNO"));
			st.setString(2, obj.getString("SNAME"));
			st.setInt(3, obj.getInt("YEAR"));
			st.setString(4, obj.getString("DEPT"));

			st.executeUpdate();

			conn.close();

		} catch (ClassNotFoundException | SQLException | ParseException e) {
			throw new ServletException(e);
		}
	}

	/**
	 * REST API for deleting specified STUDENT data
	 */
	protected void doDelete(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		log("doDelete");
		int sno = getId(request);

		log("DELETE: SNO = " + sno);

		// Delete tuple from STUDENT table

	}

	/**
	 * Extract ID from the request URL
	 * 
	 * @param request Servlet request parameter
	 * @return integer representation of ID in URL
	 */
	private int getId(HttpServletRequest request) {
		String uri = request.getRequestURI();
		log("Request URI:" + uri);

		Pattern reId = Pattern.compile("/student/([0-9]+)");
		Matcher matcher = reId.matcher(uri);

		return matcher.find() ? Integer.parseInt(matcher.group(1)) : -1;
	}

	/**
	 * Read the content of the HTTP request and convert it into a string
	 * 
	 * @param is HTTP Body에 대한 InputStream
	 * @return String representation of the HTTP request content
	 * @throws IOException thrown when any error occurs while I/O operations
	 */
	private String readBody(InputStream is) throws IOException {
		char[] buffer = new char[1024];
		StringBuilder content = new StringBuilder();
		Reader in = new InputStreamReader(is, StandardCharsets.UTF_8);
		for (int numRead; (numRead = in.read(buffer, 0, buffer.length)) > 0;) {
			content.append(buffer, 0, numRead);
		}

		System.out.println("HTTP Body: " + content.toString());

		return content.toString();
	}

	private Connection getConnection() throws ClassNotFoundException, SQLException {
		Class.forName("oracle.jdbc.OracleDriver");
		return DriverManager.getConnection("jdbc:oracle:thin:@203.247.166.95:1521:xe", "DB201830327", "201830327");
	}
}
