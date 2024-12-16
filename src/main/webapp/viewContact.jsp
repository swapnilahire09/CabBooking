<%@page import="java.util.*"%>
<%@page import="com.entity.*"%>
<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>viewContact</title>
<%@include file="component/allCss.jsp"%>

<style type="text/css">
.crd-ho:hover {
	background-color: #f7f7f7;
}


</style>
</head>
<body>
	<%@include file="component/navbar.jsp"%>

	<%
	if (u == null) {
		session.setAttribute("invalidMsg", "Login please...");
		response.sendRedirect("login.jsp");
	}
	%>

	<%
	String sucMsg = (String) session.getAttribute("sucMsg");
	String errMsg = (String) session.getAttribute("errMsg");
	if (sucMsg != null) {
	%>
	<div class="alert alert-success" role="alert"><%=sucMsg%></div>
	<%
	session.removeAttribute("sucMsg");
	}
	if (errMsg != null) {
	%>
	<p class="text-danger text-center"><%=errMsg%></p>
	<%
	session.removeAttribute("errMsg");
	}
	%>

	<div class="container">
		<div class="row p-4">


			<%
			if (u != null) {

				ContactDAO dao = new ContactDAO(DBConnect.getConn());
				List<Contact> contact = dao.getAllContact(u.getId());
				for (Contact c : contact) {
			%>
			<div class="col-md-3 p-2">

				<div class="card crd-ho">
					<div class="card-body">
						<h5>
							Name:-
							<%=c.getName()%>
						</h5>
						<p>
							Email:-
							<%=c.getEmail()%>
						</p>
						<p>
							Phone No:-
							<%=c.getPhone()%>
						</p>
						<p>
							About:-
							<%=c.getAbout()%>
						</p>

						<div class="text-center">
							<a href="editContact.jsp?cid=<%=c.getId()%>"
								class="btn btn-success btn-sm text-white">Edit</a> <a
								href="delete?cid=<%=c.getId()%>"
								class="btn btn-danger btn-sm text-white">Delete</a>
						</div>
					</div>
				</div>
			</div>
			<%
			}

			}
			%>



		</div>
	</div>
	<div class="footer">
		<%@ include file="component/footer.jsp"%>
	</div>
</body>
</html>