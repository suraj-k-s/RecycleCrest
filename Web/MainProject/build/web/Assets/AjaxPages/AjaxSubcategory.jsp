<%@page import="java.sql.ResultSet"%>
<jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>


    <option>--select--</option>
<%
    String sel="select * from tbl_ewasterate where subcategory_id='"+request.getParameter("tid")+"'";
    ResultSet rs=con.selectCommand(sel);
  while(rs.next())
  {
      %>
      <option value="<%=rs.getString("ewasterate_id")%>"><%=rs.getString("ewaste_name")%></option>
      <%
  }
   
    
    %>
   