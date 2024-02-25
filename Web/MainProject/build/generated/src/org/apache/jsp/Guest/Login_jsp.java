package org.apache.jsp.Guest;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.ResultSet;

public final class Login_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write('\n');
      out.write('\n');
      DB.ConnectionClass con = null;
      synchronized (_jspx_page_context) {
        con = (DB.ConnectionClass) _jspx_page_context.getAttribute("con", PageContext.PAGE_SCOPE);
        if (con == null){
          con = new DB.ConnectionClass();
          _jspx_page_context.setAttribute("con", con, PageContext.PAGE_SCOPE);
        }
      }
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("         <title>Login Page</title>\n");
      out.write("        <meta charset=\"utf-8\">\n");
      out.write("    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1, shrink-to-fit=no\">\n");
      out.write("\n");
      out.write("\t<link href=\"https://fonts.googleapis.com/css?family=Lato:300,400,700&display=swap\" rel=\"stylesheet\">\n");
      out.write("\n");
      out.write("\t<link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css\">\n");
      out.write("\t\n");
      out.write("        <link rel=\"stylesheet\" href=\"../Assets/Template/Login/css/style.css\">\n");
      out.write("\n");
      out.write("       \n");
      out.write("    </head>\n");
      out.write("    \n");
      out.write("        ");

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
            
            
      out.write("\n");
      out.write("        <body class=\"img js-fullheight\" style=\"background-image: url(../Assets/Template/Login/images/bg.jpg);\">\n");
      out.write("\t<section class=\"ftco-section\">\n");
      out.write("\t\t<div class=\"container\">\n");
      out.write("\t\t\t<div class=\"row justify-content-center\">\n");
      out.write("\t\t\t\t<div class=\"col-md-6 text-center mb-5\">\n");
      out.write("\t\t\t\t\t<h2 class=\"heading-section\">Login</h2>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"row justify-content-center\">\n");
      out.write("\t\t\t\t<div class=\"col-md-6 col-lg-4\">\n");
      out.write("\t\t\t\t\t<div class=\"login-wrap p-0\">\n");
      out.write("\t\t      \t<h3 class=\"mb-4 text-center\">Have an account?</h3>\n");
      out.write("                        <form action=\"#\" class=\"signin-form\" method=\"post\">\n");
      out.write("\t\t      \t\t<div class=\"form-group\">\n");
      out.write("\t\t      \t\t\t<input type=\"text\" name=\"txt_email\" class=\"form-control\" placeholder=\"Email\" required>\n");
      out.write("\t\t      \t\t</div>\n");
      out.write("\t            <div class=\"form-group\">\n");
      out.write("\t              <input id=\"password-field\" type=\"password\" name=\"txt_password\" class=\"form-control\" placeholder=\"Password\" required>\n");
      out.write("\t              <span toggle=\"#password-field\" class=\"fa fa-fw fa-eye field-icon toggle-password\"></span>\n");
      out.write("\t            </div>\n");
      out.write("\t            <div class=\"form-group\">\n");
      out.write("\t            \t<button type=\"submit\" name=\"btn_save\" class=\"form-control btn btn-primary submit px-3\">Sign In</button>\n");
      out.write("\t            </div>\n");
      out.write("\t            <div class=\"form-group d-md-flex\">\n");
      out.write("\t            \t<div class=\"w-50\">\n");
      out.write("\t\t            \t<label class=\"checkbox-wrap checkbox-primary\">Remember Me\n");
      out.write("\t\t\t\t\t\t\t\t\t  <input type=\"checkbox\" checked>\n");
      out.write("\t\t\t\t\t\t\t\t\t  <span class=\"checkmark\"></span>\n");
      out.write("\t\t\t\t\t\t\t\t\t</label>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t\t\t\t<div class=\"w-50 text-md-right\">\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href=\"#\" style=\"color: #fff\">Forgot Password</a>\n");
      out.write("\t\t\t\t\t\t\t\t</div>\n");
      out.write("\t            </div>\n");
      out.write("\t          </form>\n");
      out.write("\t          <p class=\"w-100 text-center\">&mdash; Or Register &mdash;</p>\n");
      out.write("\t          <div class=\"social d-flex text-center\">\n");
      out.write("                      <a href=\"CompanyRegistration.jsp\" class=\"px-2 py-2 mr-md-1 rounded\"><span class=\"ion-logo-facebook mr-2\"></span> Company</a>\n");
      out.write("                      <a href=\"UserRegistration.jsp\" class=\"px-2 py-2 ml-md-1 rounded\"><span class=\"ion-logo-twitter mr-2\"></span> User</a>\n");
      out.write("\t          </div>\n");
      out.write("\t\t      </div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</section>\n");
      out.write("\n");
      out.write("\t<script src=\"js/jquery.min.js\"></script>\n");
      out.write("  <script src=\"js/popper.js\"></script>\n");
      out.write("  <script src=\"js/bootstrap.min.js\"></script>\n");
      out.write("  <script src=\"js/main.js\"></script>\n");
      out.write("\n");
      out.write("\t</body>\n");
      out.write("    </form>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
