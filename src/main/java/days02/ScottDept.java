package days02;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.doit.domain.DeptVO;

import com.util.DBConn;


@WebServlet("/scott/dept")
public class ScottDept extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScottDept() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ScottDept.doGet()...");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<DeptVO> list = null;
		Iterator<DeptVO> ir = null;
		DeptVO vo = null;

		int deptno;
		String dname;

		try {

			conn = DBConn.getConnection();
			String sql = "SELECT * FROM dept ";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				list = new ArrayList<>();
				do {
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");

					vo = new DeptVO().builder()
							.deptno(deptno)
							.dname(dname)
							.build();

					list.add(vo);
				} while(rs.next());

			}

		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			try {

			}catch (Exception e) {
				e.printStackTrace();
			}

		}
		//list 부서정보 모두 포워딩
		request.setAttribute("list", list);
		
		String path="/days03/ex08_dept_jstl.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ScottDept.doGet()...");
	}

}
