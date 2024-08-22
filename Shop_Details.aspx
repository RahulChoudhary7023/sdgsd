<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Shop_Details.aspx.cs"
    Inherits="Shop_Details" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Shop Details</title>

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

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 bg-white position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->

        <!-- Navbar start -->
        <div class="container-fluid fixed-top">

            <div class="container px-0">
                <nav class="navbar navbar-light bg-white navbar-expand-xl" style="height: 70px !important">
                    <asp:HyperLink ID="HyperLink4" class="navbar-brand ps-5" NavigateUrl="~/Home.aspx"
                        runat="server">
                        <h1 class="text-primary display-6">Fruitables</h1>
                    </asp:HyperLink>

                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>

                    <div class="collapse navbar-collapse bg-white" id="navbarCollapse" style="height: 70px !important">
                        <div class="navbar-nav mx-auto">
                            <asp:HyperLink ID="HyperLink2" class="nav-item nav-link" NavigateUrl="~/Home.aspx"
                                runat="server">Home</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink1" class="nav-item nav-link" NavigateUrl="~/Shop.aspx"
                                runat="server">Shop</asp:HyperLink>

                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <asp:HyperLink ID="HyperLink3" NavigateUrl="~/Cart.aspx" class="dropdown-item" runat="server">Cart</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink13" NavigateUrl="~/Order.aspx" class="dropdown-item"
                                        runat="server">Order</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink14" NavigateUrl="~/About.aspx" class="dropdown-item"
                                        runat="server">About</asp:HyperLink>
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

                            <asp:ImageButton ID="IMg_Av" Visible="false" CssClass="rounded-circle" PostBackUrl="~/USprofile.aspx"
                                src="img/avatar.jpg"
                                Width="40" Height="35" runat="server" />

                            <asp:Repeater ID="Repeater3" runat="server">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" CssClass="rounded-circle" PostBackUrl="~/USprofile.aspx"
                                        runat="server"
                                        Width="40" Height="35" ImageUrl='<%# Eval("photo") %>' />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <!-- Single Page Header start -->
        <div class="container-fluid page-header py-5">
            <h1 class="text-center text-white display-6">Shop Detail</h1>
        </div>
        <!-- Single Page Header End -->


        <!-- Single Product Start -->
        <div class="container-fluid py-5 mt-5">
            <div class="container py-5">
                <div class="row g-4 mb-5">
                    <div class="col-lg-8 col-xl-9">
                        <div class="row g-4">
                            <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                <ItemTemplate>
                                    <div class="row mb-4">
                                        <!-- Container for three small images -->
                                        <div class="col-lg-1">
                                            <div class="d-flex flex-column align-items-start">
                                                <asp:ImageButton ID="ImageButton3" CssClass="thumbnail mb-2" runat="server" ImageUrl='<%# Eval("photo") %>'
                                                    OnClientClick="return false;" />
                                                <asp:ImageButton ID="ImageButton4" CssClass="thumbnail mb-2" runat="server" ImageUrl='<%# Eval("Picture1") %>'
                                                    OnClientClick="return false;" />
                                                <asp:ImageButton ID="ImageButton5" CssClass="thumbnail" runat="server" ImageUrl='<%# Eval("Picture2") %>'
                                                    OnClientClick="return false;" />
                                            </div>
                                        </div>

                                        <!-- Main Image Button -->
                                        <div class="col-lg-5">
                                            <div class=" rounded mb-4">
                                                <asp:ImageButton ID="ImageButton2" runat="server" Height="370" Width="100%" CssClass="img-fluid rounded product-main-image"
                                                    alt="Image" ImageUrl='<%# Eval("photo") %>' OnClientClick="return false;" />
                                            </div>
                                            <asp:LinkButton ID="LinkButton2" CommandName="Buy" runat="server" Font-Bold="true"
                                                class="btn btn-success border px-4 py-2 mb-4 text-primary">
                                        <i class="fa fa-buy-bag me-2 text-primary"></i> Buy now
                                            </asp:LinkButton>

                                            <asp:LinkButton ID="LinkButton1" CommandName="Cart" runat="server" class="btn border px-4 py-2 mb-4 text-primary">
                                        <i class="fa fa-shopping-bag me-2 text-primary"></i> Add to cart
                                            </asp:LinkButton>
                                        </div>

                                        <div class="col-lg-6">
                                            <h4 class="fw-bold mb-3">
                                                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                            </h4>
                                            <p class="mb-3">Category: Vegetables</p>
                                            <h5 class="fw-bold mb-3">
                                                <asp:Label ID="Label2" runat="server" Text='<%#"₹"+ Eval("price") %>'></asp:Label>
                                            </h5>
                                            <div class="d-flex mb-4">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <p class="mb-4">
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("description") %>'></asp:Label>
                                            </p>
                                            <p class="mb-4">
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("Des") %>'></asp:Label>
                                            </p>

                                            <asp:Label ID="lbl__CAid" runat="server" Visible="false" Text='<%# Eval("CAid") %>'></asp:Label>
                                            <asp:Label ID="lbl_PRid" runat="server" Visible="false" Text='<%# Eval("PRid") %>'></asp:Label>
                                            <asp:Label ID="lbl_Price" runat="server" Visible="false" Text='<%# Eval("price") %>'></asp:Label>

                                            <div class="overlay" style="display: none; position: fixed; top: 0; left: 0; width: 100%;
                                                height: 100%; background: black; opacity: 0.8; z-index: 1000;">
                                            </div>
                                            <div class="slider" style="display: none; position: fixed; top: 50%; left: 50%; transform: translate(-50%, -50%);
                                                z-index: 1001;">
                                                <img src="img/banner-fruits.jpg" class="slider-image" style="width: 100%; max-width: 800px;
                                                    max-height: 90vh; display: block;" />
                                                <button class="slider-close" style="position: absolute; top: 10px; right: 10px; background: none;
                                                    border: none; color: white; font-size: 24px;">
                                                    &times;
                                                </button>
                                            </div>

                                            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                        </div>

                                    </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>

                            <div class="col-lg-12">
                                <nav>
                                    <div class="nav nav-tabs mb-3">
                                        <button class="nav-link active border-white border-bottom-0" type="button" role="tab"
                                            id="nav-about-tab" data-bs-toggle="tab" data-bs-target="#nav-about"
                                            aria-controls="nav-about" aria-selected="true">
                                            Description</button>
                                        <button class="nav-link border-white border-bottom-0" type="button" role="tab"
                                            id="nav-mission-tab" data-bs-toggle="tab" data-bs-target="#nav-mission"
                                            aria-controls="nav-mission" aria-selected="false">
                                            Reviews</button>
                                    </div>
                                </nav>
                                <div class="tab-content mb-5">
                                    <div class="tab-pane active" id="nav-about" role="tabpanel" aria-labelledby="nav-about-tab">
                                        <p>
                                            The generated Lorem Ipsum is therefore always free from repetition injected humour,
                                            or non-characteristic words etc. 
                                    Susp endisse ultricies nisi vel quam suscipit
                                        </p>
                                        <p>
                                            Sabertooth peacock flounder; chain pickerel hatchetfish, pencilfish snailfish filefish
                                            Antarctic 
                                    icefish goldeye aholehole trumpetfish pilot fish airbreathing catfish, electric ray sweeper.
                                        </p>
                                        <div class="px-2">
                                            <asp:Repeater ID="Repeater2" runat="server">
                                                <ItemTemplate>
                                                    <div class="row g-4">
                                                        <div class="col-6">
                                                            <div class="row bg-light align-items-center text-center justify-content-center py-2">
                                                                <div class="col-6">
                                                                    <p class="mb-0">Weight</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <p class="mb-0"><asp:Label ID="Label7" runat="server" Text='<%# Eval("PRweight") %>'></asp:Label>gm</p>
                                                                </div>
                                                            </div>
                                                            <div class="row text-center align-items-center justify-content-center py-2">
                                                                <div class="col-6">
                                                                    <p class="mb-0">Country of Origin</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <p class="mb-0">
                                                                        <asp:Label ID="Label5" runat="server" Text='<%# Eval("Country") %>'></asp:Label>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                                <div class="col-6">
                                                                    <p class="mb-0">Quality</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <p class="mb-0">
                                                                        <asp:Label ID="Label6" runat="server" Text='<%# Eval("CAname") %>'></asp:Label>
                                                                    </p>
                                                                </div>
                                                            </div>
                                                            <div class="row text-center align-items-center justify-content-center py-2">
                                                                <div class="col-6">
                                                                    <p class="mb-0">Check</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <p class="mb-0">Healthy</p>
                                                                </div>
                                                            </div>
                                                            <div class="row bg-light text-center align-items-center justify-content-center py-2">
                                                                <div class="col-6">
                                                                    <p class="mb-0">Min Weight</p>
                                                                </div>
                                                                <div class="col-6">
                                                                    <p class="mb-0">250 Kg</p>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </ItemTemplate>
                                            </asp:Repeater>
                                        </div>
                                    </div>
                                    <div class="tab-pane" id="nav-mission" role="tabpanel" aria-labelledby="nav-mission-tab">
                                        <div class="d-flex mb-3">
                                            <img src="img/avatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px;
                                                height: 100px;"
                                                alt="" />
                                            <div class="">
                                                <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                                                <div class="d-flex justify-content-between">
                                                    <h5>Jason Smith</h5>
                                                    <div class="d-flex mb-3">
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                </div>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut lectus dapibus,
                                                    venenatis felis at, hendrerit risus. Aliquam erat volutpat. In convallis orci sit
                                                    amet magna vehicula, vel faucibus orci luctus.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="d-flex mb-3">
                                            <img src="img/avatar.jpg" class="img-fluid rounded-circle p-3" style="width: 100px;
                                                height: 100px;"
                                                alt="" />
                                            <div class="">
                                                <p class="mb-2" style="font-size: 14px;">April 12, 2024</p>
                                                <div class="d-flex justify-content-between">
                                                    <h5>Jason Smith</h5>
                                                    <div class="d-flex mb-3">
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star text-secondary"></i>
                                                        <i class="fa fa-star"></i>
                                                    </div>
                                                </div>
                                                <p>
                                                    Lorem ipsum dolor sit amet, consectetur adipiscing elit. Phasellus ut lectus dapibus,
                                                    venenatis felis at, hendrerit risus. Aliquam erat volutpat. In convallis orci sit
                                                    amet magna vehicula, vel faucibus orci luctus.
                                                </p>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>

                        </div>
                        <div class="col-lg-4 col-xl-3">
                            <div class="row g-4 fruite">
                                <div class="col-lg-12">
                                    <div class="input-group w-100 mx-auto d-flex mb-4">
                                        <input type="search" class="form-control p-3" placeholder="keywords" aria-describedby="search-icon-1" />
                                        <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i>
                                        </span>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <h4 class="mb-4">Featured products</h4>
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rounded" style="width: 100px; height: 100px;">
                                            <img src="img/featur-1.jpg" class="img-fluid rounded" alt="Image" />
                                        </div>
                                        <div>
                                            <h6 class="mb-2">Big Banana</h6>
                                            <div class="d-flex mb-2">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="d-flex mb-2">
                                                <h5 class="fw-bold me-2">2.99 $</h5>
                                                <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rounded" style="width: 100px; height: 100px;">
                                            <img src="img/featur-2.jpg" class="img-fluid rounded" alt="" />
                                        </div>
                                        <div>
                                            <h6 class="mb-2">Big Banana</h6>
                                            <div class="d-flex mb-2">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="d-flex mb-2">
                                                <h5 class="fw-bold me-2">2.99 $</h5>
                                                <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rounded" style="width: 100px; height: 100px;">
                                            <img src="img/featur-3.jpg" class="img-fluid rounded" alt="" />
                                        </div>
                                        <div>
                                            <h6 class="mb-2">Big Banana</h6>
                                            <div class="d-flex mb-2">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="d-flex mb-2">
                                                <h5 class="fw-bold me-2">2.99 $</h5>
                                                <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rounded me-4" style="width: 100px; height: 100px;">
                                            <img src="img/vegetable-item-4.jpg" class="img-fluid rounded" alt="" />
                                        </div>
                                        <div>
                                            <h6 class="mb-2">Big Banana</h6>
                                            <div class="d-flex mb-2">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="d-flex mb-2">
                                                <h5 class="fw-bold me-2">2.99 $</h5>
                                                <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rounded me-4" style="width: 100px; height: 100px;">
                                            <img src="img/vegetable-item-5.jpg" class="img-fluid rounded" alt="" />
                                        </div>
                                        <div>
                                            <h6 class="mb-2">Big Banana</h6>
                                            <div class="d-flex mb-2">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="d-flex mb-2">
                                                <h5 class="fw-bold me-2">2.99 $</h5>
                                                <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex align-items-center justify-content-start">
                                        <div class="rounded me-4" style="width: 100px; height: 100px;">
                                            <img src="img/vegetable-item-6.jpg" class="img-fluid rounded" alt="" />
                                        </div>
                                        <div>
                                            <h6 class="mb-2">Big Banana</h6>
                                            <div class="d-flex mb-2">
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star text-secondary"></i>
                                                <i class="fa fa-star"></i>
                                            </div>
                                            <div class="d-flex mb-2">
                                                <h5 class="fw-bold me-2">2.99 $</h5>
                                                <h5 class="text-danger text-decoration-line-through">4.11 $</h5>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="d-flex justify-content-center my-4">
                                        <a href="#" class="btn border border-secondary px-4 py-3 rounded-pill text-primary w-100">
                                            Vew More</a>
                                    </div>
                                </div>
                                <div class="col-lg-12">
                                    <div class="position-relative">
                                        <img src="img/banner-fruits.jpg" class="img-fluid w-100 rounded" alt="" />
                                        <div class="position-absolute" style="top: 50%; right: 10px; transform: translateY(-50%);">
                                            <h3 class="text-secondary fw-bold">Fresh
                                                <br />
                                                Fruits
                                                <br />
                                                Banner</h3>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Single Product End -->


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


            <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
            <script>
                $(document).ready(function () {
                    $('.thumbnail').on('mouseover', function () {
                        var imgSrc = $(this).attr('src');
                        $('.product-main-image').attr('src', imgSrc);
                    });

                    $('.product-main-image').on('click', function () {
                        var imgSrc = $(this).attr('src');
                        $('.slider-image').attr('src', imgSrc);
                        $('.overlay, .slider').fadeIn();
                    });

                    $('.slider-close, .overlay').on('click', function () {
                        $('.overlay, .slider').fadeOut();
                    });
                });
            </script>
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
