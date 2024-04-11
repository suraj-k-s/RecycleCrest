<%-- 
    Document   : Driver
    Created on : 02-Feb-2023, 04:58:47
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
        <title>Driver Registration</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
         <%@include file="Head.jsp" %>
        <h1 align="center"><b>DRIVER REGISTRATION FORM</b></h1>
        <br><br>
      <%
           
    if(request.getParameter("did")!= null)
            {
                String delQry="delete from tbl_driver where driver_id='"+request.getParameter("did")+"'";
                if(con.executeCommand(delQry))
                {
                    %>
                    <script>
                        alert("data deleted");
                        window.location="Driver.jsp";
                    </script>
                    <%
                }
                else{
                 %>
                 
                 <script>
                     alert("data deletion failed");
                     window.location="Driver.jsp";
                 </script>
                 <%
                }
            }
            %>
            </body> 
            <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/DriverAction1.jsp">
            
    <table border='2' align="center">
        <tr>
            <td>Name</td>
            <td><input type="text" name="txt_dname" required="required" placeholder="Enter name" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
        </tr>
        <tr>
            <td>Address</td>
            <td><textarea  name="txt_address" required="required" placeholder="Enter address"></textarea></td>
        </tr>
        <tr>
            <td>Contact</td>
            <td><input type="text" name="txt_contact" required="required" placeholder="Enter contact" title="Phone Number with 7-9 and remaining 9 digit with 0-9" pattern="[7-9]{1}[0-9]{9}"/></td>
        </tr>
        <tr>
            <td>Email</td>
            <td><input type="email" name="txt_email" required="required" placeholder="Enter email"></td>
        </tr>
        <tr>
            <td>Gender</td>
            <td><input type="radio" name="txt_gender" required="required" value="Male">Male
                <input type="radio" name="txt_gender" required="required" value="Female">Female</td>
        </tr>
        <tr>
            <td>Dob</td>
            <td><input type="date" name="txt_dob" required="required" placeholder="Enter dob"></td>
        </tr>
        
        <tr>
            <td>District</td>
            <td><select name="dropdown" required="required" onchange="getPlace(this.value)">
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
                <td><select name="dropdown1" required="required" id="sel_place" onchange="getLocation(this.value)">
                        <option>select</option>
                    </select></td>
                    </tr>
                      <td>Location</td>
                      <td><select name="dropdown2" required="required" id="sel_location" >
                        <option>select</option>
                    </select></td>
        <tr>
                  <td>
                     Photo
                  </td>
                <td><input type="file" name="txt_photo" required="required" placeholder="Upload photo"></td>
                </tr>
                
                 <tr>
                  <td>
                     Proof
                  </td>
                <td><input type="file" name="txt_proof" required="required" placeholder="Upload proof"></td>
                </tr>
                <tr>
                        <td>
                            Password
                        </td>
                        <td><input type="password" name="txt_password" required="required" placeholder="Enter password" title="Must Contain Atleast One Number And One Uppercase and Lowecase Letter, And Atleast 8 or More Characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"></td>
                    </tr>
                 
                 
                           
        <tr>    
            <td colspan="2" align="center">
                <input type="submit" name="btn_save" value="Save">
                <input type="submit" name="btn_cancel" value="Cancel">
            </td>
        </tr>
    </table>
         
       </form>
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
                            
                           function getLocation(pid)
                            {
                                $.ajax({url:"../Assets/AjaxPages/AjaxLocation.jsp?pid=" + pid,
                                    success: function(result){
                                    $("#sel_location").html(result);
                                }
                            })
                            }
                        </script>
        </div>


<%@include file="Foot.jsp" %>
