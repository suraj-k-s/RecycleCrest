<%-- 
    Document   : Wasterate
    Created on : 26-Jan-2023, 05:07:52
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
        <title>Waste Rate</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
         <%@include file="Head.jsp" %>
        <%
       if(request.getParameter("btn_save")!= null)
           
            {
                String insQry="insert into tbl_ewasterate(ewaste_name,ewaste_rate,ewaste_mode,subcategory_id)"
                        + "values('" +request.getParameter("txt_name")+"','"+request.getParameter("txt_rate")+"','" +request.getParameter("txt_mode")+"','" +request.getParameter("dropdown1")+"')";
                //out.print(insQry);
                if(con.executeCommand(insQry))
                {
                    %>
                    <script>
                      alert("data inserted");
                      window.location="Wasterate.jsp";
                    </script>
                    <%
                }
                else{
                    %>
                    <script>
                      alert("data not inserted");
                      window.location="Wasterate.jsp";
                    </script>
                    <%
               }
            }
       %>
      </body> 
            <form method="post">
                <h1 align="center"><b>WASTE RATE</b></h1>
                <br><br>
                <table border='2' align="center">
                     <tr>
                <td>
                   Category
                </td>
                <td><select name="dropdown" required=required" onchange="getSubcat(this.value)">
                        <option>Select</option>
                        <%
            String sel="select * from tbl_category";
            ResultSet rs=con.selectCommand(sel);
            while(rs.next())
            {
                %>
                <option value="<%=rs.getString("category_id")%>"><%=rs.getString("category_name")%></option>
                <%
            }
            
           
            %>
            
                    </select></td>
            </tr>
            <tr>
                <td>
                  Sub category
                </td>
                <td><select name="dropdown1" required=required" id="sel_subcat">
                        <option>Select</option>
                    </select></td>
                
            </tr>
                    <tr>
            <td>Name</td>
            <td><input type="text" name="txt_name" required="required" placeholder="Enter name" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"></td>
        </tr>
        <tr>
            <td>Mode</td>
            <td><input type="radio" name="txt_mode" required="required" value="pay">Pay
                <input type="radio" name="txt_mode" required="required" value="payback">Pay back</td>
        </tr>
        <tr>
            <td>Rate</td>
            <td><input type="text" name="txt_rate" required="required" placeholder="Enter rate" pattern="^[1-9][0-9]*$" title="You Can Only Enter Number Greater Than Zero"></td>
        </tr>
        
        <tr>    
            <td colspan="2" align="center">
                <input type="submit" name="btn_save" value="Submit">
                </table>
            </div>
         
       </form>
   </html>
   <script src="../Assets/JQuery/jQuery.js"></script>
   
                        <script src="../Assets/JQuery/jQuery.js"></script>
   
                        <script>
                            function getSubcat(cid)
                            {
                                $.ajax({url:"../Assets/AjaxPages/AjaxCategory.jsp?cid=" + cid,
                                success: function(result){
                                    $("#sel_subcat").html(result);
                                }
                            })
                            }
                           
   
                       </script>
                       <%@include file="Foot.jsp" %>