<!DOCTYPE html>
<html lang="en">

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
    <link rel="stylesheet" href="../Assets/Template/form.css">
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
                                <i class="far fa-building"></i>
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
                                   Complaint <i class="fas fa-angle-down"></i>
                                </span>
                            </a>
                            <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                                <a class="dropdown-item" href="Complainttype.jsp">Add Complaint-type</a>
                                <a class="dropdown-item" href="Usercomplaint.jsp">User Complaints</a>
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
                            <a class="nav-link" href="ViewFeedbacks.jsp">
                                <i class="far fa-comment-alt"></i>
                                Feedback
                            </a>
                        </li>

                       
                       
                    </ul>
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link d-block" href="login.html">
                                <b>Logout</b>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>

        </nav>
        
        <br><br>