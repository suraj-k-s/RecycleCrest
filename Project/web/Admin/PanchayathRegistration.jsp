<%-- 
    Document   : PanchayathRegistration
    Created on : 21-Dec-2019, 01:22:10
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
        <title>Panchayath Registration</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
        <%@include file="Head.jsp" %>
        <h1 align="center"><b>PANCHAYAT REGISTRATION FORM</b></h1>
         <br><br>
        <%
    if(request.getParameter("pid")!= null)
            {
                String delQry="delete from tbl_panchayath where panchayath_id='"+request.getParameter("pid")+"'";
                if(con.executeCommand(delQry))
                {
                    %>
                    <script>
                        alert("data deleted");
                        window.location="PanchayathRegistration.jsp";
                    </script>
                    <%
                }
                else{
                 %>
                 <script>
                     alert("data deletion failed");
                     window.location="PanchayathRegistration.jsp";
                 </script>
                 <%
                }
            }
            %>
            </body>
        <form method="post" enctype="multipart/form-data" action="../Assets/ActionPages/PanchayathAction.jsp">
    <table border='2' align="center">
        <tr>
            <td>Name</td>
            <td><input type="text" name="txt_pname" required="required" placeholder="Enter name" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$"/></td>
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
            <td>Photo</td>
            <td><input type="file" name="txt_photo" required="required" placeholder="Upload photo"></td>
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
                <td><select name="dropdown1" required="required" id="sel_place">
                        <option>select</option>
                    </select></td>
                    </tr>
                    <tr>
                        <td>
                            Password
                        </td>
                        <td><input type="password" name="txt_password" required="required" placeholder="Enter password" title="Must Contain Atleast One Number And One Uppercase and Lowecase Letter, And Atleast 8 or More Characters" pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}"/></td>
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
                        Name
                    </td>
                    <td>
                        Address
                    </td>
                    <td>
                        Contact
                    </td>
                    <td>
                        Email
                    </td>
                    <td>
                        Photo
                    </td>
                    <td>
                        District
                    </td>
                    <td>
                        Place
                    </td>
                    <td>
                        Action
                    </td>
                </tr>
                <tr>
                            <%
                            int i=0;
                            String sel1="select * from tbl_panchayath y inner join tbl_place p on p.place_id=y.place_id inner join tbl_district d on d.district_id=p.district_id";
                            
                            //System.out.print(sel1);
                            ResultSet rs3=con.selectCommand(sel1);
                            while(rs3.next())
                            {
                                i++;
                                %>
                                <td><%=i%></td>
                                <td><%=rs3.getString("panchayath_name")%></td>
                                <td><%=rs3.getString("panchayath_address")%></td>
                                <td><%=rs3.getString("panchayath_contact")%></td>
                                <td><%=rs3.getString("panchayath_email")%></td>
                                <td><img src="../Assets/Files/PanchayathPhoto/<%=rs3.getString("panchayath_photo")%>" height="150" width="150"> </td>
                                <td><%=rs3.getString("district_name")%></td>
                                <td><%=rs3.getString("place_name")%></td>
                                
                                <td><a href="PanchayathRegistration.jsp?pid=<%=rs3.getString("panchayath_id")%>">DELETE</a></td>
                        </tr>
                                <%
                            }
                            %>
                
            </table>
                             </div>
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
                           
                        </script>
                        <%@include file="Foot.jsp" %>