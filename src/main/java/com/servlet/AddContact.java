package com.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.conn.DBConnect;
import com.dao.ContactDAO;
import com.entity.Contact;
@WebServlet("/addcontact")
public class AddContact extends HttpServlet {
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int userid=Integer.parseInt( req.getParameter("userid"));
		String name=req.getParameter("name");
		String email=req.getParameter("email");
		String phone=req.getParameter("phone");
		String about=req.getParameter("about");
		
		Contact c=new Contact();
		c.setName(name);
		c.setEmail(email);
		c.setUserId(userid);
		c.setAbout(about);
		c.setPhone(phone);
		ContactDAO dao=new ContactDAO(DBConnect.getConn());
		boolean f=dao.saveContact(c);
		HttpSession session=req.getSession();
		if (f) {
			session.setAttribute("sucMsg", "Your Contact saved...");
			resp.sendRedirect("addContact.jsp");
		} else {
			session.setAttribute("errMsg", "Your Contact Not saved Something wrong on server...");
			resp.sendRedirect("addContact.jsp");
		}
		
	}
}
