<%-- 
    Document   : Category
    Created on : 13-Dec-2019, 00:51:15
    Author     : PSST
--%>
<%@include  file="SessionValidator.jsp" %>
<%@page import ="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Category</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
        <%@include file="Head.jsp" %>
        <%
            String cdid="",cname="";
        if(request.getParameter("btn_submit")!=null)
        {
            if(request.getParameter("txt_hid").equals(""))
            {
            
           
            String insQry = "insert into tbl_Category(category_name)values('" + request.getParameter("txt_category") + "')";
                if (con.executeCommand(insQry)) {
        
                %>
                <script>
                    alert("data inserted");
                    window.location="Category.jsp";
                </script>
                <%
        }
        else
            {
                %>
                <script>
                        alert("Data Insertion Failed");
                        window.location = "Category.jsp";
                    </script>
                <%
            }
        }
            else{
                String up="update tbl_Category set category_name='"+request.getParameter("txt_category")+"' where category_id='"+request.getParameter("txt_hid")+"' ";
                con.executeCommand(up);
                response.sendRedirect("Category.jsp");
            }
            }
               
                if(request.getParameter("cid")!=null)
                {
                    String delQry="delete from tbl_Category where category_id='"+ request.getParameter("cid") +"'";
                    if(con.executeCommand(delQry))
                    {
                        %>
                        <script>
                            alert("data deleted");
                            window.location="Category.jsp";
                        </script>
                        <%
                    }
                    else
                    {
                        %>
                        <script>
                            alert("data not deleted");
                            window.location="Category.jsp";
                        </script>
                        <%
                    }
                }
                if(request.getParameter("cat_id")!= null)
                {
                    String sel="select * from tbl_category where category_id='"+request.getParameter("cat_id")+"'";
                    ResultSet rs1=con.selectCommand(sel);
                    rs1.next();
                    cdid=rs1.getString("category_id");
                    cname=rs1.getString("category_name");
                }      
                %>
                   
   
    </body>
    <h1 align="center"><b>CATEGORY</b></h1>
     <br><br>
    <form method=post">
        <table border='2'align="center">
            <tr>
                <td>Category</td>
                    <td><input type="hidden" name="txt_hid" value="<%=cdid%>">
                        <input type="text" name="txt_category" required="required" placeholder="Enter category" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" value="<%=cname%>"></td>
            </tr>
            <tr>
                <td colspan="2" align="center">
                    <input type="submit" name="btn_submit" value="Save">
                    <input type="submit" name="btn_cancel" value="Cancel">
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
                       Category
                    </td>
                    <td>
                        Action
                    </td>
                </tr>
                <tr>
                    <%
                    int i=0;
                    String selQry="select * from tbl_category";
                    ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
                    {
                        i++;
                        %>
                        <td><%=i%></td>
                        <td><%=rs.getString("category_name")%></td>
                        <td><a href="Category.jsp?cid=<%=rs.getString("category_id")%>">Delete</a>
                            <a href="Category.jsp?cat_id=<%=rs.getString("category_id")%>">Edit</a></td>
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