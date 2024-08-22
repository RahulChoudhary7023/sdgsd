<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" EnableEventValidation="false"
    Inherits="Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Fruitables - Vegetable Website</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />

    <link rel="preconnect" href="https://fonts.gstatic.com" />
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
        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->

        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl">
                    <a href="#" class="navbar-brand ps-5">
                        <h1 class="text-primary display-6">Fruitables</h1>
                    </a>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>

                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse" style="height: 70px !important;">

                        <div class="navbar-nav mx-auto">
                            <asp:HyperLink ID="HyperLink2" class="nav-item nav-link" NavigateUrl="~/Home.aspx"
                                runat="server">Home</asp:HyperLink>

                            <asp:LinkButton ID="LinkButton2" class="nav-item nav-link" runat="server" OnClick="shop_Click">Shop</asp:LinkButton>

                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <asp:HyperLink ID="HyperLink4" NavigateUrl="~/Cart.aspx" class="dropdown-item" runat="server">Cart</asp:HyperLink>
                                    <asp:HyperLink ID="Hyper_order" Visible="false" NavigateUrl="~/Order.aspx" class="dropdown-item"
                                        runat="server">Order</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink41" NavigateUrl="~/About.aspx" class="dropdown-item"
                                        runat="server">About</asp:HyperLink>
                                </div>
                            </div>
                            <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="~/Contact.aspx" class="nav-item nav-link">Contact</asp:HyperLink>
                        </div>

                        <div class="d-flex m-3 me-0 pe-5 align-items-center">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4">
                                <i class="fas fa-search text-primary"></i>
                            </button>
                            <input type="text" class="form-control d-none me-2" id="searchInput" placeholder="Search..." />

                            <asp:LinkButton ID="LinkButton3" OnClick="Sign_Click" class="position-relative me-4 my-auto"
                                runat="server">
                                <i class="fa fa-power-off custom-icon-size" aria-hidden="true"></i>
                            </asp:LinkButton>

                            <asp:HyperLink ID="Pro_HY" class="my-auto" Visible="false" runat="server">
                    <i class="fas fa-user fa-2x"></i>
                            </asp:HyperLink>

                            <asp:ImageButton ID="IMg_Av" Visible="false" PostBackUrl="~/USprofile.aspx" CssClass="rounded-circle "
                                src="img/avatar.jpg"
                                Width="40" Height="35" runat="server" />

                            <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" PostBackUrl="~/USprofile.aspx" CssClass="rounded-circle"
                                        Width="40" Height="35"
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



        <!-- Hero Start -->
        <div class="container-fluid py-5 mb-5 hero-header">
            <div class="container py-5">
                <div class="row g-5 align-items-center">
                    <div class="col-md-12 col-lg-7">
                        <h4 class="mb-3 text-secondary">100% Organic Foods</h4>
                        <h1 class="mb-5 display-3 text-primary">Organic Veggies & Fruits Foods</h1>
                        <div class="position-relative mx-auto">
                            <input class="form-control border-2 border-secondary w-75 py-3 px-4 rounded-pill"
                                type="number" placeholder="Search" />
                            <button type="submit" class="btn btn-primary border-2 border-secondary py-3 px-4 position-absolute rounded-pill text-white h-100"
                                style="top: 0; right: 25%;">
                                Submit Now</button>
                        </div>
                    </div>
                    <div class="col-md-12 col-lg-5">
                        <div id="carouselId" class="carousel slide position-relative" data-bs-ride="carousel">
                            <div class="carousel-inner" role="listbox">
                                <div class="carousel-item active rounded">
                                    <img src="img/hero-img-1.png" class="img-fluid w-100 h-100 bg-secondary rounded"
                                        alt="First slide" />
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Fruites</a>
                                </div>
                                <div class="carousel-item rounded">
                                    <img src="img/hero-img-2.jpg" class="img-fluid w-100 h-100 rounded" alt="Second slide" />
                                    <a href="#" class="btn px-4 py-2 text-white rounded">Vesitables</a>
                                </div>
                            </div>
                            <button class="carousel-control-prev" type="button" data-bs-target="#carouselId"
                                data-bs-slide="prev">
                                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Previous</span>
                            </button>
                            <button class="carousel-control-next" type="button" data-bs-target="#carouselId"
                                data-bs-slide="next">
                                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                                <span class="visually-hidden">Next</span>
                            </button>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Hero End -->


        <!-- Featurs Section Start -->
        <div class="container-fluid featurs py-5">
            <div class="container py-5 text-center">
                <h1>Fresh Veggies SG</h1>
                <p class="p-3 Fresh1">
                    Fresh Veggies SG is the place for all your vegetable needs. Providing you with the
                    <br />
                    freshest
                     fruits and vegetables at affordable prices, delivered right to your doorstep in<br />
                    Singapore.
                </p>

                <p class="Fresh1">
                    Be inspired by our curated recipes for cooking and juicing, and learn how you can
                    eat<br />
                    healthier 
                    and better from our healthcare tips and nutrition information. 
                </p>
                <p class="p-3 Fresh1">Your trusted fresh fruits and vegetables online delivery.</p>

            </div>
        </div>
        <!-- Featurs Section End -->


        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite py-5">
            <div class="container py-5">
                <div class="tab-class text-center">
                    <div class="row g-4 pb-5">
                        <h1>Shop Our Fresh Vegetable Picks!</h1>
                    </div>
                    <div class="tab-content">
                        <div id="tab-1" class="tab-pane fade show p-0 active">
                            <div class="row g-4">
                                <div class="col-lg-12">
                                    <div class="row g-4">
                                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                            <ItemTemplate>

                                                <div class="col-md-6 col-lg-4 col-xl-3 ">
                                                    <div class="rounded position-relative fruite-item border rounded">
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="shopid">
                                                            <div class="fruite-img">
                                                                <asp:Image ID="Image1" runat="server" Height="250" class="img-fluid w-100 rounded-top"
                                                                    ImageUrl='<%# Eval("CAphoto") %>' />
                                                            </div>
                                                            <div class="p-1">
                                                                <asp:Label ID="Label1" Width="100%" runat="server" CssClass="lblcolor" Font-Bold="true"
                                                                    Font-Size="25px"
                                                                    Text='<%# Eval("CAname") %>'></asp:Label>
                                                                <asp:Label ID="Label2" runat="server" CssClass="lblcolor" Text='<%# Eval("CAdescription") %>'></asp:Label>
                                                                <asp:Label ID="lbl_Caid" runat="server" Visible="false" Text='<%# Eval("CAid") %>'></asp:Label>
                                                            </div>
                                                        </asp:LinkButton>
                                                    </div>
                                                </div>

                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->


        <!-- Featurs Start -->
        <div class="container-fluid service py-5">
            <div class="container py-5">
                <div class="row g-4 justify-content-center">
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-secondary rounded border border-secondary">
                                <img src="img/featur-1.jpg" class="img-fluid rounded-top w-100" alt="" />
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-primary text-center p-4 rounded">
                                        <h5 class="text-white">Fresh Apples</h5>
                                        <h3 class="mb-0">20% OFF</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-dark rounded border border-dark">
                                <img src="img/featur-2.jpg" class="img-fluid rounded-top w-100" alt="" />
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-light text-center p-4 rounded">
                                        <h5 class="text-primary">Tasty Fruits</h5>
                                        <h3 class="mb-0">Free delivery</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="col-md-6 col-lg-4">
                        <a href="#">
                            <div class="service-item bg-primary rounded border border-primary">
                                <img src="img/featur-3.jpg" class="img-fluid rounded-top w-100" alt="" />
                                <div class="px-4 rounded-bottom">
                                    <div class="service-content bg-secondary text-center p-4 rounded">
                                        <h5 class="text-white">Exotic Vegitable</h5>
                                        <h3 class="mb-0">Discount 30%</h3>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
        <!-- Featurs End -->


        <!-- Vesitable Shop Start-->
        <div class="container-fluid vesitable py-5">
            <div class="container py-5">
                <h1 class="mb-0">Fresh Organic Vegetables</h1>
                <div class="owl-carousel vegetable-carousel justify-content-center">

                    <asp:Repeater ID="Repeater3" runat="server" OnItemCommand="Repeater3_ItemCommand">
                        <ItemTemplate>
                            <asp:Label ID="lbl_Pric" Visible="false" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                            <asp:Label ID="lbl_PRid" Visible="false" runat="server" Text='<%# Eval("PRid") %>'></asp:Label>
                            <div class="border border-primary rounded position-relative vesitable-item">
                                <div class="vesitable-img">
                                    <asp:ImageButton ID="ImageButton2" runat="server" class="img-fluid w-100 rounded-top" Height="200" CommandName="Productid"
                                        ImageUrl='<%# Eval("photo") %>' />
                                </div>
                                <div class="text-white bg-primary px-3 py-1 rounded position-absolute" style="top: 10px;
                                    right: 10px;">
                                    Vegetable
                                </div>
                                <div class="p-2 rounded-bottom">
                                    <h4>
                                        <asp:Label ID="Label1" Width="100%" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                    </h4>
                                    <p>
                                        <asp:Label ID="Label3" Width="100%" runat="server" Text='<%# TruncateDescription(Eval("description").ToString(),9) %>'></asp:Label>
                                    </p>
                                    <div class="d-flex justify-content-between flex-lg-wrap">
                                        <p class="text-dark fs-5 fw-bold mb-2">
                                            <asp:Label ID="Label4" runat="server" Text='<%#"₹"+ Eval("price") %>'></asp:Label>
                                            <asp:Label ID="Label7" CssClass="ps-2" runat="server" Text='<%#"("+ Eval("PRweight") +"gm)"%>'></asp:Label>
                                        </p>
                                        <a href="#" class="">
                                        <asp:LinkButton ID="LinkButton4" CssClass="btn border border-secondary rounded-pill px-3 text-primary" CommandName="Addcart" runat="server">
                                            <i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart
                                        </asp:LinkButton>

                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>

                </div>
            </div>
        </div>
        <!-- Vesitable Shop End -->


        <!-- Banner Section Start-->
        <div class="container-fluid banner bg-secondary my-5">
            <div class="container py-5">
                <div class="row g-4 align-items-center">
                    <div class="col-lg-6">
                        <div class="py-4">
                            <h1 class="display-3 text-white">Fresh Exotic Fruits</h1>
                            <p class="fw-normal display-3 text-dark mb-4">in Our Store</p>
                            <p class="mb-4 text-dark">
                                Discover the best exotic fruits, carefully selected for their
                                exceptional quality and flavor. Enjoy freshness and taste like never before.
                            </p>
                            <a href="#" class="banner-btn btn border-2 border-white rounded-pill text-dark py-3 px-5">
                                BUY</a>
                        </div>
                    </div>
                    <div class="col-lg-6">
                        <div class="position-relative">
                            <img src="img/baner-1.png" class="img-fluid w-100 rounded" alt="" />
                            <div class="d-flex align-items-center justify-content-center bg-white rounded-circle position-absolute"
                                style="width: 140px; height: 140px; top: 0; left: 0;">
                                <h1 style="font-size: 100px;">1</h1>
                                <div class="d-flex flex-column">
                                    <span class="h2 mb-0">50 ₹</span>
                                    <span class="h4 text-muted mb-0">kg</span>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Banner Section End -->


        <!-- Bestsaler Product Start -->
        <div class="container-fluid py-5">
            <div class="container py-5">
                <div class="text-center mx-auto mb-5" style="max-width: 700px;">
                    <h1 class="display-4">Bestseller Products</h1>
                    <p>
                        Explore our range of top-selling products. Enjoy the best quality and flavors.
                    </p>
                </div>
                <div class="row g-4">
                    <div class="col-lg-6 col-xl-4">
                        <div class="p-4 rounded bg-light">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <img src="img/best-product-1.jpg" class="img-fluid rounded-circle w-100" alt="" />
                                </div>
                                <div class="col-6">
                                    <a href="#" class="h5">Oranges</a>
                                    <div class="d-flex my-3">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h4 class="mb-3">50 ₹ /kg</h4>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                        class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-4">
                        <div class="p-4 rounded bg-light">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <img src="img/best-product-2.jpg" class="img-fluid rounded-circle w-100" alt="" />
                                </div>
                                <div class="col-6">
                                    <a href="#" class="h5">Raspberries</a>
                                    <div class="d-flex my-3">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h4 class="mb-3">810 ₹ /kg</h4>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                        class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-4">
                        <div class="p-4 rounded bg-light">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <img src="img/best-product-3.jpg" class="img-fluid rounded-circle w-100" alt="" />
                                </div>
                                <div class="col-6">
                                    <a href="#" class="h5">Bananas</a>
                                    <div class="d-flex my-3">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h4 class="mb-3">40 ₹ /kg</h4>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                        class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-4">
                        <div class="p-4 rounded bg-light">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <img src="img/best-product-4.jpg" class="img-fluid rounded-circle w-100" alt="">
                                </div>
                                <div class="col-6">
                                    <a href="#" class="h5">apricot</a>
                                    <div class="d-flex my-3">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h4 class="mb-3">190 ₹ /kg</h4>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                        class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-4">
                        <div class="p-4 rounded bg-light">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <img src="img/best-product-5.jpg" class="img-fluid rounded-circle w-100" alt="" />
                                </div>
                                <div class="col-6">
                                    <a href="#" class="h5">Grapes</a>
                                    <div class="d-flex my-3">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h4 class="mb-3">60 ₹ /kg</h4>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                        class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-6 col-xl-4">
                        <div class="p-4 rounded bg-light">
                            <div class="row align-items-center">
                                <div class="col-6">
                                    <img src="img/best-product-6.jpg" class="img-fluid rounded-circle w-100" alt="" />
                                </div>
                                <div class="col-6">
                                    <a href="#" class="h5">Apples</a>
                                    <div class="d-flex my-3">
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star text-primary"></i>
                                        <i class="fas fa-star"></i>
                                    </div>
                                    <h4 class="mb-3">90 ₹ /kg</h4>
                                    <a href="#" class="btn border border-secondary rounded-pill px-3 text-primary"><i
                                        class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart</a>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!-- Bestsaler Product End -->



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
                            <asp:HyperLink ID="HyperLink1" NavigateUrl="~/USprofile.aspx" CssClass="btn-link"
                                runat="server">My Account</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink6" NavigateUrl="~/shop.aspx" CssClass="btn-link" runat="server">Shopping</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink7" NavigateUrl="~/Cart.aspx" CssClass="btn-link" runat="server">Shopping Cart</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink8" NavigateUrl="~/Order.aspx" CssClass="btn-link" runat="server">Order History</asp:HyperLink>
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
