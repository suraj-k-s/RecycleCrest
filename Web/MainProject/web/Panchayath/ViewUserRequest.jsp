<%-- 
    Document   : ViewCompany
    Created on : 26-Jan-2023, 10:10:47
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
        <title>View requests</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
         <%@include file="Head.jsp" %>

        <%
           if(request.getParameter("rid")!=null)
           {
                String upQry="update tbl_request set request_status='1' where request_id='"+request.getParameter("rid")+"'";
                con.executeCommand(upQry);
                
           }
           if(request.getParameter("rdid")!=null)
           {
                String upQry2="update tbl_request set request_status='2' where request_id='"+request.getParameter("rdid")+"'";
                con.executeCommand(upQry2);
                
           }
        %>
        
        <h1 align="center"><b>ALL REQUESTS</b></h1>
 <br><br>
    <table border="2" align="center">
                <tr>
                    <td>
                       Username
                    </td>
                    <td>
                        Address
                    </td>
                     <td>
                        District
                    </td>
                    <td>
                        Place
                    </td>
                    <td>
                        Details
                    </td>
                     <td>
                        Category
                    </td>
                    <td>
                        Sub category
                    </td>
                     <td>
                       Type
                    </td>
                    <td>
                        Date
                    </td>
                    <td>
                        Action
                    </td>
                    </tr>
                <tr>
                            <%
                            int i=0;
                            String sel1="select * from tbl_request r inner join tbl_user u on u.user_id=r.user_id inner join tbl_place p on p.place_id=u.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_ewasterate e on e.ewasterate_id=r.ewasterate_id inner join tbl_subcategory s on s.subcategory_id=e.subcategory_id inner join tbl_category c on c.category_id=s.category_id where r.request_status='0' and r.panchayath_id='"+session.getAttribute("pid")+"'";
                            
                            System.out.print(sel1);
                            ResultSet rs=con.selectCommand(sel1);
                            while(rs.next())
                            {
                                i++;
                                %>
                                
                                <td><%=rs.getString("user_name")%></td>
                                <td><%=rs.getString("user_address")%></td>
                                <td><%=rs.getString("district_name")%></td>
                                <td><%=rs.getString("place_name")%></td>
                                
                                <td><%=rs.getString("request_details")%></td>
                                <td><%=rs.getString("category_name")%></td>
                                <td><%=rs.getString("subcat_name")%></td>
                                <td><%=rs.getString("ewaste_name")%></td>
                                <td><%=rs.getString("request_fordate")%></td>
                                 <td><a href="ViewUserRequest.jsp?rid=<%=rs.getString("request_id")%>">Accept</a> 
                                 <a href="ViewUserRequest.jsp?rdid=<%=rs.getString("request_id")%>">Reject</a></td>             
                        </tr>
                                <%
                            }
                            %>
                                    </div>

                   </body>
</table>
                   
                
</html>
<%@include file="Foot.jsp" %>