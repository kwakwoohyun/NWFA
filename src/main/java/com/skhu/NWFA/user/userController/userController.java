package com.skhu.NWFA.user.userController;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skhu.NWFA.sejongGame.sejongService.sejongService;
import com.skhu.NWFA.user.userDao.UserDAO;
import com.skhu.NWFA.user.userModel.userModel;
import com.skhu.NWFA.user.userService.userService;

@Controller
public class userController {

	@Autowired(required = false)
	userService Uservice;
	@Autowired
	sejongService Sservice;

	@RequestMapping("tempmenu")
	public String tmepmenu() {
		return "tempmenu";
	}

	@RequestMapping("login")
	public String login() {
		return "login/login";
	}

	@RequestMapping("logout")
	public String logout() {
		return "/login/logout";
	}

	@RequestMapping("accounts")
	public String accounts() {
		return "login/accounts";
	}

	@RequestMapping("loginAction")
	public String loginAction() {
		return "/login/loginAction";
	}

	@RequestMapping("userRegister")
	protected void doPost(HttpServletRequest request, HttpServletResponse response, HttpSession session)
			throws ServletException, IOException {
		final long serialVersionUID = 1L;

		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID = request.getParameter("userID");
		String userPassword1 = request.getParameter("userPassword1");
		String userPassword2 = request.getParameter("userPassword2");
		String userName = request.getParameter("userName");
		String userAge = request.getParameter("userAge");
		String userGender = request.getParameter("userGender");
		String userEmail = request.getParameter("userEmail");
		if (userID == null || userID.equals("") || userPassword1 == null || userPassword1.equals("")
				|| userPassword2 == null || userPassword2.equals("") || userName == null || userName.equals("")
				|| userAge == null || userAge.equals("") || userGender == null || userGender.equals("")
				|| userEmail == null || userEmail.equals("")) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
			response.sendRedirect("accounts");
			return;
		}
		if (!userPassword1.equals(userPassword2)) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "비밀번호가 일치하지 않습니다.");
			response.sendRedirect("accounts");
			return;
		}
		int result = new UserDAO().register(userID, userPassword1, userName, userAge, userGender, userEmail);
		if (result == 1) {

			userModel user = Uservice.selectID(userID);
			int user_id = user.getUser_id();
			Uservice.insertInfo(user_id);
			for (int i = 2; i < 4; i++) {
				Uservice.insertInfo2(user_id, i);
			}
			for (int i = 5; i < 9; i++) {
				Uservice.insertInfo3(user_id, i);
			}
		
			Uservice.insertYaminInfo1(user_id);
			for(int i=9;i<13;i++) {
				Uservice.insertYaminInfo2(user_id, i);
			}
			request.getSession().setAttribute("messageType", "성공 메시지");
			request.getSession().setAttribute("messageContent", "회원가입에 성공했습니다.");
			response.sendRedirect("login");
			return;
		} else {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "이미 존재하는 회원입니다.");
			response.sendRedirect("accounts");
			return;
		}
	}
}
