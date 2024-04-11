<%@page import="java.sql.ResultSet"%>
<!DOCTYPE html>
<html lang="en">
    <jsp:useBean class="DB.ConnectionClass" id="con"></jsp:useBean>
        <head>
            <meta charset="UTF-8">
            <meta name="viewport" content="width=device-width, initial-scale=1.0">
            <meta http-equiv="X-UA-Compatible" content="ie=edge">
            <title>Product Admin - Dashboard HTML Template</title>
            <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:400,700">
            <!-- https://fonts.google.com/specimen/Roboto -->
            <link rel="stylesheet" href="../Assets/Template/Admin/css/fontawesome.min.css">
            <!-- https://fontawesome.com/ -->
            <link rel="stylesheet" href="../Assets/Template/Admin/css/bootstrap.min.css">
            <!-- https://getbootstrap.com/ -->
            <link rel="stylesheet" href="../Assets/Template/Admin/css/templatemo-style.css">
            <!--
                Product Admin CSS Template
                https://templatemo.com/tm-524-product-admin
            -->
        </head>

        <body id="reportsPage">
            <div class="" id="home">
                <nav class="navbar navbar-expand-xl">
                    <div class="container h-100">
                        <a class="navbar-brand" href="index.html">
                            <h1 class="tm-site-title mb-0">Product Admin</h1>
                        </a>
                        <button class="navbar-toggler ml-auto mr-0" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                            <i class="fas fa-bars tm-nav-icon"></i>
                        </button>

                        <div class="collapse navbar-collapse" id="navbarSupportedContent">
                            <ul class="navbar-nav mx-auto h-100">
                                <li class="nav-item">
                                    <a class="nav-link active" href="Home.jsp">
                                        <i class="fas fa-tachometer-alt"></i>
                                        Dashboard
                                        <span class="sr-only">(current)</span>
                                    </a>
                                </li>
                                <li class="nav-item dropdown">

                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                       aria-haspopup="true" aria-expanded="false">
                                        <i class="far fa-map"></i>
                                        <span>
                                            Location <i class="fas fa-angle-down"></i>
                                        </span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="District.jsp">Add District</a>
                                        <a class="dropdown-item" href="Place.jsp">Add Place</a>
                                        <a class="dropdown-item" href="Location.jsp">Add Location</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">

                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                       aria-haspopup="true" aria-expanded="false">
                                        <i class="far fa-list-alt"></i>
                                        <span>
                                            Category <i class="fas fa-angle-down"></i>
                                        </span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="Category.jsp">Add Category</a>
                                        <a class="dropdown-item" href="Subcategory.jsp">Add Sub-category</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">

                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                       aria-haspopup="true" aria-expanded="false">
                                        <i class="far fa-file-alt"></i>
                                        <span>
                                            Company <i class="fas fa-angle-down"></i>
                                        </span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="ViewCompany.jsp">Registered Companies</a>
                                        <a class="dropdown-item" href="AcceptedCompany.jsp">Accepted Company</a>
                                        <a class="dropdown-item" href="RejectedCompany.jsp">Rejected Company</a>
                                    </div>
                                </li>
                                <li class="nav-item dropdown">

                                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                                       aria-haspopup="true" aria-expanded="false">
                                        <i class="far fa-comment"></i>
                                        <span>
                                           F&C <i class="fas fa-angle-down"></i>
                                        </span>
                                    </a>
                                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                        <a class="dropdown-item" href="Complainttype.jsp">Add Complaint-type</a>
                                        <a class="dropdown-item" href="Usercomplaint.jsp">User Complaints</a>
                                        <a class="dropdown-item" href="ViewFeedbacks.jsp">User Feedbacks</a>
                                    </div>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="PanchayathRegistration.jsp">
                                        <i class="far fa-building"></i>
                                        Panchayat
                                    </a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" href="Wasterate.jsp">
                                        <i class="far fa-money-bill-alt"></i>
                                        Waste_rate
                                    </a>
                                </li>
                                 <li class="nav-item">
                                     <a class="nav-link" href="Report.jsp">
                                        <i class="far fa-calendar"></i>
                                        Report
                                    </a>
                                </li>
                                
                                   <li class="nav-item">
                                    <a class="nav-link d-block" href="login.html">
                                        <b>Logout</b>
                                    </a>
                                </li>


                            </ul>
                            <ul class="navbar-nav">
                                
                            </ul>
                        </div>
                    </div>

                </nav>


                <!-- header end-->
                <div class="container">
                    <div class="row">
                        <div class="col">
                            <p class="text-white mt-5 mb-5">Welcome back, <b>Admin</b></p>
                        </div>
                    </div>
                    <!-- row -->
                    <div class="row tm-content-row">

                        <div class="col-12 tm-block-col">
                            <div class="tm-bg-primary-dark tm-block tm-block-taller tm-block-scroll">
                                <h2 class="tm-block-title">Request List</h2>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th scope="col">DATE</th>
                                            <th scope="col">USER</th>
                                            
                                            <th scope="col">CATEGORY</th>
                                            <th scope="col">SUB CATEGORY</th>
                                            <th scope="col">STATUS</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        int i = 0;
                                        String sel1 = "select * from tbl_request r inner join tbl_user u on u.user_id=r.user_id inner join tbl_ewasterate e on e.ewasterate_id=r.ewasterate_id inner join tbl_subcategory s on s.subcategory_id=e.subcategory_id inner join tbl_category c on c.category_id=s.category_id ";

                                        //out.print(sel1);
                                        ResultSet rs = con.selectCommand(sel1);
                                        while (rs.next()) {
                                            i++;
                                    %>
                                    <tr>
                                        <th scope="row"><b><%=rs.getString("request_date")%></b></th>
                                        <td><b><%=rs.getString("user_name")%></b></td>
                                        <td><%=rs.getString("category_name")%></td>
                                       
                                        <td><%=rs.getString("subcat_name")%></td>
                                        <td>
                                            <%
                                                if (rs.getString("request_status").equals("0")) {
                                                     out.print("pending");
                                              } else if (rs.getString("request_status").equals("1")) {
                                                    out.print("not assigned");
                                                } else if (rs.getString("request_status").equals("1")) {
                                                    out.print("not completed");
                                                } else if (rs.getString("request_status").equals("3") ) {
                                                    out.print("Work Completed");
                                                } else {
                                                    out.print("Rejected");
                                                }
                                            %>
                                        </td>
                                    </tr>


                                    </tr>
                                    <%
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>



            <footer class="tm-footer row tm-mt-small">
                <div class="col-12 font-weight-light">
                    <p class="text-center text-white mb-0 px-4 small">
                        Copyright &copy; <b>2018</b> All rights reserved. 

                        Design: <a rel="nofollow noopener" href="https://templatemo.com" class="tm-footer-link">Template Mo</a>
                    </p>
                </div>
            </footer>
        </div>

        <script src="../Assets/Template/Admin/js/jquery-3.3.1.min.js"></script>
        <!-- https://jquery.com/download/ -->
        <script src="../Assets/Template/Admin/js/moment.min.js"></script>
        <!-- https://momentjs.com/ -->
        <script src="../Assets/Template/Admin/js/Chart.min.js"></script>
        <!-- http://www.chartjs.org/docs/latest/ -->
        <script src="../Assets/Template/Admin/js/bootstrap.min.js"></script>
        <!-- https://getbootstrap.com/ -->
        <script src="../Assets/Template/Admin/js/tooplate-scripts.js"></script>
        <script>
            Chart.defaults.global.defaultFontColor = 'white';
            let ctxLine,
                    ctxBar,
                    ctxPie,
                    optionsLine,
                    optionsBar,
                    optionsPie,
                    configLine,
                    configBar,
                    configPie,
                    lineChart;
            barChart, pieChart;
            // DOM is ready
            $(function() {
                drawLineChart(); // Line Chart
                drawBarChart(); // Bar Chart
                drawPieChart(); // Pie Chart

                $(window).resize(function() {
                    updateLineChart();
                    updateBarChart();
                });
            })
        </script>
    </body>

</html>






























