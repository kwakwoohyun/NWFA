package com.skhu.NWFA.user.userController;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Address;
import javax.mail.Message;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
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
import com.skhu.NWFA.util.Gmail;
import com.skhu.NWFA.yaminGame.yaminModel.wordsModel;


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

	@RequestMapping("idFinder")
	public String idFinder() {
		return "login/idFinder";
	}

	@RequestMapping("IDFinder")
	protected void doPost3(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userEmail = (String) request.getParameter("userEmail");
		String result = new UserDAO().getUserID(userEmail);

		if (userEmail == null || userEmail.equals("")) {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "이메일을 입력해주세요.");
			response.sendRedirect("idFinder");
			return;
		} else if (result == null || result.equals("")) {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "등록된 이메일이 없습니다.");
			response.sendRedirect("idFinder");
			return;
		}

		if (result != null) {
			request.getSession().setAttribute("messageType", "1");
			request.getSession().setAttribute("messageContent", result);
			response.sendRedirect("idFinder");
			return;
		}
	}

	@RequestMapping("PwFinder")
	protected void doPost4(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		new UserDAO();
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userEmail = (String) request.getParameter("userEmail");
		String result = new UserDAO().searchPassword(userEmail);

		if (userEmail == null || userEmail.equals("")) {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "이메일을 입력해주세요.");
			response.sendRedirect("idFinder");
			return;
		} else if (result == null || result.equals("")) {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "등록된 이메일이 없습니다.");
			response.sendRedirect("idFinder");
			return;
		}

		if (result != null) {
			String newPassword = new UserDAO().updateUserPassword(userEmail);
			// 사용자에게 보낼 메시지를 기입합니다.
			String from = "newwordgame1234@gmail.com";
			String to = userEmail;
			String subject = "모두의 신조어 임시 비밀번호 발급 메일입니다.";

			// SMTP에 접속하기 위한 정보를 기입합니다.
			Properties p = new Properties();

			p.put("mail.smtp.user", from);
			p.put("mail.smtp.host", "smtp.googlemail.com");
			p.put("mail.smtp.port", "465");
			p.put("mail.smtp.starttls.enable", "true");
			p.put("mail.smtp.auth", "true");
			p.put("mail.smtp.debug", "true");
			p.put("mail.smtp.socketFactory.port", "465");
			p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
			p.put("mail.smtp.socketFactory.fallback", "false");

			try {
				Authenticator auth = new Gmail();
				Session ses = Session.getInstance(p, auth);
				ses.setDebug(true);
				MimeMessage msg = new MimeMessage(ses);
				msg.setSubject(subject);
				Address fromAddr = new InternetAddress(from);
				msg.setFrom(fromAddr);
				Address toAddr = new InternetAddress(to);
				msg.addRecipient(Message.RecipientType.TO, toAddr);
				msg.setContent(
						"<img src=\"http://ec2-52-79-242-250.ap-northeast-2.compute.amazonaws.com/project/tmppw.png\">"
								+ "<h1>임시 비밀번호:  <mark><strong>" + newPassword + "</strong></mark></h1>",
						"text/html;charset=UTF-8");
				Transport.send(msg);
			} catch (Exception e) {
				e.printStackTrace();
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류가 발생했습니다.');");
				script.println("history.back();");
				script.println("</script>");
				script.close();
				return;
			}
			request.getSession().setAttribute("messageType", "2");
			request.getSession().setAttribute("messageContent", "임시비밀번호를 입력하신 메일로 발송했습니다.");
			response.sendRedirect("idFinder");
			return;
		}
	}

	@RequestMapping("userlogin")
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID = request.getParameter("userID");
		String userPassword = request.getParameter("userPassword");
		if (userID == null || userID.equals("") || userPassword == null || userPassword.equals("")) {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
			response.sendRedirect("login");
			return;
		}
		int result = new UserDAO().login(userID, userPassword);
		if (result == 1) {
			request.getSession().setAttribute("userID", userID);
			request.getSession().setAttribute("messageType", "성공 메시지");
			request.getSession().setAttribute("messageContent", "로그인에 성공했습니다.");
			response.sendRedirect("login");
			return;
		} else if (result == 0) {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "비밀번호가 맞지 않습니다.");
			response.sendRedirect("login");
			return;
		} else if (result == -1) {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "아이디가 없습니다.");
			response.sendRedirect("login");
			return;
		} else if (result == -2) {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "인터넷 연결을 확인해주세요.");
			response.sendRedirect("login");
			return;
		}
	}

	@RequestMapping("update")
	public String update() {
		return "login/update";
	}

	@RequestMapping("userupdate")
	protected void doPost2(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		String userID = request.getParameter("userID");
		String userPassword1 = request.getParameter("userPassword1");
		String userPassword2 = request.getParameter("userPassword2");
		if (userPassword1 == null || userPassword1.equals("") || userPassword2 == null || userPassword2.equals("")) {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "모든 내용을 입력하세요.");
			response.sendRedirect("update");
			return;
		}
		if (!userPassword1.equals(userPassword2)) {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "비밀번호가 일치하지 않습니다.");
			response.sendRedirect("update");
			return;
		}
		for (int i = 0; i < userPassword1.length(); i++) {
			char ps = userPassword1.charAt(i);
			if (ps == ' ') {
				request.getSession().setAttribute("messageType", "-1");
				request.getSession().setAttribute("messageContent", "비밀번호에 공백을 입력할 수 없습니다.");
				response.sendRedirect("update");
				return;
			}
			if (userPassword1.length() < 8) {
				request.getSession().setAttribute("messageType", "-1");
				request.getSession().setAttribute("messageContent", "8자리 이상 비밀번호를 입력하세요.");
				response.sendRedirect("update");
				return;
			}
		}
		int result = new UserDAO().update(userPassword1, userID);
		if (result == 1) {
			request.getSession().setAttribute("messageType", "1");
			request.getSession().setAttribute("messageContent", "비밀번호 변경에 성공했습니다.");
			response.sendRedirect("update");
			return;
		} else {
			request.getSession().setAttribute("messageType", "-1");
			request.getSession().setAttribute("messageContent", "데이터베이스 오류가 발생했습니다.");
			response.sendRedirect("update");
			return;
		}
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
		for (int i = 0; i < userID.length(); i++) {
			char ch = userID.charAt(i);
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "아이디는 영문소문자와 숫자만 사용 가능합니다.");
				response.sendRedirect("accounts");
				return;
			}
			if (userID.length() < 6) {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "6자리 이상 아이디를 입력하세요.");
				response.sendRedirect("accounts");
				return;
			}
		}

		for (int i = 0; i < userPassword1.length(); i++) {
			char ps = userPassword1.charAt(i);
			if (ps == ' ') {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "비밀번호에 공백을 입력할 수 없습니다.");
				response.sendRedirect("accounts");
				return;
			}
			if (userPassword1.length() < 8) {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "8자리 이상 비밀번호를 입력하세요.");
				response.sendRedirect("accounts");
				return;
			}
		}
		for (int i = 0; i < userAge.length(); i++) {
			char age = userAge.charAt(i);
			if (!(age >= '0' && age <= '9')) {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "나이는 숫자만 입력해주세요.");
				response.sendRedirect("accounts");
				return;
			}
		}
		if (userEmail.indexOf("@") == -1) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "이메일을 다시 입력해주세요.");
			response.sendRedirect("accounts");
			return;
		}
		for (int i = 0; i < userID.length(); i++) {
			char ch = userID.charAt(i);
			if (!(ch >= '0' && ch <= '9') && !(ch >= 'a' && ch <= 'z')) {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "아이디는 영문소문자와 숫자만 사용 가능합니다.");
				response.sendRedirect("accounts");
				return;
			}
			if (userID.length() < 6) {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "6자리 이상 아이디를 입력하세요.");
				response.sendRedirect("accounts");
				return;
			}
		}
		for (int i = 0; i < userPassword1.length(); i++) {
			char ps = userPassword1.charAt(i);
			if (ps == ' ') {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "비밀번호에 공백을 입력할 수 없습니다.");
				response.sendRedirect("accounts");
				return;
			}
			if (userPassword1.length() < 8) {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "8자리 이상 비밀번호를 입력하세요.");
				response.sendRedirect("accounts");
				return;
			}
		}
		for (int i = 0; i < userAge.length(); i++) {
			char age = userAge.charAt(i);
			if (!(age >= '0' && age <= '9')) {
				request.getSession().setAttribute("messageType", "오류 메시지");
				request.getSession().setAttribute("messageContent", "나이는 숫자만 입력해주세요.");
				response.sendRedirect("accounts");
				return;
			}
		}
		if (userEmail.indexOf("@") == -1) {
			request.getSession().setAttribute("messageType", "오류 메시지");
			request.getSession().setAttribute("messageContent", "이메일을 다시 입력해주세요.");
			response.sendRedirect("accounts");
			return;
		}
		int result = new UserDAO().register(userID, userPassword1, userName, userAge, userGender, userEmail);
		if (result == 1) {
			// user stage 초기화
			userModel user = Uservice.selectID(userID);
			int user_id = user.getUser_id();
			Uservice.insertUserStage(user_id);
			// word 객체 가져오기
			List<wordsModel> Allwords = Uservice.Allwords();
			// user word 초기화
			for (int i = 0; i < Allwords.size(); i++) {
				Uservice.insertUserWord(user_id, Allwords.get(i).getGameNum(), Allwords.get(i).getStage_id(),
						Allwords.get(i).getWord_id());
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
