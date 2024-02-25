<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>



<%
    String sel="select * from tbl_ewasterate where ewasterate_id='"+request.getParameter("cid")+"'";
    ResultSet rs=con.selectCommand(sel);
   rs.next();
    out.println(rs.getString("ewaste_rate"));
    
    %>
   