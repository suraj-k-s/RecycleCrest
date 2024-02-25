<%-- 
    Document   : Usercomplaint.jsp
    Created on : 20-Dec-2019, 23:48:03
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
        <title>User Complaint</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
        <%@include file="Head.jsp" %>
        <%
           
            if(request.getParameter("btn_save")!= null)
            {
                
             String insQry="insert into tbl_complaint(complainttype_id,complaint_description,complaint_date,user_id)values('"+request.getParameter("dropdown")+"','"+request.getParameter("txt_description")+"',curdate(),'"+session.getAttribute("uid")+"')";
             out.print(insQry);
             if(con.executeCommand(insQry))
             {
              %>
              <script>
                  alert("data inserted");
                  window.location="Usercomplaint.jsp";
              </script>
              <%
             }
             else{
                 %>
                 <script>
                     alert("data insertion failed");
                     window.location="Usercomplaint.jsp";
                 </script>
                 <%
             }
            }
                 if(request.getParameter("cid")!= null)
            {
                String delQry="delete from tbl_complaint where complaint_id='"+request.getParameter("cid")+"'";
                if(con.executeCommand(delQry))
                {
                    %>
                    <script>
                        alert("data deleted");
                        window.location="Usercomplaint.jsp";
                    </script>
                    <%
                }
                else{
                 %>
                 <script>
                     alert("data deletion failed");
                     window.location="Usercomplaint.jsp";
                 </script>
                 <%
                }
            } 
            %>
    </body>
    <h1 align="center"><b>ADD COMPLAINT</b></h1>
            <br><br>
    <form method="post">
    <table border="2" align="center">
        <tr>
            <td>
                Type
            </td>
            <td>
                 <select name="dropdown" required="required"  >
                        <option>Select</option>
                        <%
            String sel="select * from tbl_complainttype";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                %>
                <option value="<%=rs.getString("complainttype_id")%>"><%=rs.getString("complainttype_name")%></option>
                <%
            }
            
           
            %>
               
                       </select>
 </td>
        </tr>
         <tr>
                <td>
                   Description
                </td>
                <td><textarea  name="txt_description" placeholder="Enter discription" required="required"></textarea></td>
            </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" name="btn_save" value="Save">
                <input type="submit" name="btn_cancel" value="Cancel">
            </td>
        </tr>
    </table>
    </form>
            <br><br>
    <table border="2" align="center">
        <tr>
            <td>
                Sl.no
            </td>
            <td>
                Type
            </td>
             <td>
                Description
            </td>
            <td>
                Date
            </td>
        <td>
            Reply
        </td>
        <td>
           Action
        </td>
        </tr>
        <tr>
                <%
            int i=0;
            String selQry="select * from tbl_complaint where user_id='"+session.getAttribute("uid")+"'";
            ResultSet rs1=con.selectCommand(selQry);
            while(rs1.next())
            {
                i++;
                %>
                <td><%=i%></td>
                <td><%=rs1.getString("complainttype_id")%></td>
                <td><%=rs1.getString("complaint_description")%></td>
                <td><%=rs1.getString("complaint_date")%></td>
                <td><%=rs1.getString("complaint_reply")%></td>
                <td><a href="Usercomplaint.jsp?cid=<%=rs1.getString("complaint_id")%>">Delete</a></td>

                </tr>
                <%
            }
                
            %>
            
                
            </td>
        </tr>
                

    </table>
                 </div>
          

</html>
<%@include file="Foot.jsp" %>