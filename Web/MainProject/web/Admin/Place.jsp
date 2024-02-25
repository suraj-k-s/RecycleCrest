<%-- 
    Document   : place
    Created on : 13-Dec-2019, 05:00:55
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
        <title>Place</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
        <%@include file="Head.jsp" %>
    <%
            if(request.getParameter("btn_submit")!=null)
            {
                String insQry="insert into tbl_place(place_name,district_id)values('" +request.getParameter("txt_place")+"','"+request.getParameter("dropdown")+"')";
                if(con.executeCommand(insQry))
                {
                    %>
                    <script>
                        alert("data inserted");
                        window.location="Place.jsp";
                    </script>
                    <%
                }
                else{
                    
                %>
                <script>
                    alert("data insertion failed");
                    window.location="Place.jsp";
                </script>
                    <%
                            
                }
            }
            if(request.getParameter("pid")!=null)
            {
                String delQry="delete from tbl_place where place_id='"+request.getParameter("pid")+"'";
                if(con.executeCommand(delQry))
                {
                      %>
                      <script>
                          alert("data deleted");
                          window.location="Place.jsp";
                      </script>
                      <%
                    
                }
                else{
                    %>
                    <script>
                          alert("data not deleted");
                          window.location="Place.jsp";
                      </script>
                    <%
                }
            }
                    
                    %>
    
    </body>
    <h1 align="center"><b>ADD PLACE</b></h1>
     <br><br>
        <form method="post">
            <table border='2' align="center">
               
            <tr>
                <td>District</td>
                        <td><select name="dropdown" required="required">
                                <option>Select</option>
                                <%
            String selQry1="select * from tbl_district";
            
            ResultSet rs1=con.selectCommand(selQry1);
            while(rs1.next())
            {
                %>
                <option value="<%=rs1.getString("district_id")%>"><%=rs1.getString("district_name")%> </option>
                <% 
            }
                %>
                            </select>
                        </td>
            </tr> 
            <tr>
                <td>Place</td>
                <td><input type="text" name="txt_place" placeholder="Enter place" required="required" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"></td>
            </tr>
            <tr>
                <td colspan='2' align='center'>
                <input type="submit" name="btn_submit" value="Save">
                <input type="submit" name="btn_cancel" value="Cancel"></td>
            </tr>
        </table>
                             <br><br>
           <table border="2" align="center">
            <tr>
                <td>
                    Sl.no
                </td>
                <td>
                    District
                </td>
                <td>
                    Place
                </td>
                <td>
                    Action
                </td>
            </tr> 
            <tr>
                <%
            int i=0;
            String selQry="select * from tbl_place p inner join tbl_district d on d.district_id=p.district_id";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
                %>
                <td><%=i%></td>
                <td><%=rs.getString("district_name")%></td>
                <td><%=rs.getString("place_name")%></td>
                <td><a href="Place.jsp?pid=<%=rs.getString("place_id")%>">Delete</a></td>
            </tr>
                <%  
                        }
                %>
           </table>
            </div>
    </body>
</html>
<%@include file="Foot.jsp" %>
