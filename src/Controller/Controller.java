package Controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import Dao.*;
import Dto.UserDto;

/**
 * Servlet implementation class controller
 */
@WebServlet("*.do")
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;

	LogDao logDao;
	AssetDao assetDao;
	UserDao userDao;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public Controller() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doGet");
		try {
			actionDo(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("doPost");
		try {
			actionDo(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void actionDo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		System.out.println("actionDo");

		request.setCharacterEncoding("EUC-KR");

		String viewPage = null;

		String uri = request.getRequestURI();
		String conPath = request.getContextPath();
		String com = uri.substring(conPath.length());

		if (com.equals("/login")) {
			viewPage = "login.jsp";
		}
		// 로그인 시 아이디 비번 비교하고, 로그인 성공시 어느 등급 사람인지 파악하여 페이지 넘기기
		else if (com.equals("/loginConfirm.do")) {
			userDao = new UserDao();
			if (userDao.loginDao(request.getParameter("userID"), request.getParameter("userPW")) == 1) {
				HttpSession session = request.getSession(true);
				session.setAttribute("id", request.getParameter("userID"));
				session.setAttribute("grade", "1");
				viewPage = "loginMaster.jsp";
			} else if (userDao.loginDao(request.getParameter("userID"), request.getParameter("userPW")) == 2) {
				HttpSession session = request.getSession(true);
				session.setAttribute("id", request.getParameter("userID"));
				session.setAttribute("grade", "2");
				viewPage = "loginAdminister.jsp";
			} else if (userDao.loginDao(request.getParameter("userID"), request.getParameter("userPW")) == 3) {
				HttpSession session = request.getSession(true);
				session.setAttribute("id", request.getParameter("userID"));
				session.setAttribute("grade", "3");
				viewPage = "loginMember.jsp";
			} else {
				viewPage = "login.jsp";
			}
		}
		// 모든 user list 출력
		else if (com.equals("/userManagement.do")) {
			userDao = new UserDao();
			request.setAttribute("users", userDao.showAllUserDao());
			viewPage = "userManagement.jsp";
		}
		// 자산 관리 list 출력
		else if (com.equals("/assetManagement.do")) {
			assetDao = new AssetDao();
			request.setAttribute("assets", assetDao.showAssetDao());
			viewPage = "assetManagement.jsp";
		}
		// 자산 등록
		else if (com.equals("/registerAsset.do")) {
			assetDao = new AssetDao();
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			assetDao.registerAssetDao(request.getParameter("category"), request.getParameter("assetName"),
					request.getParameter("productName"), request.getParameter("regiState"),
					request.getParameter("location"), id);

			viewPage = "registerAsset.jsp";
		}
		// 사용자 등급 올리기
		else if (com.equals("/userGradeUp.do")) {
			userDao = new UserDao();
			userDao.gradeUpDao(request.getParameter("userID"));
			viewPage = "userManagement.do";
		}
		// 사용자 등급 내리기
		else if (com.equals("/userGradeDown.do")) {
			userDao = new UserDao();
			userDao.gradeDownDao(request.getParameter("userID"));
			viewPage = "userManagement.do";
		}
		// 사용자 지우기
		else if (com.equals("/userDelete.do")) {
			userDao = new UserDao();
			userDao.deleteUserDao(request.getParameter("userID"));
			viewPage = "userManagement.do";
		}
		// 자산 로그 보기
		else if (com.equals("/assetLog.do")) {
			logDao = new LogDao();
			request.setAttribute("logs", logDao.assetLogDao(request.getParameter("code")));
			viewPage = "assetLog.jsp";
		}
		// 자산 수정 (로그에 기록이 쌓임)
		else if (com.equals("/assetModify.do")) {
			logDao = new LogDao();
			HttpSession session = request.getSession();
			String id = (String) session.getAttribute("id");
			logDao.insertLogDao(request.getParameter("code"), request.getParameter("modiState"),
					id, request.getParameter("modiLocation"));
			viewPage = "assetManagement.do";
		}
		// 자산 완전 삭제
		else if (com.equals("/assetDelete.do")) {
			assetDao = new AssetDao();
			logDao = new LogDao();
			assetDao.deleteAssetDao(request.getParameter("code"));
			logDao.deleteLogDao(request.getParameter("code"));
			viewPage = "assetManagement.do";
		} else {
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
		dispatcher.forward(request, response);
	}

}
