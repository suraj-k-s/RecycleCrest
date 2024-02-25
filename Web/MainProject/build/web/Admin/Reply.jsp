<%-- 
    Document   : Reply
    Created on : 18-Feb-2023, 06:13:16
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
        <title>Complaint Reply</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
      <%@include file="Head.jsp" %>   
        <%
           if(request.getParameter("btn_save")!=null)
           {
                String upQry="update tbl_complaint set complaint_status='1',complaint_reply='"+request.getParameter("txt_reply")+"' where complaint_id='"+request.getParameter("cid")+"'";
                if(con.executeCommand(upQry))
                {
                %>
                    <script>
                        alert("data updated");
                        window.location="Reply.jsp";
                    </script>
                    <%
           }
           else{
                 %>
                 <script>
                     alert("data updation failed");
                     window.location="Reply.jsp";
                 </script>
                 <%
                }
           }
           %>
           <h1 align="center"><b>ADD REPLY</b></h1>
           <br><br>
       <form method="post">
    <table border="2" align="center">
        <tr>
            <td>
               Reply
            </td>
            <td><textarea  name="txt_reply" required="required" placeholder="Enter reply"></textarea></td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <input type="submit" name="btn_save" value="Save">
                <input type="submit" name="btn_cancel" value="Cancel">
            </td>
        </tr>
    </table>
       </form>
            </div>
    </body>
</html>
<%@include file="Foot.jsp" %>