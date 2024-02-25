<%-- 
    Document   : ViewCompany
    Created on : 26-Jan-2023, 10:10:47
    Author     : PSST
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Feedbacks</title>
    </head>
    
    <br><br>
    <body align="center">
        <div id="tab" align="center">
       <%@include file="Head.jsp" %> 
       <h1 align="center"><b>USER FEEDBACKS</b></h1>
       <br><br>
    <table border="2" align="center">
                <tr>
                    <td>
                        Sl.no
                    </td>
                    <td>
                        Feedback id
                    </td>
                    <td>
                        Feedback 
                    </td>
                    <td>
                        Feedback date
                    </td>
                    <td>
                       User
                    </td>
                    
                    
                </tr>
                <tr>
                            <%
                            int i=0;
                            String selQry="select * from tbl_feedback f inner join tbl_user u on f.user_id=u.user_id";
                            
                            //System.out.print(sel1);
                            ResultSet rs=con.selectCommand(selQry);
                            while(rs.next())
                            {
                                i++;
                                %>
                                <td><%=i%></td>
                                <td><%=rs.getString("feedback_id")%></td>
                                <td><%=rs.getString("feedback_description")%></td>
                                <td><%=rs.getString("feedback_date")%></td>
                                
                                <td><%=rs.getString("user_name")%></td>
                                
                               
                                
                                
                        </tr>
                                <%
                            }
                            %>
                             </div>
                   </body>
</table>
                   
                
</html>
<%@include file="Foot.jsp" %>