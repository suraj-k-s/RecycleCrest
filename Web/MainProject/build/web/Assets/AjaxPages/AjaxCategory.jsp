<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


<option>Select</option>
<%
    String sel="select * from tbl_subcategory where category_id='"+request.getParameter("cid")+"'";
    ResultSet rs=con.selectCommand(sel);
    while(rs.next())
    {
        %>
        <option value="<%=rs.getString("subcategory_id")%>" ><%=rs.getString("subcat_name")%></option>
        <%
    }
    
    
    
    %>