<%
        response.setHeader("Cache-Control", "no-cache, no-store");
        if(session.getAttribute("pid") == null)
        {
            response.sendRedirect("../Guest/Login.jsp");
        }
    %>