<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>

<%
   if(!request.getParameter("did").equals(1))
   {
       %>
       <table border="2">
                            <tr>
                                <th colspan="2">Companies</th>
                            </tr>
                            <tr>
                   

                <%
                    String sel = "select * from tbl_company where company_vstatus='1'";
                    out.print(sel);
                    ResultSet rs = con.selectCommand(sel);
                    while (rs.next()) {
                %>
                <td><img src="../Assets/Files/CompanyPhoto/<%=rs.getString("company_logo")%>" height="150" width="150"> <br>
                Name:<%=rs.getString("company_name")%><br>
                Address:<%=rs.getString("company_address")%><br>
                Contact:<%=rs.getString("company_contact")%><br>
                Email:<%=rs.getString("company_email")%><br>
                
                <%
                    }
                %>
                </tr>
            </table>
       <%
   }
    if(request.getParameter("did")=="2")
        {
            %>
             <table border="1">
                      <tr>
                                <th colspan="2">Panchayath</th>
                            </tr>       
                            <tr>

                <%
                    String sel2 = "select * from tbl_panchayath p INNER JOIN tbl_location l on l.place_id=p.place_id INNER JOIN tbl_user u on u.location_id=l.location_id where u.user_id='"+session.getAttribute("uid") +"'";
                    out.print(sel2);
                    ResultSet rs2 = con.selectCommand(sel2);
                    while (rs2.next()) {
                %>
                <td><img src="../Assets/Files/PanchayathPhoto/<%=rs2.getString("panchayath_photo")%>" height="150" width="150"> <br>
                Name:<%=rs2.getString("panchayath_name")%><br>
                Address:<%=rs2.getString("panchayath_address")%><br>
                Contact:<%=rs2.getString("panchayath_contact")%><br>
                Email:<%=rs2.getString("panchayath_email")%><br>
                
                <%
                    }
                %>
                </tr>
            </table>
            
            <%
        }
%>