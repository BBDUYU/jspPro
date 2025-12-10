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

import org.doit.domain.EmpVO;

import com.util.DBConn;


@WebServlet("/scott/emp")
public class ScottEmp extends HttpServlet {
	private static final long serialVersionUID = 1L;
	public ScottEmp() {
		super();
	}


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("> ScottEmp.doGet()...");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		int empno;                          
		String ename;                       
		String job;                         
		int mgr;               
		Date hiredate;  
		double sal;                         
		double comm;                        
		int deptno = 10;        

		String pDeptno = request.getParameter("deptno");
		pDeptno = (pDeptno == null?"10":pDeptno);
		
		try {
			deptno = Integer.parseInt(pDeptno);
		}catch(Exception e) {}

		ArrayList<EmpVO> list = null;
		Iterator<EmpVO> ir = null;
		EmpVO vo = null;

		String [] pDeptnoArr = request.getParameterValues("deptno");

		try{
			con = DBConn.getConnection();
			String sql = "SELECT empno, ename, job, mgr " 
					+ " , TO_CHAR( hiredate, 'yyyy-MM-dd' ) hiredate "
					+ " , sal, comm, deptno "
					+ " FROM emp "
					+ " WHERE deptno = ?";
			

			System.out.println("[sql]\n" + sql);

			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1,deptno);
			

			rs = pstmt.executeQuery();
			if( rs.next() ){
				list = new ArrayList<>();
				do{
					empno = rs.getInt("empno");
					ename = rs.getString("ename");
					job = rs.getString("job");
					mgr = rs.getInt("mgr");
					hiredate = rs.getDate("hiredate");
					sal = rs.getDouble("sal");
					comm = rs.getDouble("comm");
					deptno = rs.getInt("deptno");

					vo = new EmpVO().builder()
							.empno(empno)
							.ename(ename)
							.job(job)
							.mgr(mgr)
							.hiredate(hiredate)
							.sal(sal)
							.comm(comm)
							.deptno(deptno)
							.build();

					list.add(vo);                            
				}while( rs.next() );
			} // if
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			try{
				rs.close();  
				pstmt.close();
				DBConn.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		} // try
		
	
		request.setAttribute("list", list);
	    request.setAttribute("deptno", deptno);
		
		String path="/days03/ex08_emp.jsp";
		RequestDispatcher dispatcher = request.getRequestDispatcher(path);
		dispatcher.forward(request, response);
	}	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
