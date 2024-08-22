﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fruitables - About Us</title>

    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&family=Raleway:wght@600;800&display=swap"
        rel="stylesheet" />

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
        rel="stylesheet" />

    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet" />
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/styl.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">

        <!-- Navbar Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->

        <!-- Navbar start -->
        <div class="container-fluid fixed-top">

            <div class="container px-0">
                <nav class="navbar navbar-light navbar-expand-xl" id="navcol">
                    <asp:HyperLink ID="HyperLink4" class="navbar-brand ps-5" NavigateUrl="~/Home.aspx"
                        runat="server">
                        <h1 class="text-primary display-6">Fruitables</h1>
                    </asp:HyperLink>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse">
                        <div class="navbar-nav mx-auto">
                            <asp:HyperLink ID="HyperLink2" class="nav-item nav-link" NavigateUrl="~/Home.aspx"
                                runat="server">Home</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink1" class="nav-item nav-link" NavigateUrl="~/Shop.aspx"
                                runat="server">Shop</asp:HyperLink>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                        <asp:HyperLink ID="HyperLink3" NavigateUrl="~/Cart.aspx" class="dropdown-item" runat="server">Cart</asp:HyperLink>
                                    <asp:HyperLink ID="Hyper_order" Visible="false" NavigateUrl="~/Order.aspx" class="dropdown-item"
                                        runat="server">Order</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink14" NavigateUrl="~/About.aspx" class="dropdown-item"
                                        runat="server">About</asp:HyperLink></div>
                                </div>
                            </div>
                            <asp:HyperLink ID="HyperLink5" NavigateUrl="~/Contact.aspx" class="nav-item nav-link"
                                runat="server">Contact</asp:HyperLink>
                        </div>
                        <div class="d-flex m-3 me-0 pe-5 align-items-center">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4">
                                <i class="fas fa-search text-primary"></i>
                            </button>
                            <input type="text" class="form-control d-none me-2" id="searchInput" placeholder="Search..." />

                            <asp:HyperLink ID="HyperLink6" class="position-relative me-4 my-auto" NavigateUrl="~/Sign_in.aspx"
                                runat="server">
                    <i class="fa fa-power-off custom-icon-size" aria-hidden="true"></i>
                            </asp:HyperLink>
                         <asp:HyperLink ID="Pro_HY" class="my-auto" Visible="false" runat="server">
                    <i class="fas fa-user fa-2x"></i>
                            </asp:HyperLink>
                            <asp:ImageButton ID="IMg_Av" Visible="false" CssClass="rounded-circle" PostBackUrl="~/USprofile.aspx" src="img/avatar.jpg"
                                Width="40" Height="35" runat="server" />
                            <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" CssClass="rounded-circle" PostBackUrl="~/USprofile.aspx" Width="40" Height="35"
                                        ImageUrl='<%# Eval("photo") %>' runat="server" />
                                    <asp:Image ID="Image2" runat="server" />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- About Us Start -->
        <div class="container-fluid py-5">
            <div class="container about">
                <h1 class="text-center text-dark display-6 mb-5">About Us</h1>
                <div class="row mb-5">
                    <div class="col-lg-6 mb-5 mb-lg-0">
                        <img src="img/pexels-akos-szabo-145938-440731.jpg" alt="About Us" class="img-fluid mt-5 pt-2 rounded-3" />
                    </div>
                    <div class="col-lg-6">
                        <h2 class="text-primary mb-4">Our Story</h2>
                        <p class="mb-4">At Fruitables, we believe that healthy eating starts with fresh, high-quality
                            produce. Our journey began with a vision to provide our community with the finest
                            fruits and vegetables sourced directly from local farms.</p>
                        <p class="mb-4">From our humble beginnings as a small farmers' market stall, we have
                            grown into a trusted name in the industry, known for our commitment to quality,
                            sustainability, and exceptional customer service.</p>
                        <p class="mb-4">We are dedicated to offering a diverse range of products, including
                            organic fruits, vegetables, and gourmet foods. Our team works tirelessly to ensure
                            that every product on our shelves meets our high standards of freshness and taste.
                        </p>
                        <p class="mb-4">Thank you for being a part of our journey. We look forward to serving
                            you and continuing to bring you the best produce and products for years to come!
                        </p>
                    </div>
                </div>

                <!-- Our Team Section -->
                <h2 class="text-primary mb-4 text-center">Meet Our Team</h2>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="team-member text-center">
                            <img src="img/profile-img.jpg" alt="Team Member" class="img-fluid rounded-circle mb-3"
                                style="width: 150px; height: 150px;" />
                            <h5 class="text-dark">John Doe</h5>
                            <p class="text-secondary">Founder & CEO</p>
                            <p>John is the visionary behind Fruitables, bringing years of experience and a passion
                                for fresh produce to the company.</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="team-member text-center">
                            <img src="img/messages-3.jpg" alt="Team Member" class="img-fluid rounded-circle mb-3"
                                style="width: 150px; height: 150px;" />
                            <h5 class="text-dark">Jane Smith</h5>
                            <p class="text-secondary">Marketing Manager</p>
                            <p>Jane manages our marketing efforts, ensuring that our products reach you through
                                innovative and engaging campaigns.</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="team-member text-center">
                            <img src="img/messages-1.jpg" alt="Team Member" class="img-fluid rounded-circle mb-3"
                                style="width: 150px; height: 150px;" />
                            <h5 class="text-dark">Emily Johnson</h5>
                            <p class="text-secondary">Customer Service Specialist</p>
                            <p>Emily is dedicated to providing exceptional customer service and ensuring that every
                                customer has a positive experience with us.</p>
                        </div>
                    </div>
                </div>

                <!-- Core Values Section -->
                <h2 class="text-primary mb-4 text-center">Our Core Values</h2>
                <div class="row">
                    <div class="col-md-4 mb-4">
                        <div class="core-value text-center p-4 border rounded-3">
                            <i class="fas fa-seedling fa-3x text-success mb-3"></i>
                            <h5 class="text-dark">Sustainability</h5>
                            <p>We are committed to eco-friendly practices and supporting local farmers to reduce
                                our environmental footprint.</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="core-value text-center p-4 border rounded-3">
                            <i class="fas fa-star fa-3x text-warning mb-3"></i>
                            <h5 class="text-dark">Quality</h5>
                            <p>Our products are carefully selected to ensure the highest quality and freshness for
                                our customers.</p>
                        </div>
                    </div>
                    <div class="col-md-4 mb-4">
                        <div class="core-value text-center p-4 border rounded-3">
                            <i class="fas fa-handshake fa-3x text-primary mb-3"></i>
                            <h5 class="text-dark">Customer Focus</h5>
                            <p>We strive to exceed customer expectations through excellent service and a commitment
                                to understanding their needs.</p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- About Us End -->

        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
                <div class="container py-5">
                    <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5);">
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <a href="Home.aspx">
                                    <h1 class="text-primary mb-0">Fruitables</h1>
                                    <p class="text-secondary mb-0">Fresh products</p>
                                </a>
                            </div>
                            <div class="col-lg-6">
                                <div class="position-relative mx-auto">
                                    <input class="form-control border-0 w-100 py-3 px-4 rounded-pill" type="number" placeholder="Your Email" />
                                    <button type="submit" class="btn btn-primary border-0 border-secondary py-3 px-4 position-absolute rounded-pill text-white"
                                        style="top: 0; right: 0;">
                                        Subscribe Now</button>
                                </div>
                            </div>
                            <div class="col-lg-3">
                                <div class="d-flex justify-content-end pt-3">
                                    <a href="https://www.instagram.com" class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle">
                                        <i class="fab fa-instagram"></i></a>
                                    <a href="https://www.linkedin.com" class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle">
                                        <i class="fab fa-linkedin"></i></a>
                                    <a href="https://www.facebook.com" class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle">
                                        <i class="fab fa-facebook-f"></i></a>
                                    <a href="https://www.telegram.org" class="btn  btn-outline-secondary me-2 btn-md-square rounded-circle">
                                        <i class="fab fa-telegram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row g-5">
                        <div class="col-lg-3 col-md-6">
                            <div class="footer-item">
                                <h4 class="text-light mb-3">Why People Like us!</h4>
                                <p class="mb-4">
                                    typesetting, remaining essentially unchanged. It was 
                                popularised in the 1960s with the like Aldus PageMaker including of Lorem Ipsum.
                                </p>
                                <a href="#" class="btn border-secondary py-2 px-4 rounded-pill text-primary">Read More</a>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex flex-column text-start footer-item">
                                <h4 class="text-light mb-3">Shop Info</h4>
                                <asp:HyperLink ID="HyperLink9" NavigateUrl="~/About.aspx" CssClass="btn-link" runat="server">About Us</asp:HyperLink>
                                <asp:HyperLink ID="HyperLink10" NavigateUrl="~/Contact.aspx" CssClass="btn-link"
                                    runat="server">Contact Us</asp:HyperLink>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="d-flex flex-column text-start footer-item">
                                <h4 class="text-light mb-3">Account</h4>
                                <asp:HyperLink ID="HyperLink7" NavigateUrl="~/USprofile.aspx" CssClass="btn-link"
                                    runat="server">My Account</asp:HyperLink>
                                <asp:HyperLink ID="HyperLink8" NavigateUrl="~/shop.aspx" CssClass="btn-link" runat="server">Shopping</asp:HyperLink>
                                <asp:HyperLink ID="HyperLink11" NavigateUrl="~/Cart.aspx" CssClass="btn-link" runat="server">Shopping Cart</asp:HyperLink>
                                <asp:HyperLink ID="HyperLink12" NavigateUrl="~/Order.aspx" CssClass="btn-link" runat="server">Order History</asp:HyperLink>
                            </div>
                        </div>
                        <div class="col-lg-3 col-md-6">
                            <div class="footer-item">
                                <h4 class="text-light mb-3">Contact</h4>
                                <p>Address: 1429 Netus Rd, NY 48247</p>
                                <p>Email: Example@gmail.com</p>
                                <p>Phone: +0123 4567 8910</p>
                                <p>Payment Accepted</p>
                                <img src="img/payment.png" class="img-fluid" alt="" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <!-- Footer End -->

    </form>
    <!-- JavaScript Libraries -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.4/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/lightbox/js/lightbox.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>

</html>
