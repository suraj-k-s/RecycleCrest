<%-- 
    Document   : VechileRegistration
    Created on : 23-Feb-2023, 04:37:44
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
        <title>Vechile Registration</title>
    </head>
    <body align="center">
        <div id="tab" align="center">
      <%@include file="Head.jsp" %>   
        <%
            String vdid="", vname="",vnum="";
            if(request.getParameter("btn_save")!= null)
            {
            if(request.getParameter("txt_hid").equals(""))
             {
             String insQry="insert into tbl_vechile(vechile_name,vechile_number,company_id)values('"+request.getParameter("txt_vname")+"','"+request.getParameter("txt_number")+"','"+session.getAttribute("cid")+"')";
             out.print(insQry);
             if(con.executeCommand(insQry))
             {
              %>
              <script>
                  alert("data inserted");
                  window.location="VechileRegistration.jsp";
              </script>
              <%
             }
             else{
                 %>
                 <script>
                     alert("data insertion failed");
                     window.location="VechileRegistration.jsp";
                 </script>
                 <%
             }
            }
            else
                {
                    String up="update tbl_vechile set vechile_name='"+request.getParameter("txt_vname")+"',vechile_number='"+request.getParameter("txt_number")+"' where vechile_id='"+request.getParameter("txt_hid")+"'";
                    con.executeCommand(up);
                    response.sendRedirect("VechileRegistration.jsp");
                    
                }
            }
             if(request.getParameter("vid")!= null)
            {
                String delQry="delete from tbl_vechile where vechile_id='"+request.getParameter("vid")+"'";
                if(con.executeCommand(delQry))
                {
                    %>
                    <script>
                        alert("data deleted");
                        window.location="VechileRegistration.jsp";
                    </script>
                    <%
                }
                else{
                 %>
                 <script>
                     alert("data deletion failed");
                     window.location="VechileRegistration.jsp";
                 </script>
                 <%
                }
            }
             if(request.getParameter("vdid")!=null)
            {   
                
                String sel="select * from tbl_vechile where vechile_id='"+request.getParameter("vdid")+"'";
                ResultSet rs1=con.selectCommand(sel);
                rs1.next();
                vdid=rs1.getString("vechile_id");
                vname=rs1.getString("vechile_name");
                vnum=rs1.getString("vechile_number");
            }
                
            %>  
    <h1 align="center"><b>VEHICLE REGISTRATION FORM</b></h1> 
   <br><br>
        <form method="post">
            
    <table border='2' align="center">
        <tr>
            <td>Name</td>
            <td><input type="hidden" name="txt_hid" value="<%=vdid%>">
            <input type="text" name="txt_vname" required="required" placeholder="Enter name" title="Name Allowa Only Alphabets,Spaces and First Letter Must Be Capital Letter" pattern="^[A-Z]+[a-zA-Z ]*$" value="<%=vname%>"></td>
        </tr>
        <tr>
            <td>Number</td>
            <td><input type="text" name="txt_number" required="required" placeholder="Enter number" pattern="^[a-zA-Z]+[0-9]+$" title="Should Contain Alphabets And Numbers" value="<%=vnum%>"></td>
        </tr>
         <tr>    
            <td colspan="2" align="center">
                <input type="submit" name="btn_save" value="Save">
                <input type="submit" name="btn_cancel" value="Cancel">
            </td>
        </tr>
    </table>
         <br><br>
       </form>
        <table border="2" align="center">
        <tr>
            <td>
                Sl.no
            </td>
            <td>
                Name
            </td>
             
            <td>
                Number
            </td>
        <td>
            Action
        </td>
        </tr>
        <%
            int i=0;
            String selQry="select * from tbl_vechile where company_id='"+session.getAttribute("cid")+"'";
            ResultSet rs=con.selectCommand(selQry);
            while(rs.next())
                    {
                        i++;
                        %>
                        <td><%=i%></td>
                        <td><%=rs.getString("vechile_name")%></td>
                         <td><%=rs.getString("vechile_number")%></td>
                        <td><a href="VechileRegistration.jsp?vid=<%=rs.getString("vechile_id") %>">Delete</a>
                            <a href="VechileRegistration.jsp?vdid=<%=rs.getString("vechile_id")%>">Edit</a></td>
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


