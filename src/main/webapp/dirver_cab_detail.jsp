<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@page import="com.entity.Driver" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>addContact</title>
<%@include file="component/allCss.jsp"%>
</head>
<body>
	<%@include file="component/navbar.jsp"%>
	<%
	Driver d=(Driver)session.getAttribute("Driver");
	if (d == null) {
		session.setAttribute("invalidMsg", "Login please...");
		response.sendRedirect("driver_login.jsp");
	}
	%>


	<div class="container-fluid">
		<div class="row p-2">
			<div class="col-md-6 offset-md-3">

				<div class="card"></div>
				<div class="card-body border border-secondary">
					<h4 class="text-center text-success">Add Cab</h4>
					
					<%
					String sucMsg = (String) session.getAttribute("sucMsg");
					String errMsg = (String) session.getAttribute("errMsg");
					if (sucMsg != null) {
					%>
					<p class="text-success text-center"><%= sucMsg %></p>

					<%
					session.removeAttribute("sucMsg");
					}
					if(errMsg!=null){
					%>
					<p class="text-danger text-center"><%= errMsg %></p>
					<%
					session.removeAttribute("errMsg");
					}
					%>
					
					<form action="driver_cab_detail" method="post" class="bg-white">
						<%
						if(u!=null){
						%>
						<input type="hidden" value="<%=u.getId()%>" name="userid">
						<% 
						}
						
						
						%>
						<div class="form-group">
							<label for="exampleInputEmail1">Cab No:</label> <input
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="cabno">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">Cab Type:</label> <input
								type="text" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="cabtype">
						</div>
						<div class="form-group">
							<label for="exampleInputEmail1">No Of Seats:</label> <input
								type="number" class="form-control" id="exampleInputEmail1"
								aria-describedby="emailHelp" name="noseats">
						</div>

						

						<div class="text-center mt-2">
							<button type="submit" class="btn btn-primary">Add
								Contact</button>
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