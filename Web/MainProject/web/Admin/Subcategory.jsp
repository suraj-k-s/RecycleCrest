<%-- 
    Document   : subcategory
    Created on : 13-Dec-2019, 03:11:46
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
        <title>Sub category</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
         <%@include file="Head.jsp" %>
        <%
            if(request.getParameter("btn_submit")!=null)
            {
                String insQry="insert into tbl_subcategory(subcat_name,category_id)values('" +request.getParameter("txt_subcategory")+"','"+request.getParameter("dropdown")+"')";
                if(con.executeCommand(insQry))
                {
                    %>
                    <script>
                      alert("data inserted");
                      window.location="Subcategory.jsp";
                    </script>
                    <%
                }
                else{
                    %>
                    <script>
                      alert("data not inserted");
                      window.location="Subcategory.jsp";
                    </script>
                    <%
               }
            }
            if(request.getParameter("sid")!=null)
                {
                    String delQry="delete from tbl_subcategory where subcategory_id='"+ request.getParameter("sid") +"'";
                    if(con.executeCommand(delQry))
                    {
                        %>
                        <script>
                            alert("data deleted");
                            window.location="Subcategory.jsp";
                        </script>
                        <%
                    }
                    else{
                        %>
                        <script>
                            alert("data deleted");
                            window.location="Subcategory.jsp";
                        </script>
                        <%
                    }
                }
                        
            %>
    </body>
    <h1 align="center"><b>ADD SUB_CATEGORY</b></h1>
    <br><br>
    <form methos="post">
        <table border="2" align="center">
            <tr>
                <td>Category</td>
                        <td><select name="dropdown" required="required">
                                <option>Select</option>
                                <%
            String selQry1="select * from tbl_Category";
            ResultSet rs1=con.selectCommand(selQry1);
            while(rs1.next())
            {
                %>
                <option value="<%=rs1.getString("category_id")%>"><%=rs1.getString("category_name")%> </option>
                <%
            }
            %>
                    </select></td>
            </tr> 
            <tr>
                <td>Sub category</td>
                <td><input type="text" name="txt_subcategory" place holder="Enter sub category" required="required" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"></td>
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
                    Category
                </td>
                <td>
                    Sub category
                </td>
                <td>
                    Action
                </td>
            </tr> 
            <tr>
                <%
            int i=0;
            String selQry="select * from tbl_subcategory s inner join tbl_Category c on c.category_id=s.category_id";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
            {
                i++;
                %>
                <td><%=i%></td>
                <td><%=rs.getString("category_name")%></td>
                <td><%=rs.getString("subcat_name")%></td>
                <td><a href="Subcategory.jsp?sid=<%=rs.getString("subcategory_id")%>">Delete</a></td>
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