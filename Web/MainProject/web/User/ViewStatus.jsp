<%-- 
    Document   : ViewStatus
    Created on : 02-Mar-2023, 07:15:32
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
        <title>View status</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
        <%@include file="Head.jsp" %>
        <h1 align="center"><b>STATUS UPDATES</b></h1>
        <br><br>
        <table border="2" align="center">
                <tr>
                    <td>
                        Sl.no
                    </td>
                    <td>
                        Driver Name
                    </td>
                     <td>
                        Date
                    </td>
                     <td>
                       Category
                    </td>
                    <td>
                       Sub category
                    </td>
                    <td>
                       Details
                    </td>
                     <td>
                       Vehicle Number
                    </td>
                     <td>
                       Amount
                    </td>
                      <td>
                      Work Status
                    </td>
                     <td>
                      Pay Status
                    </td>
                      <tr>
                            <%
                            int i=0;
                            String sel1="select * from tbl_request r inner join tbl_user u on u.user_id=r.user_id inner join tbl_ewasterate e on e.ewasterate_id=r.ewasterate_id inner join tbl_subcategory s on s.subcategory_id=e.subcategory_id inner join tbl_category c on c.category_id=s.category_id inner join tbl_assign a on a.request_id=r.request_id inner join tbl_driver dr on dr.driver_id=a.driver_id inner join tbl_vechile v on v.vechile_id=a.vechile_id where r.user_id='"+session.getAttribute("uid")+"'";
                            
                            System.out.print(sel1);
                            ResultSet rs=con.selectCommand(sel1);
                            while(rs.next())
                            {
                                i++;
                                %>
                                <td><%=i%></td>
                                <td><%=rs.getString("driver_name")%></td>
                                <td><%=rs.getString("request_fordate")%></td>
                                <td><%=rs.getString("category_name")%></td>
                                <td><%=rs.getString("subcat_name")%></td>
                                <td><%=rs.getString("request_details")%></td>
                                <td><%=rs.getString("vechile_number")%></td>
                                <td><%=rs.getString("ewaste_rate")%></td>

                                <td><%
                                 if(rs.getString("request_status").equals("0") && rs.getString("assigned_status").equals("0") )
                                {
                                    out.print("Request verification pending");
                                }
                                else  if(rs.getString("request_status").equals("1") && rs.getString("assigned_status").equals("0") )
                                {
                                    out.print("Work not assigned");
                                }
                                else if(rs.getString("request_status").equals("1") && rs.getString("assigned_status").equals("1") )
                                {
                                    out.print("Work not completed");
                                }
                                else if(rs.getString("request_status").equals("3") && rs.getString("assigned_status").equals("0") )
                                {
                                    out.print("Work  completed");
                                }
                                else
                                {
                                     out.print("Work  request rejected");
                                }
                                %></td>
                                <td>
                                    <%
                                 if(rs.getString("request_status").equals("3") && rs.getString("assigned_status").equals("0") &&   rs.getString("payment_status").equals("1") )
                                {
                                     out.print("Paid");
                                }
                                  else  if(rs.getString("request_status").equals("3") && rs.getString("assigned_status").equals("0") &&   rs.getString("payment_status").equals("0") )
                                {
                                    %>
                                    <a href="Payment.jsp?pid=<%=rs.getString("request_id")%>">Pay Now</a>
                                     <%
                                }
                                 else
                                  {
                                       out.print("Not Paid");
                                  }
                                    
                                    %>
                                   </td>
                             
                                
                        </tr>
                                <%
                            }
                            %>
                   </body>
</table>
                           </div>

    </body>
    
</html>
<%@include file="Foot.jsp" %>