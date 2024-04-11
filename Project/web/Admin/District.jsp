<%--
    Document   : District
    Created on : 30 Dec, 2022, 2:46:30 PM
    Author     : HP
--%>
<%@include  file="SessionValidator.jsp" %>
<%@page  import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>MainProject::District</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
     <%@include file="Head.jsp" %>   
        
        
        
        <%
            String edid="", ename="";
            if (request.getParameter("btn_submit") != null) {
                
                if(request.getParameter("txt_hid").equals(""))
                {
                    
                
                String insQry = "insert into tbl_district(district_name)values('" + request.getParameter("txt_district") + "')";
                if (con.executeCommand(insQry)) {
                    %>
                    <script>
                        alert("Data Inserted");
                        window.location = "District.jsp";
                    </script>
                    <%
                    } else {
                    %>
                    <script>
                        alert("Data Insertion Failed");
                        window.location = "District.jsp";
                    </script>
                <%
                        }
                    }
                else
                {
                    String up="update tbl_district set district_name='"+request.getParameter("txt_district")+"' where district_id='"+request.getParameter("txt_hid")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("District.jsp");
                    
                }
            }
            if(request.getParameter("did")!=null)
            {
                String delQry="delete from tbl_district where district_id='"+ request.getParameter("did") +"'";
                if(con.executeCommand(delQry))
                {
                    %>
                    <script>
                        alert("deleted");
                        window.location="District.jsp";
                    </script>
                    <%
                }
                else
                {
                    %>
                    <script>
                        alert("Failed");
                        window.location="District.jsp";
                    </script>
                    <%
                    
                }
            }
            if(request.getParameter("eid")!=null)
            {
                String sel="select * from tbl_district where district_id='"+request.getParameter("eid")+"'";
                ResultSet rs1=con.selectCommand(sel);
                rs1.next();
                edid=rs1.getString("district_id");
                ename=rs1.getString("district_name");
                
            }
                %>
                <h1 align="center"><b>ADD DISTRICT</b></h1>
                <br><br>
        <form method="post">
            <table border="1" align="center">
                <tr>
                    <td>District</td>
                    <td><input type="hidden" name="txt_hid" value="<%=edid%>">
                        <input type="text" name="txt_district" required="required" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" placeholder="Enter District" value="<%=ename%>"></td>
                </tr>
                <tr>
                    <td colspan="2" align="center">
                        <input type="submit" name="btn_submit" value="Save">
                        <input type="reset" name="btn_cancel" value="Cancel">
                    </td>
                </tr>
            </table>
                 <br><br>
            <table border="1" align="center">
                <tr>
                    <td>
                        Sl.no
                    </td>
                    <td>
                        District
                    </td>
                    <td>
                        Action
                    </td>
                </tr>
                <tr>
                <%
            int i=0;
            String selQry="select * from tbl_district";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
                    {
                        i++;
                        %>
                        <td><%=i%></td>
                        <td><%=rs.getString("district_name")%></td>
                        <td><a href="District.jsp?did=<%=rs.getString("district_id") %>">Delete</a>
                            <a href="District.jsp?eid=<%=rs.getString("district_id")%>">Edit</a></td>
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