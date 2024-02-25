<%-- 
    Document   : AjaxShopSearch
    Created on : 11 Mar, 2022, 10:43:06 AM
    Author     : asanj
--%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
    <head>
 
    </head>
    <body>
        
<%
    String did="", pid="";
    did=request.getParameter("did");
    pid=request.getParameter("pid");
   // wid=request.getParameter("wid");
    
    String sel="select * from tbl_company c inner join tbl_place pl on pl.place_id=c.place_id inner join tbl_district d on d.district_id=pl.district_id where company_vstatus='1'";
    if(did!="")
    {
        sel+=" and d.district_id='"+did+"' ";
    }
    if(pid!="")
    {
        sel+=" and pl.place_id='"+pid+"' ";
    }
    
    %>
<table align="center">
    <tr>
<%
    ResultSet rs=con.selectCommand(sel);
    System.out.println(sel);
    int i=0;
    while(rs.next())
    {
        i++;
      %>
      <td >
                <img src="../Assets/Files/CompanyPhoto/<%=rs.getString("company_logo")%>" height="150" width="150"> <br>
                Name:<%=rs.getString("company_name")%><br>
                Address:<%=rs.getString("company_address")%><br>
                Contact:<%=rs.getString("company_contact")%><br>
                Email:<%=rs.getString("company_email")%><br>
                 District:<%=rs.getString("district_name")%><br>
                Place:<%=rs.getString("place_name")%><br>
                <a href="CompanyWastereq.jsp?cid=<%=rs.getString("company_id")%>">REQUEST</a>
           </td>
     <% 
            if(i%4==0)
            {
                out.println("</tr>");
                                
                out.println("<tr>");
                 i=0;
            }
    }
%>
</table>
    </body>
</html>