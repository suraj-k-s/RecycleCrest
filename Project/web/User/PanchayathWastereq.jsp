<%-- 
    Document   : PanchayathWastereq
    Created on : 23-Feb-2023, 06:42:05
    Author     : PSST
--%>
<%@include  file="SessionValidator.jsp" %>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.sql.ResultSet" %>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title> Request Panchayath</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
        <%@include file="Head.jsp" %>
        <%
        DateFormat yearf = new SimpleDateFormat("YYYY");
        DateFormat monthf = new SimpleDateFormat("MM");
        DateFormat dayf = new SimpleDateFormat("dd");
        String year = yearf.format(new Date());
        String month = monthf.format(new Date());
        String day = dayf.format(new Date());
        int yearnew = Integer.parseInt(year) ;
        
        String Date = String.valueOf(yearnew)+"-"+month+"-"+day;
     
    %>
        <%
            session.setAttribute("pid", request.getParameter("pid"));
            if(request.getParameter("btn_save")!=null)
            {
             String insQry = "insert into tbl_request(request_details,request_date,panchayath_id,user_id,ewasterate_id,request_fordate,request_fortime)values('"+request.getParameter("txt_details")+"',curdate(),'"+request.getParameter("pid")+"','"+session.getAttribute("uid")+"','"+request.getParameter("dropdown2")+"','"+request.getParameter("txt_date")+"','"+request.getParameter("txt_time")+"')";
             //out.print(insQry);  
             if(con.executeCommand(insQry))
             { 
            
                    %>
                    <script>
                        alert("Data Inserted");
                        window.location = "PanchayathWastereq.jsp";
                    </script>
                    <%
                    } 
                else {
                    %>
                    <script>
                        alert("Data Insertion Failed");
                        window.location = "PanchayathWastereq.jsp";
                    </script>
                <%
                        }
            }
            %>
          <h1 align="center"><b>ADD REQUEST</b></h1>
          <br><br>
       <form method="POST">
            
    <table border='2' align="center">
        <tr>
            <td>For Date</td>
            <td><input type="date" name="txt_date" required="required" min="<%=Date%>" placeholder="Select date"</td>
        </tr>
         <tr>
            <td>Available Time</td>
            <td><input type="text" name="txt_time" required="required"  placeholder="Available Time"</td>
        </tr>
        <tr>
            <td>Details</td>
            <td><textarea  name="txt_details" required="required" placeholder="Enter details"></textarea></td>
        </tr>
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
                <td><select name="dropdown1" required=required" id="sel_subcat" onchange="getType(this.value)">
                        <option>Select</option>
                    </select></td>
                
            </tr>
             <tr>
                <td>
                  Type
                </td>
                <td><select name="dropdown2" required=required" id="sel_type" onchange="getRate(this.value)">
                        <option>Select</option>
                    </select></td>
                
            </tr>
            <tr>
            <td>Rate</td>
            <td><input type="text" name="txt_rate" required="required" id="sel_rate" readonly=""></td>
        </tr>
        <tr>    
            <td colspan="2" align="center">
                <input type="submit" name="btn_save" value="Submit">
                </table>
            
         
       </form>
    </body>
</html>
<%@include file="Foot.jsp" %>
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
                              function getType(tid)
                            {
                                $.ajax({url:"../Assets/AjaxPages/AjaxSubcategory.jsp?tid=" + tid,
                                success: function(result){
                                    $("#sel_type").html(result);
                                }
                            })
                            }
                           function getRate(rid)
                            {
                                $.ajax({url:"../Assets/AjaxPages/AjaxRate.jsp?cid=" + rid,
                                success: function(result){
                                   
                                    $("#sel_rate").val(result);
                                }
                            })
                            }
                        </script>
                                </div>

<%@include file="Foot.jsp" %>