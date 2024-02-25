<%-- 
    Document   : Location
    Created on : 16-Dec-2019, 01:00:34
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
        <title>Location</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
        <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btn_save")!= null)
            {
                String insQry="insert into tbl_location(location_name,place_id)values('"+request.getParameter("txt_location")+"','"+request.getParameter("dropdown1")+"')";
                if(con.executeCommand(insQry))
                {
                    %>
                    <script>
                      alert("data inserted");  
                      window.location="Location.jsp";
                     </script>
                                      
                    <%
                }
                else
                {
                   %>
                   <script>
                       alert("data insertion failed");
                       window.location="Location.jsp";
                   </script>
                   <%
                }
            }
            if(request.getParameter("lid")!= null)
            {
                String delQry="delete from tbl_location where location_id='"+request.getParameter("lid")+"'";
                if(con.executeCommand(delQry))
                {
                    %>
                    <script>
                        alert("data deleted");
                        window.location="Location.jsp";
                    </script>
                    <%
                }
                else{
                 %>
                 <script>
                     alert("data deletion failed");
                     window.location="Location.jsp";
                 </script>
                 <%
                }
            }
            %>
    </body>
    <h1 align="center"><b>ADD LOCATION</b></h1>
     <br><br>
    <form method="post">
        <table border="2" align="center">
            <tr>
                <td>
                    District
                </td>
                <td><select name="dropdown" required="required" onchange="getPlace(this.value)">
                        <option>Select</option>
                        <%
            String sel="select * from tbl_district";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                %>
                <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                <%
            }
            
           
            %>
            
                    </select></td>
            </tr>
            <tr>
                <td>
                    Place
                </td>
                <td><select name="dropdown1" required="required" id="sel_place">
                        <option>Select</option>
                    </select></td>
                
            </tr>
            <tr>
                <td>
                    Location
                </td>
                <td><input type="text" name="txt_location" required="required" placeholder="Enter locaton" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
            </tr>
            <tr>
                <td colspan='2' align="center">
                    <input type="submit" name="btn_save" value="Save">
                    <input type="submit" name="btn_cancel" value="Cancel"</td>
            </tr>
        </table>
             <br><br>
    </form>
                    <table border="1" align="center">
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
                                Location
                            </td>
                            <td>
                                Action
                            </td>
                        </tr> 
                        <tr>
                            <%
                            int i=0;
                            String sel1="select * from tbl_location l inner join tbl_place p on p.place_id=l.place_id inner join tbl_district d on d.district_id=p.district_id";
                            //out.print(sel1);
                            ResultSet rs3=con.selectCommand(sel1);
                            while(rs3.next())
                            {
                                i++;
                                %>
                                <td><%=i%></td>
                                <td><%=rs3.getString("district_name")%></td>
                                <td><%=rs3.getString("place_name")%></td>
                                <td><%=rs3.getString("location_name")%></td>
                                <td><a href="Location.jsp?lid=<%=rs3.getString("location_id")%>">DELETE</a></td>
                        </tr>
                                <%
                            }
                            %>
                            
                        
                    </table>
    
</html>
<script src="../Assets/JQuery/jQuery.js"></script>
   
                        <script>
                            function getPlace(did)
                            {
                                $.ajax({url:"../Assets/AjaxPages/Ajaxplace.jsp?did=" + did,
                                success: function(result){
                                    $("#sel_place").html(result);
                                }
                            })
                            }
                           
                        </script>
                        <%@include file="Foot.jsp" %>