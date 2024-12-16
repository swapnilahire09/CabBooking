<%@page import="com.conn.DBConnect"%>
<%@page import="com.dao.ContactDAO"%>
<%@page import="com.entity.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	if (u == null) {
		session.setAttribute("invalidMsg", "Login please...");
		response.sendRedirect("login.jsp");
	}
	%>
	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">

				<div class="card"></div>
				<div class="card-body border border-secondary">
					<h4 class="text-center text-success">Add Contact Page</h4>

					<%
					
					String errMsg = (String) session.getAttribute("errMsg");
					
					if (errMsg != null) {
					%>
					<p class="text-danger text-center"><%=errMsg%></p>
					<%
					session.removeAttribute("errMsg");
					}
					%>

					<form action="update" method="post" class="bg-white">
						<%
						int cid = Integer.parseInt(request.getParameter("cid"));
						ContactDAO dao = new ContactDAO(DBConnect.getConn());
						Contact c = dao.getContactById(cid);
						%>
						<input type="hidden" value="<%=cid%>" name="cid">
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Name</label> <input
								value="<%=c.getName()%>" type="text" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp" name="name">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Email</label> <input
								value="<%=c.getEmail()%>" type="email" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								name="email">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Enter Phone no</label> <input
								value="<%=c.getPhone()%>" type="number" class="form-control"
								id="exampleInputEmail1" aria-describedby="emailHelp"
								name="phone">
						</div>

						<div class="form-group">
							<label for="exampleInputEmail1"></label>
							<textarea name="about" rows="3" cols="" placeholder="Enter About"><%=c.getAbout()%></textarea>
						</div>

						<div class="text-center mt-2">
							<button type="submit" class="btn btn-primary">Update</button>
						</div>
					</form>


				</div>
			</div>
		</div>
	</div>

	<div class="footer">
		<%@ include file="component/footer.jsp"%>
	</div>
</body>
</html>