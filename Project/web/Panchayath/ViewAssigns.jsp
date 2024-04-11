<%-- 
    Document   : ViewAssigns
    Created on : 02-Mar-2023, 05:54:55
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
        <title>View Assigns</title>
    </head>
    
    <body align="center">
        <div id="tab" align="center">
         <%@include file="Head.jsp" %>
        <h1 align="center"><b>VIEW ASSIGNS</b></h1>
        <br><br>
       <table border="2" align="center">
                <tr>
                    <td>
                        Sl.no
                    </td>
                    <td>
                        User Name
                    </td>
                    <td>
                        User Address
                    </td>
                    <td>
                        District
                    </td>
                    <td>
                        Place
                    </td>
                    <td>
                        Date
                    </td>
                    <td>
                       Subcategory
                    </td>
                    <td>
                       Details
                    </td>
                    <td>
                       Driver name
                    </td>
                     <td>
                      Vehicle Name
                    </td>
                     <tr>
                            <%
                            int i=0;
                            String sel1="select * from tbl_request r inner join tbl_user u on u.user_id=r.user_id inner join tbl_place p on p.place_id=u.place_id inner join tbl_district d on d.district_id=p.district_id inner join tbl_ewasterate e on e.ewasterate_id=r.ewasterate_id inner join tbl_subcategory s on s.subcategory_id=e.subcategory_id  inner join tbl_category c on c.category_id=s.category_id inner join tbl_assign a on a.request_id=r.request_id inner join tbl_driver dr on dr.driver_id=a.driver_id inner join tbl_vechile v on v.vechile_id=a.vechile_id where a.assigned_status='1' and r.panchayath_id='"+session.getAttribute("pid")+"'";
                            
                            System.out.print(sel1);
                            ResultSet rs=con.selectCommand(sel1);
                            while(rs.next())
                            {
                                i++;
                                %>
                                <td><%=i%></td>
                                <td><%=rs.getString("user_name")%></td>
                                <td><%=rs.getString("user_address")%></td>
                                <td><%=rs.getString("district_name")%></td>
                                <td><%=rs.getString("place_name")%></td>
                                <td><%=rs.getString("request_fordate")%></td>
                                <td><%=rs.getString("subcat_name")%></td>
                                <td><%=rs.getString("request_details")%></td>
                                <td><%=rs.getString("driver_name")%></td>
                                <td><%=rs.getString("vechile_name")%></td>
                               
                               
                             
                                
                        </tr>
                                <%
                            }
                            %>
                                    </div>

                   </body>
</table>
                   
                
</html>

                    
   <%@include file="Foot.jsp" %>