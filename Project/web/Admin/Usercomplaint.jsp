<%-- 
    Document   : Usercomplaint
    Created on : 18-Feb-2023, 05:50:33
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
        <title>User Complaint</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
         <%@include file="Head.jsp" %>
        <h1 align="center"><b>USER COMPLAINTS</b></h1>
        <br><br>
        <table border="2" align="center">
                <tr>
                    <td>
                        Sl.no
                    </td>
                    <td>
                        Type
                    </td>
                    <td>
                        Complaint
                    </td>
                    <td>
                        Date
                    </td>
                    <td>
                        User
                    </td>
                     <td>
                       Reply
                    </td>
                   <td>
                      Action  
                    </td>
                    </tr>
                <tr>
                            <%
                            int i=0;
                            String sel1="select * from tbl_complaint c inner join tbl_user u on u.user_id=c.user_id";
                            
                            //System.out.print(sel1);
                            ResultSet rs=con.selectCommand(sel1);
                            while(rs.next())
                            {
                                i++;
                                %>
                                <td><%=i%></td>
                                <td><%=rs.getString("complainttype_id")%></td>
                                <td><%=rs.getString("complaint_description")%></td>
                                <td><%=rs.getString("complaint_date")%></td>
                                <td><%=rs.getString("user_name")%></td>
                                <td><%=rs.getString("complaint_reply")%></td>
                                <td><a href="Reply.jsp?cid=<%=rs.getString("complaint_id")%>">REPLY</a>
                                     </tr>
                                <%
                            }
                            %>
                             </div>
                   </body>
                   
</table>
                   
    </body>
</html>
<%@include file="Foot.jsp" %>