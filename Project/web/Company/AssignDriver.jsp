<%-- 
    Document   : AssignDriver
    Created on : 02-Mar-2023, 04:38:59
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
        <title>Assign Driver</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
         <%@include file="Head.jsp" %>
        <%
            
             if(request.getParameter("btn_save")!= null)
            {
               
               String insQry="insert into tbl_assign(request_id,driver_id,vechile_id,assigned_status,company_id)values('"+request.getParameter("rid")+"','"+request.getParameter("dropdown1")+"','"+request.getParameter("dropdown")+"','1','"+session.getAttribute("cid")+"')";
//               out.print(insQry);
               if(con.executeCommand(insQry))
                {
                    %>
                    <script>
                      alert("data inserted");  
                        window.location="AssignDriver.jsp";
                     </script>
                                      
                    <%
                }
                else
                {
                   %>
                   <script>
                       alert("data insertion failed");
                       window.location="AssignDriver.jsp";
                   </script>
                   <%
                }
            }
            %>
            <h1 align="center"><b>ASSIGN DRIVER</b></h1>
            <br><br>
     <form method="post">
        <table border="2" align="center">
            <tr>
                <td>
                    Vehicle
                </td>
                <td><select name="dropdown" required=required"">
                        <option>Select</option>
                        <%
            String sel="select * from tbl_vechile where company_id='"+session.getAttribute("cid")+"'";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                %>
                <option value="<%=rs.getString("vechile_id")%>"><%=rs.getString("vechile_name")%></option>
                <%
            }
            
           
            %>
            
                    </select></td>
            </tr>
            <tr>
                <td>
                    Driver
                </td>
                <td><select name="dropdown1" required=required">
                        <option>Select</option>
                        <%
            String sel1="select * from tbl_driver where company_id='"+session.getAttribute("cid")+"'";
            ResultSet rs1=con.selectCommand(sel1);
            while(rs1.next())
            {
                %>
                <option value="<%=rs1.getString("driver_id")%>"><%=rs1.getString("driver_name")%></option>
                <%
            }
            
           
            %>
                    </select></td>
                
            </tr>
            <tr>
                <td colspan='2' align="center">
                    <input type="submit" name="btn_save" value="Save">
                    <input type="submit" name="btn_cancel" value="Cancel"</td>
            </tr>
        </table>
    </form
            </div>

    </body>
</html>
<%@include file="Foot.jsp" %>