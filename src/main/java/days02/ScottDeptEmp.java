package days02;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.doit.domain.DeptVO;
import org.doit.domain.EmpVO;

import com.util.DBConn;


@WebServlet("/scott/deptemp")
public class ScottDeptEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ScottDeptEmp() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int deptno;
		String dname;
		String loc;

		int empno;
		String ename;
		String job;
		int mgr;
		Date hiredate;
		double sal;
		double comm;

		String dept=request.getParameter("deptno");
		int deptParam = 10;

		if(dept!=null&&!dept.equals("")){
			try {
				deptParam = Integer.parseInt(dept);
			} catch(Exception e){
				deptParam = 10; 
			}
		}


		// org.doit.domain.DeptVO.java 추가
		ArrayList<DeptVO> Dlist = null;
		ArrayList<EmpVO> Elist = null;
		Iterator<DeptVO> Dir = null;
		Iterator<EmpVO> Eir = null;
		DeptVO Dvo = null;
		EmpVO Evo = null;
		try {
			con = DBConn.getConnection();
			String sql = "SELECT * "
					+"FROM dept ";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				Dlist = new ArrayList<>();
				do {
					deptno = rs.getInt("deptno");
					dname = rs.getString("dname");
					loc = rs.getString("loc");

					Dvo = new DeptVO().builder()
							.deptno(deptno)
							.dname(dname)
							.loc(loc)
							.build();

					Dlist.add(Dvo);

				} while (rs.next());
			}
		} catch(Exception e) {
			e.printStackTrace();
		} finally{
			try {
				rs.close();
				pstmt.close();
			} catch(Exception e) {
				e.printStackTrace();
			}

		}// try

		try {
			String sql = "SELECT "
					+ " * "
					+ " FROM emp "
					+ "WHERE deptno = ?";

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,deptParam);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				Elist = new ArrayList<>();
				do {
					empno = rs.getInt("empno");
					ename = rs.getString("ename");
					job = rs.getString("job");
					mgr = rs.getInt("mgr");
					hiredate = rs.getDate("hiredate");
					sal = rs.getDouble("sal");
					comm = rs.getDouble("comm");
					deptno = rs.getInt("deptno");

					Evo = new EmpVO().builder()
							.empno(empno)
							.ename(ename)
							.job(job)
							.mgr(mgr)
							.hiredate(hiredate) 
							.sal(sal)
							.comm(comm)
							.deptno(deptno)
							.build();

					Elist.add(Evo);

				} while (rs.next());

			}
		}catch (Exception e){
			e.printStackTrace();
		}finally {
			try{
				rs.close();
				pstmt.close();
				DBConn.close();
			}catch(Exception e) {
				e.printStackTrace();
			}
		}
		request.setAttribute("Dlist", Dlist);
		request.setAttribute("Elist", Elist);
	    request.setAttribute("deptParam", deptParam);
	    
		
		String path="/days03/ex09_deptemp.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
