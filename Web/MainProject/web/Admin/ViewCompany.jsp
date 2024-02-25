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
        <title>View companies</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
         <%@include file="Head.jsp" %>
        <%
           if(request.getParameter("cid")!=null)
           {
                String upQry="update tbl_company set company_vstatus='1' where company_id='"+request.getParameter("cid")+"'";
                con.executeCommand(upQry);
                
           }
           if(request.getParameter("rid")!=null)
           {
                String upQry2="update tbl_company set company_vstatus='2' where company_id='"+request.getParameter("rid")+"'";
                con.executeCommand(upQry2);
                
           }
        %>
        <h1 align="center"><b>REGISTERED COMPANIES</b></h1>
        <br><br>
    <table border="2" align="center">
                <tr>
                    <td>
                        Sl.no
                    </td>
                    <td>
                        Name
                    </td>
                    <td>
                        Address
                    </td>
                    <td>
                        Contact
                    </td>
                    <td>
                        Email
                    </td>
                    <td>
                        Logo
                    </td>
                    <td>
                        Photo
                    </td>
                    <td>
                        District
                    </td>
                    <td>
                        Place
                    </td>
                    
                    <td>
                        Doj
                    </td>
                    <td>
                        Action
                    </td>
                </tr>
                <tr>
                            <%
                            int i=0;
                            String sel1="select * from tbl_company c inner join tbl_place p on p.place_id=c.place_id inner join tbl_district d on d.district_id=p.district_id where company_vstatus='0'";
                            
                            //System.out.print(sel1);
                            ResultSet rs=con.selectCommand(sel1);
                            while(rs.next())
                            {
                                i++;
                                %>
                                <td><%=i%></td>
                                <td><%=rs.getString("company_name")%></td>
                                <td><%=rs.getString("company_address")%></td>
                                <td><%=rs.getString("company_contact")%></td>
                                <td><%=rs.getString("company_email")%></td>
                                <td><img src="../Assets/Files/CompanyPhoto/<%=rs.getString("company_logo")%>" height="150" width="150"> </td>
                                <td><img src="../Assets/Files/CompanyProof/<%=rs.getString("company_proof")%>" height="150" width="150"> </td>
                                <td><%=rs.getString("district_name")%></td>
                                <td><%=rs.getString("place_name")%></td>
                              
                                <td><%=rs.getString("company_doj")%></td>
                                <td><a href="ViewCompany.jsp?cid=<%=rs.getString("company_id")%>">APPROVE</a>
                                <a href="ViewCompany.jsp?rid=<%=rs.getString("company_id")%>">  REJECT</a></td>
                                
                        </tr>
                                <%
                            }
                            %>
                             </div>
                   </body>
                    
</table>
                   
                
</html>
<%@include file="Foot.jsp" %>