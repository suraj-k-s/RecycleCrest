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
    
    String sel="select * from tbl_panchayath p inner join tbl_place pl on pl.place_id=p.place_id inner join tbl_district d on d.district_id=pl.district_id";
    if(did!="")
    {
        sel+=" and d.district_id='"+did+"' ";
    }
    if(pid!="")
    {
        sel+=" and p.place_id='"+pid+"' ";
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
                <img src="../Assets/Files/PanchayathPhoto/<%=rs.getString("panchayath_photo")%>" height="150" width="150"> <br>
                Name:<%=rs.getString("panchayath_name")%><br>
                Address:<%=rs.getString("panchayath_address")%><br>
                Contact:<%=rs.getString("panchayath_contact")%><br>
                Email:<%=rs.getString("panchayath_email")%><br>
                 District:<%=rs.getString("district_name")%><br>
                Place:<%=rs.getString("place_name")%><br>
               <a href="PanchayathWastereq.jsp?pid=<%=rs.getString("panchayath_id")%>">REQUEST</a>
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