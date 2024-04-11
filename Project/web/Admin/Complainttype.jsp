<%-- 
    Document   : Complainttype.jsp
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
        <title>Complaint type</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
        <%@include file="Head.jsp" %>
        <%
            String cdid="",cname="";
            if(request.getParameter("btn_save")!= null)
            {
                if(request.getParameter("txt_hid").equals(""))
                {
             String insQry="insert into tbl_complainttype(complainttype_name)values('"+request.getParameter("txt_type")+"')";
             //out.print(insQry);
             if(con.executeCommand(insQry))
             {
              %>
              <script>
                  alert("data inserted");
                  window.location="Complainttype.jsp";
              </script>
              <%
             }
             else{
                 %>
                 <script>
                     alert("data insertion failed");
                     window.location="Complainttype.jsp";
                 </script>
                 <%
             }
            }
                else{
                    String upQry="update tbl_complainttype set complainttype_name='"+request.getParameter("txt_type")+"'where complainttype_id='"+request.getParameter("txt_hid")+"' ";
                    con.executeCommand(upQry);
                    response.sendRedirect("Complainttype.jsp");
                }
            }
            if(request.getParameter("cid")!= null)
            {
                String delQry="delete from tbl_complainttype where complainttype_id='"+request.getParameter("cid")+"'";
                if(con.executeCommand(delQry))
                {
                    %>
                    <script>
                        alert("data deleted");
                        window.location="Complainttype.jsp";
                    </script>
                    <%
                }
                else
                {
                    %>
                    <script>
                        alert("data deletion failed");
                        window.location="Complainttype.jsp";
                    </script>
                    <%
                }
            }
                if(request.getParameter("cpid")!= null)
                {
                    String sel="select * from tbl_complainttype where complainttype_id='"+request.getParameter("cpid")+"'";
                    ResultSet rs=con.selectCommand(sel);
                    rs.next();
                    cdid=rs.getString("complainttype_id");
                    cname=rs.getString("complainttype_name");
                }
            %>
    </body>
    <h1 align="center"><b>COMPLAINT TYPE</b></h1>
     <br><br>
    <form method="post">
    <table border="2" align="center">
        <tr>
            <td>
                Type
            </td>
            <td>
                
                <input type="hidden" name="txt_hid" value="<%=cdid%>">
                <input type="text" name="txt_type" required="required" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" placeholder="Type complaint" value="<%=cname%>">
            </td>
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
            Action
        </td>
        </tr>
        <tr>
            
            <%
            int i=0;
            String selQry="select * from tbl_complainttype";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next()) 
            {
                i++;
                %>
                <td><%=i%></td>
                <td><%=rs.getString("complainttype_name")%></td>
                <td><a href="Complainttype.jsp?cid=<%=rs.getString("complainttype_id")%>">DELETE</a>
                    <a href="Complainttype.jsp?cpid=<%=rs.getString("complainttype_id")%>">EDIT</a></td>
        </tr>
               <%
            }
          %> 
                
    </div>    
            </td>
        </tr>
    </table>
</html>
<%@include file="Foot.jsp" %>