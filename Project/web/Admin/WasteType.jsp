<%-- 
    Document   : ChangePassword
    Created on : 04-Feb-2023, 06:07:32
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
        <title>Waste Type</title>
    </head>
    <body align="center">
         <%@include file="Head.jsp" %>
         <div id="tab" align="center">
        <h1 align="center"><b>WASTE TYPE</b></h1>
        <br><br>
        
         <%
            if(request.getParameter("btn_save")!=null)
            {
                String insQry="insert into tbl_wastetype(wastetype_name)values('" +request.getParameter("txt_wastetype")+"')";
                if(con.executeCommand(insQry))
                {
                    %>
                    <script>
                      alert("data inserted");
                      window.location="WasteType.jsp"
                    </script>
                    <%
                }
                else{
                    %>
                    <script>
                      alert("data not inserted");
                      window.location="WasteType.jsp"
                    </script>
                    <%
               }
            }
            if(request.getParameter("wid")!=null)
                {
                    String delQry="delete from tbl_wastetype where wastetype_id='"+ request.getParameter("wid") +"'";
                    if(con.executeCommand(delQry))
                    {
                        %>
                        <script>
                            alert("data deleted");
                            window.location("WasteType.jsp")
                        </script>
                        <%
                    }
                    else{
                        %>
                        <script>
                            alert("data deleted");
                            window.location("WasteType.jsp")
                        </script>
                        <%
                    }
                }
                        
            %>
        <form method="post">
        <table border='2' align="center">
        <tr>
            <td>Waste Type</td>
            <td><input type="text" name="txt_wastetype" required="required" placeholder="Enter waste type" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"></td>
        </tr>
        
        <tr>
            <td colspan="2" align="center">
                <input type="submit" name="btn_save" value="Save">
                <input type="submit" name="btn_cancel" value="Cancel">
            </td>
        </tr>
        </table>
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
            String selQry="select * from tbl_wastetype";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
                %>
                <td><%=i%></td>
                <td><%=rs.getString("wastetype_name")%></td>
                
                <td><a href="WasteType.jsp?wid=<%=rs.getString("wastetype_id")%>">Delete</a></td>
                </tr>
                <%
            }
                
            %>
            </table>
    </form>
             </div>
    </body>
    
</html>
<%@include file="Foot.jsp" %>