<%-- 
    Document   : MyProfile
    Created on : 21-Dec-2019, 04:26:18
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
        <title>My Profile</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
        <%@include file="Head.jsp" %>
        <%
      
            String sel="select * from tbl_user where user_id='"+session.getAttribute("uid")+"' ";
            ResultSet rs=con.selectCommand(sel);  
            rs.next();
       
            %>
        <h1 align="center"><b>MY PROFILE</b></h1>
            <br><br>
        <form method="post">
            <table border="2" align="center">
                <tr>
                    <td colspan='2' align="center">
                        <img src="../Assets/Files/UserPhoto/<%=rs.getString("user_photo")%>" width="120" height="120"/>
                    </td>
                </tr>
                <tr>
                    <td>  
                        Name:
                    </td>
                    <td>
                        <%=rs.getString("user_name")%>
                    </td>
                </tr>
                
                <tr>
                    <td> 
                        Address
                    </td>
                    <td>
                        <%=rs.getString("user_address")%>
                    </td>
                </tr>
                <tr>
                    <td>
                        Contact:
                    </td>
                    <td>
                        <%=rs.getString("user_contact")%>
                    </td>
                </tr>
                <tr>
                    <td>
                      Email 
                      
                    </td>
                    <td>
                        <%=rs.getString("user_email")%>
                    </td>
                </tr>
            </table>
            
        </form>
                            </div>

    </body>
</html>
<%@include file="Foot.jsp" %>