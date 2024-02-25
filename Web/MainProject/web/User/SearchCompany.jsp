<%-- 
    Document   : Search
    Created on : 09-Feb-2023, 05:40:24
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
        <title>Search</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
        <%@include file="Head.jsp" %>
        <h1 align="center"><b>SEARCH COMPANY</b></h1>
            <br><br>
        <form method="post">
            <table border="2" align="center">
                <tr>
            <td>District</td>
            <td><select name="dropdown" required="required" id="district" onchange="getPlace(this.value),getCompany()">
                    <option>select</option>
                    <% 
                    String sel="select * from tbl_district";
                    ResultSet rs=con.selectCommand(sel);
                    while(rs.next())
                    {
                        %>
                        <option value="<%=rs.getString("district_id")%>"><%=rs.getString("district_name")%></option>
                        <%
                    }
                    %>
                     </select></td>
            </tr>
            <tr>
                <td>Place</td>
                <td><select name="dropdown1" required="required" id="sel_place" onchange="getCompany()">
                        <option>select</option>
                    </select></td>
                    </tr>
                      
            </table>
                      <div id="search">
           <table border="1" align="center">
                    
                      
                            <tr>
                <%
                    String sel2 = "select * from tbl_company c inner join tbl_place pl on pl.place_id=c.place_id inner join tbl_district d on d.district_id=pl.district_id inner join tbl_user u on u.place_id=c.place_id where c.company_vstatus='1' and u.place_id='"+session.getAttribute("pid")+"'";
                    //out.print(sel2);
                    ResultSet rs2 = con.selectCommand(sel2);
                    while (rs2.next()) {
                %>
               
                <td><img src="../Assets/Files/CompanyPhoto/<%=rs2.getString("company_logo")%>" height="150" width="150"> <br>
                Name:<%=rs2.getString("company_name")%><br>
                Address:<%=rs2.getString("company_address")%><br>
                Contact:<%=rs2.getString("company_contact")%><br>
                Email:<%=rs2.getString("company_email")%><br>
                District:<%=rs2.getString("district_name")%><br>
                Place:<%=rs2.getString("place_name")%><br>
                 <a href="CompanyWastereq.jsp?cid=<%=rs2.getString("company_id")%>">REQUEST</a>
                </tr>
                
                <%
                    }
                %>
              
            </table>
                 </div>      
        </form>
</body>
</html>

<script src="../Assets/JQuery/jQuery.js"></script>
   
                        <script>
                            function getPlace(did)
                            {
                                $.ajax({url:"../Assets/AjaxPages/Ajaxplace.jsp?did=" + did,
                                success: function(result){
                                    $("#sel_place").html(result);
                                }
                            })
                            }
                            function getCompany()
            {
                    //alert(did);
                    var did=document.getElementById("district").value;
                    var pid=document.getElementById("sel_place").value;
                    
                    //alert(did);
                    $.ajax({
                    url: "../Assets/AjaxPages/AjaxCompanySearch.jsp?did="+did+"&pid="+pid,
                      success: function(html){
                            $("#search").html(html);
                            //alert(html);
                      }
                    });
            }
                          
                        </script>
                                </div>

<%@include file="Foot.jsp" %>