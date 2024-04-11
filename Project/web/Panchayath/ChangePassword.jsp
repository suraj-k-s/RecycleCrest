<%-- 
    Document   : ChangePassword
    Created on : 04-Feb-2023, 06:07:32
    Author     : PSST
--%>
<%@include  file="SessionValidator.jsp" %>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Change Password</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
         <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btn_save")!=null)
           {
               String cpass=request.getParameter("txt_cpass");
               String npass=request.getParameter("txt_npass");
               String conpass=request.getParameter("txt_conpass");
               String selQry="select * from tbl_panchayath where panchyath_password='"+cpass+"' and panchayath_id='"+session.getAttribute("pid")+"'";
              // out.print(selQry);
               ResultSet rs=con.selectCommand(selQry);
               if(rs.next())
               {
                   if(npass.equals(conpass))
                   {
               String upQry="update tbl_panchayth set panchayth_password='"+npass +"' where panchayath_id='"+session.getAttribute("pid")+"'";
               //out.print(upQry);
               if(con.executeCommand(upQry))
               {
                 %>
                    <script>
                        alert("data updated");
                        window.location="ChangePassword.jsp";
                    </script>
                    <%
                }
                   }
                   else{
                       %>
                 <script>
                     alert("data mismatch");
                     window.location="ChangePassword.jsp";
                 </script>
                 <%
                   }
               }
                else{
                 %>
                 <script>
                     alert("data updation failed");
                     window.location="ChangePassword.jsp";
                 </script>
                 <%
           }
                   
           
     }
            %>
            <h1 align="center"><b>CHANGE PASSWORD</b></h1>
            <br><br>
        <form method="post">
        <table border='2' align="center">
        <tr>
            <td>Current Password</td>
            <td><input type="text" name="txt_cpass" required="required" placeholder="Current password" title="Must Contain Atleast One Number And One Uppercase and Lowecase Letter, And Atleast 8 or More Characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"></td>
        </tr>
        <tr>
            <td>New Password</td>
            <td><input type="text" name="txt_npass" required="required" placeholder="New Password" title="Must Contain Atleast One Number And One Uppercase and Lowecase Letter, And Atleast 8 or More Characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"></td>
        </tr>
        <tr>
            <td>Confirm Password</td>
            <td><input type="text" name="txt_conpass" required="required" placeholder="Confirm Password" title="Must Contain Atleast One Number And One Uppercase and Lowecase Letter, And Atleast 8 or More Characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" name="btn_save" value="Save">
                <input type="submit" name="btn_cancel" value="Cancel">
            </td>
        </tr>
        </table>
    </form>
                    </div>

    </body>
    
</html>
<%@include file="Foot.jsp" %>