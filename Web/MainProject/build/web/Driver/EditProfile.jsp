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
        
      
    </head>
    <body align="center">
       <div id="tab" align="center">
         <%@include file="Head.jsp" %>
          <h1 align="center"><b>EDIT PROFILE</b></h1>
          <br><br>
        <%
            if(request.getParameter("btn_save")!= null)
            {
                String upQry="update tbl_driver set driver_name='"+request.getParameter("txt_dname")+"', driver_address='"+request.getParameter("txt_address")+"',driver_contact='"+request.getParameter("txt_contact")+"',driver_email='"+request.getParameter("txt_email")+"' where driver_id='"+session.getAttribute("did")+"'";
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
       
            
            
            String sel="select * from tbl_driver where driver_id='"+session.getAttribute("did")+"' ";
            ResultSet rs=con.selectCommand(sel);  
            rs.next();
            
            %>
           
        <form method="post"> 
            <table border="2" align="center">
                <tr>
                    <td>
                        Name
                    </td>
                    
                    <td><input type="text" name="txt_dname" required="required" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" value="<%=rs.getString("driver_name")%>"</td>
                    
                    
                </tr>
                <tr>
                    <td>
                        Address
                    </td>
                    <td><input name="txt_address" required="required" value="<%=rs.getString("driver_address")%>"</td>
                </tr>
                <tr>
                    <td>
                        Contact
                    </td>
                    
                    <td><input type="text" name="txt_contact" required="required" title="Phone Number with 7-9 and remaining 9 digit with 0-9" pattern="[7-9]{1}[0-9]{9}" value="<%=rs.getString("driver_contact")%>"</td>
                    
                </tr><tr>
                    <td>
                        Email
                    </td>
                    
                    <td><input type="text" name="txt_email" required="required" value="<%=rs.getString("driver_email")%>"</td>
                    
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