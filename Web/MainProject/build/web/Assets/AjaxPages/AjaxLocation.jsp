<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<option>Select</option>
<%
    String sel="select * from tbl_location where place_id='"+request.getParameter("pid")+"'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("location_id")%>" ><%=rs.getString("location_name")%></option>
        <%
    }
    
    
    
    %>