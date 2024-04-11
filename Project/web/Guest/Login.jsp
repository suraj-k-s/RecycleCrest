<%-- 
    Document   : login
    Created on : 21-Dec-2019, 03:41:44
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
         <title>Login Page</title>
        <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

	<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap" rel="stylesheet">

	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
	
        <link rel="stylesheet" href="../Assets/Template/Login/css/style.css">

       
    </head>
    
        <%
            if(request.getParameter("btn_save")!=null)
            {
                String sel="select * from tbl_admin where admin_email='"+request.getParameter("txt_email")+"' and admin_password='"+request.getParameter("txt_password")+"'";
                ResultSet rs =con.selectCommand(sel);
                
                String Sel1="select * from tbl_panchayath where panchayath_email='"+request.getParameter("txt_email")+"' and panchyath_password='"+request.getParameter("txt_password")+"'";
                //out.print(Sel1);
                ResultSet rs1=con.selectCommand(Sel1);
                
                String sel2="select * from tbl_company where company_email='"+request.getParameter("txt_email")+"' and company_password='"+request.getParameter("txt_password")+"'";
                ResultSet rs2 =con.selectCommand(sel2);
                
                String sel3="select * from tbl_user where user_email='"+request.getParameter("txt_email")+"' and user_password='"+request.getParameter("txt_password")+"'";
                ResultSet rs3 =con.selectCommand(sel3);
                
                String sel4="select * from tbl_driver where driver_email='"+request.getParameter("txt_email")+"' and driver_password='"+request.getParameter("txt_password")+"'";
                ResultSet rs4 =con.selectCommand(sel4);
                
                
                if(rs.next())
                {
                    session.setAttribute("aid", rs.getString("admin_id"));
                    session.setAttribute("aname", rs.getString("admin_name"));
                    response.sendRedirect("../Admin/Home.jsp");
                }
                else if(rs1.next()) 
               {
                   session.setAttribute("pid", rs1.getString("panchayath_id"));
                   session.setAttribute("pname", rs1.getString("panchayath_name"));
                   response.sendRedirect("../Panchayath/Home.jsp");
               }
                 else if(rs2.next()) 
               {
                   session.setAttribute("cid", rs2.getString("company_id"));
                   session.setAttribute("cname", rs2.getString("company_name"));
                   response.sendRedirect("../Company/Home.jsp");
               }
                else if(rs3.next()) 
               {
                   session.setAttribute("uid", rs3.getString("user_id"));
                   session.setAttribute("uname", rs3.getString("user_name"));
                   session.setAttribute("pid", rs3.getString("place_id"));
                   response.sendRedirect("../User/Home.jsp");
               }
                else if(rs4.next()) 
               {
                   session.setAttribute("did", rs4.getString("driver_id"));
                   session.setAttribute("dname", rs4.getString("driver_name"));
                   response.sendRedirect("../Driver/Home.jsp");
               }
            }
            
            %>
        <body class="img js-fullheight" style="background-image: url(../Assets/Template/Login/images/bg.jpg);">
	<section class="ftco-section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6 text-center mb-5">
					<h2 class="heading-section">Login</h2>
				</div>
			</div>
			<div class="row justify-content-center">
				<div class="col-md-6 col-lg-4">
					<div class="login-wrap p-0">
		      	<h3 class="mb-4 text-center">Have an account?</h3>
                        <form action="#" class="signin-form" method="post">
		      		<div class="form-group">
		      			<input type="text" name="txt_email" class="form-control" placeholder="Email" required>
		      		</div>
	            <div class="form-group">
	              <input id="password-field" type="password" name="txt_password" class="form-control" placeholder="Password" required>
	              <span toggle="#password-field" class="fa fa-fw fa-eye field-icon toggle-password"></span>
	            </div>
	            <div class="form-group">
	            	<button type="submit" name="btn_save" class="form-control btn btn-primary submit px-3">Sign In</button>
	            </div>
	            <div class="form-group d-md-flex">
	            	<div class="w-50">
		            	<label class="checkbox-wrap checkbox-primary">Remember Me
									  <input type="checkbox" checked>
									  <span class="checkmark"></span>
									</label>
								</div>
								<div class="w-50 text-md-right">
									<a href="#" style="color: #fff">Forgot Password</a>
								</div>
	            </div>
	          </form>
	          <p class="w-100 text-center">&mdash; Or Register &mdash;</p>
	          <div class="social d-flex text-center">
                      <a href="CompanyRegistration.jsp" class="px-2 py-2 mr-md-1 rounded"><span class="ion-logo-facebook mr-2"></span> Company</a>
                      <a href="UserRegistration.jsp" class="px-2 py-2 ml-md-1 rounded"><span class="ion-logo-twitter mr-2"></span> User</a>
	          </div>
		      </div>
				</div>
			</div>
		</div>
	</section>

	<script src="js/jquery.min.js"></script>
  <script src="js/popper.js"></script>
  <script src="js/bootstrap.min.js"></script>
  <script src="js/main.js"></script>

	</body>
    </form>
</html>
