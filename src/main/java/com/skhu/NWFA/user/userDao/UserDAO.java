package com.skhu.NWFA.user.userDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.skhu.NWFA.user.userModel.UserDTO;
import com.skhu.NWFA.util.RandomPassword;

public class UserDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;

	public UserDAO() {
		try {
			String dbURL = "jdbc:mysql://soptserver.cbspdyahhen8.ap-northeast-2.rds.amazonaws.com:3306/capstonedesign?serverTimezone=UTC";
			String dbID = "minjony1014";
			String dbPassword = "1a2w3e4r!!";
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public String updateUserPassword(String userEmail) {
	      String newPassword = RandomPassword.randomPassword(10);
	      String SQL = "UPDATE User SET password = ? WHERE email = ?";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, newPassword);
	         pstmt.setString(2, userEmail);
	         pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return newPassword; // 비밀번호 반환
	   }
	
	public String searchPassword(String userEmail) {
	      String SQL = "SELECT password FROM User WHERE email = ?";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, userEmail);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            return rs.getString(1); // password 주소 반환
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return null; // 데이터베이스 오류
	   }

	public String getUserID(String userEmail) {
	      String SQL = "SELECT login_id FROM User WHERE email = ?";
	      try {
	         PreparedStatement pstmt = conn.prepareStatement(SQL);
	         pstmt.setString(1, userEmail);
	         rs = pstmt.executeQuery();
	         while (rs.next()) {
	            return rs.getString(1); // ID 주소 반환
	         }
	      } catch (SQLException e) {
	         e.printStackTrace();
	      }
	      return null; // 데이터베이스 오류
	   }
	
	public UserDTO getUser(String userID) {
		UserDTO user = new UserDTO();
		String SQL = "SELECT login_id, password FROM User WHERE login_id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				user.setUserID(userID);
				user.setUserPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return user;
	}
	
	public int update(String userPassword, String userID) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String SQL ="UPDATE User SET password = ? WHERE login_id = ?";
        try {
           pstmt = conn.prepareStatement(SQL);
           pstmt.setString(1, userPassword);
           pstmt.setString(2, userID);
           return pstmt.executeUpdate();
        } catch (Exception e) {
           e.printStackTrace();
        } finally {
           try {
              if(rs != null) rs.close();
              if(pstmt != null) pstmt.close();
           } catch (Exception e) {
              e.printStackTrace();
        }
     }
        return -1; //데이터베이스 오류
     }

	public int login(String login_id, String userPassword) {
		String SQL = "SELECT password FROM User WHERE login_id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, login_id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				if (rs.getString(1).equals(userPassword))
					return 1; // 로그인 성공
				else
					return 0; // 비밀번호 불일치
			}
			return -1;// 아이디가 없음
		} catch (Exception e) {
			e.printStackTrace();
		}
		return -2;// 데이터베이스 오류
	}

	public int registerCheck(String userID) {
		String SQL = "SELECT * FROM User WHERE login_id = ?";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			rs = pstmt.executeQuery();
			if (rs.next() || userID.equals("")) {
				return 0; // 이미 존재하는 회원
			} else {
				return 1; // 가입 가능한 회원 아이디
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 데이터베이스 오류
	}

	public int register(String login_id, String password, String name, String age, String sex, String email) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String SQL = "INSERT INTO User(login_id,password,name,age,sex,email) VALUES (?, ?, ?, ?, ?, ?)";
		try {
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, login_id);
			pstmt.setString(2, password);
			pstmt.setString(3, name);
			pstmt.setInt(4, Integer.parseInt(age));
			pstmt.setString(5, sex);
			pstmt.setString(6, email);
			System.out.println("디비 입력 완료");
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (pstmt != null)
					pstmt.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1; // 데이터베이스 오류
	}

}