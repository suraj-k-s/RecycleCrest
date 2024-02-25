<%-- 
    Document   : Feedback.jsp
    Created on : 18-Feb-2023, 06:53:13
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
        <title> User feedback</title>
    </head>
    <body align="center">
      <div id="tab" align="center">  
             
           
            <%@include file="Head.jsp" %>
            <%
            if(request.getParameter("btn_save")!= null)
            {
                
             String insQry="insert into tbl_feedback(feedback_description,feedback_date,user_id)values('"+request.getParameter("txt_feedback")+"',curdate(),'"+session.getAttribute("uid")+"')";
             out.print(insQry);
             if(con.executeCommand(insQry))
             {
              %>
              <script>
                  alert("data inserted");
                  window.location="Feedback.jsp";
              </script>
              <%
             }
             else{
                 %>
                 <script>
                     alert("data insertion failed");
                     window.location="Feedback.jsp";
                 </script>
                 <%
             }
            }
             if(request.getParameter("fid")!= null)
            {
                String delQry="delete from tbl_feedback where feedback_id='"+request.getParameter("fid")+"'";
                if(con.executeCommand(delQry))
                {
                    %>
                    <script>
                        alert("data deleted");
                        window.location="Feedback.jsp";
                    </script>
                    <%
                }
                else{
                 %>
                 <script>
                     alert("data deletion failed");
                     window.location="Feedback.jsp";
                 </script>
                 <%
                }
            }
            %>  
                
           <h1 align="center"><b>ADD FEEDBACK</b></h1>
            <br><br>   
          
         <form method="post" align="center">
    <table border="2" align="center">
        <tr>
            <td>
               Feedback
            </td>
            <td><textarea  name="txt_feedback" required="required" placeholder="Enter reply"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" name="btn_save" value="Save">
                <input type="submit" name="btn_cancel" value="Cancel">
            </td>
        </tr>
    </table>
             <br><br>
       </form>
         <table border="2" align="center">
             
             <tr>
            <td>
                Sl.no
            </td>
            <td>
                Feedback
            </td>
             
            <td>
                Date
            </td>
        <td>
            Action
        </td>
        </tr>
        <tr>
                <%
            int i=0;
            String selQry="select * from tbl_feedback where user_id='"+session.getAttribute("uid")+"'";
            ResultSet rs1=con.selectCommand(selQry);
            while(rs1.next())
            {
                i++;
                %>
                <td><%=i%></td>
                
                <td><%=rs1.getString("feedback_description")%></td>
                <td><%=rs1.getString("feedback_date")%></td>
                <td><a href="Feedback.jsp?fid=<%=rs1.getString("feedback_id")%>">Delete</a></td>
                 </tr>
                <%
            }
                
            %>
            
                
            
       
    </table>
                    </div>

    </body>
</html>
<%@include file="Foot.jsp" %>
    
