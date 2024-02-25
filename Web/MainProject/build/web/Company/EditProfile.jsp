<%-- 
    Document   : EditProfile
    Created on : 21-Dec-2019, 05:09:41
    Author     : PSST
--%>
<%@include  file="SessionValidator.jsp" %>
<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Profile</title>
    <h1 align="center"><b>EDIT PROFILE</b></h1>
    <br><br>
    </head>
    <body align="center">
        <div id="tab" align="center">
         <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btn_save")!= null)
            {
                String upQry="update tbl_company set company_name='"+request.getParameter("txt_cname")+"', company_address='"+request.getParameter("txt_address")+"',company_contact='"+request.getParameter("txt_contact")+"',company_email='"+request.getParameter("txt_email")+"' where company_id='"+session.getAttribute("cid")+"'";
                if(con.executeCommand(upQry))
                {
                    %>
                    <script>
                        alert("data updated");
                        window.location="EditProfile.jsp";
                    </script>
                    <%
                }
                else{
                 %>
                 <script>
                     alert("data updation failed");
                     window.location="EditProfile.jsp";
                 </script>
                 <%
                }
            }
       
            
            
            String sel="select * from tbl_company where company_id='"+session.getAttribute("cid")+"' ";
            ResultSet rs=con.selectCommand(sel);  
            rs.next();
            
            %>
           
        <form method="post"> 
            <table border="2" align="center">
                <tr>
                    <td>
                        Name
                    </td>
                    
                    <td><input type="text" required="required" name="txt_cname" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" value="<%=rs.getString("company_name")%>"</td>
                    
                    
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td><input name="txt_address" required="required" value="<%=rs.getString("company_address")%>"</td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    
                    <td><input type="text" required="required" name="txt_contact" title="Phone Number with 7-9 and remaining 9 digit with 0-9" pattern="[7-9]{1}[0-9]{9}" value="<%=rs.getString("company_contact")%>"</td>
                    
                </tr><tr>
                    <td>
                        Email
                    </td>
                    
                    <td><input type="text" required="required" name="txt_email" value="<%=rs.getString("company_email")%>"</td>
                    
                </tr>
                
                
                <tr>
                    <td colspan="2">
                        <input type="submit" name="btn_save" value="Save">
                        <input type="reset" name="btn_cancel" value="Cancel">
                    </td>
                </tr>
            </table>
        </form>
                            </div>

     </body>
</html>

<%@include file="Foot.jsp" %>