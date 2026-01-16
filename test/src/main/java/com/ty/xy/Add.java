package com.ty.xy;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ty.conn.Connection_Pool;

@WebServlet("/add")
public class Add extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String username = req.getParameter("username");
		String email = req.getParameter("email");
		String id = req.getParameter("id");
		String address = req.getParameter("address");
		String password = req.getParameter("password");
		
		Connection con = Connection_Pool.giveConnection();
		
		String insert = "INSERT INTO users (username, email,id ,address, password) VALUES (?, ?, ?,?,?)";
		
		try {
			PreparedStatement pstm =con.prepareStatement(insert);
			pstm.setString(1, username);
			pstm.setString(2, email);
			pstm.setString(3, id);
			pstm.setString(4, address);
			pstm.setString(5, password);
			
			pstm.executeUpdate();
			
			Connection_Pool.submitConnection(con);
			
			resp.sendRedirect("index.jsp?succ=Added+Successfully");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			resp.sendRedirect("index.jsp?err=Failed");
		}
		
		
		
	}

}
