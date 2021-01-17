package com.javaex.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.javaex.dao.BoardDao;
import com.javaex.util.WebUtil;
import com.javaex.vo.BoardVo;
import com.javaex.vo.UserVo;

@WebServlet("/board")
public class BoardController extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("게시판컨트롤");

		String action = request.getParameter("action");
		System.out.println("action: " + action);

		if ("writeform".equals(action)) {
			System.out.println("글쓰기 폼");

			WebUtil.forward(request, response, "/WEB-INF/views/board/WriteForm.jsp");

		} else if ("write".equals(action)) {

			System.out.println("글쓰기");

			// 세션에서 no 가져오기
			HttpSession session = request.getSession();
			UserVo authUser = (UserVo) session.getAttribute("authUser");
			int no = authUser.getNo();

			// 파라미터 값

			String title = request.getParameter("title");
			String content = request.getParameter("content");

			System.out.println(title);
			System.out.println(content);
			System.out.println(no);

			// dao
			BoardDao boardDao = new BoardDao();
			boardDao.insert(new BoardVo(title, content, no));

			// 리스트로 돌아오기
			response.sendRedirect("/mysite3/board?action=list");

		} else if ("delete".equals(action)) {
			System.out.println("삭제");

			int no = Integer.parseInt(request.getParameter("no"));
			System.out.println(no);

			BoardVo bvo = new BoardVo(no);
			BoardDao bdao = new BoardDao();

			bdao.delete(bvo);

			// 리스트로 돌아오기
			response.sendRedirect("/mysite3/board?action=list");

		} else if ("read".equals(action)) {
			System.out.println("조회");

			
			
			// dao
			int no = Integer.parseInt(request.getParameter("no"));

			BoardDao bdao = new BoardDao();
			BoardVo bvo = new BoardVo();
			
			
			bvo = bdao.getone(no);
			bdao.hit(no);
			
			// 데이터 전달
			request.setAttribute("bvo", bvo);

			System.out.println(bvo);

			WebUtil.forward(request, response, "/WEB-INF/views/board/Read.jsp");

		} else if ("modifyform".equals(action)) {
			System.out.println("수정폼");

			// dao
			int no = Integer.parseInt(request.getParameter("no"));

			BoardDao bdao = new BoardDao();
			BoardVo bvo = new BoardVo();

			bvo = bdao.getone(no);

			// 데이터 전달
			request.setAttribute("bvo", bvo);
			System.out.println(bvo);

			WebUtil.forward(request, response, "/WEB-INF/views/board/ModifyForm.jsp");

		} else if ("modify".equals(action)) {
			System.out.println("수정");

			// 파라미터
			int no = Integer.parseInt(request.getParameter("no"));
			String title = request.getParameter("title");
			String content = request.getParameter("content");

			// 저장
			BoardVo bvo = new BoardVo(no, title, content);

			BoardDao bdao = new BoardDao();
			bdao.update(bvo);

			WebUtil.forward(request, response, "/board?action=read&no="+ no);
			//response.sendRedirect("./board?action=read");
			
		} else /* ("list".equals(action)) */ {
			System.out.println("게시판");
			BoardDao boardDao = new BoardDao();
			List<BoardVo> bList = boardDao.BList();

			// 데이터 전달
			request.setAttribute("boardList", bList);

			// 세션에서 no 가져오기
			HttpSession session = request.getSession();
			UserVo authUser = (UserVo) session.getAttribute("authUser");
			System.out.println("authUser:" + authUser);

			// jsp포워드
			WebUtil.forward(request, response, "/WEB-INF/views/board/List.jsp");

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
