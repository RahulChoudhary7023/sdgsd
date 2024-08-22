<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Shop.aspx.cs" Inherits="Shop" %>

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

    <script type="text/javascript">
        function updateTextBox(value) {
            document.getElementById('amount').innerHTML = value;
            document.getElementById('<%= TextBox1.ClientID %>').value = value;
            __doPostBack('<%= TextBox1.ClientID %>', '');
        }
    </script>
    <style>
        .container-fluid {
            padding: 0px !important;
        }

        .navbar {
            border-bottom: none !important;
            box-shadow: none !important;
        }

        .navcolro {
            color: white !important;
        }

        .navfo {
            margin-bottom: 240px;
            font-size: 50px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Navbar start -->
        <div class="container-fluid fixed-top">
            <div class="container px-0">
                <nav class="navbar navbar-dark navbar-expand-xl">
                    <asp:HyperLink ID="HyperLink4" class="navbar-brand ps-5 navcolro" NavigateUrl="~/Home.aspx"
                        runat="server">
                <h1 class="text-primary display-6">Fruitables</h1>
                    </asp:HyperLink>
                    <button class="navbar-toggler py-2 px-3" type="button" data-bs-toggle="collapse"
                        data-bs-target="#navbarCollapse">
                        <span class="fa fa-bars text-primary"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarCollapse" style="height: 70px !important;">
                        <div class="navbar-nav mx-auto">
                            <asp:HyperLink ID="HyperLink2" class="nav-item nav-link navcolro" NavigateUrl="~/Home.aspx"
                                runat="server">Home</asp:HyperLink>
                            <asp:LinkButton ID="LinkButton2" class="nav-item nav-link navcolro" runat="server"
                                OnClick="shop_Click">Shop</asp:LinkButton>
                            <div class="nav-item dropdown">
                                <a href="#" class="nav-link navcolro dropdown-toggle" data-bs-toggle="dropdown">Pages</a>
                                <div class="dropdown-menu m-0 bg-secondary rounded-0">
                                    <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Cart.aspx" class="dropdown-item" runat="server">Cart</asp:HyperLink>
                                    <asp:HyperLink ID="Hyper_order" Visible="false" NavigateUrl="~/Order.aspx" class="dropdown-item"
                                        runat="server">Order</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink13" NavigateUrl="~/About.aspx" class="dropdown-item"
                                        runat="server">About</asp:HyperLink>
                                </div>
                            </div>
                            <asp:HyperLink ID="HyperLink3" NavigateUrl="~/Contact.aspx" class="nav-item nav-link navcolro"
                                runat="server">Contact</asp:HyperLink>
                        </div>
                        <div class="d-flex m-3 me-0 pe-5 align-items-center">
                            <button class="btn-search btn border border-secondary btn-md-square rounded-circle bg-white me-4">
                                <i class="fas fa-search text-primary"></i>
                            </button>
                            <input type="text" class="form-control d-none me-2" id="searchInput" placeholder="Search..." />
                            <asp:HyperLink ID="HyperLink5" class="position-relative me-4 my-auto navcolro" NavigateUrl="~/Sign_in.aspx"
                                runat="server">
                        <i class="fa fa-power-off custom-icon-size" aria-hidden="true"></i>
                            </asp:HyperLink>
                            <asp:HyperLink ID="Pro_HY" class="my-auto navcolro" Visible="false" runat="server">
                        <i class="fas fa-user fa-2x"></i>
                            </asp:HyperLink>
                            <asp:Image ID="IMg_Av" Visible="false" src="img/avatar.jpg" PostBackUrl="~/USprofile.aspx"
                                CssClass="rounded-circle" Width="40" Height="35" runat="server" />
                            <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" PostBackUrl="~/USprofile.aspx" CssClass="rounded-circle"
                                        Width="40" Height="35" ImageUrl='<%# Eval("photo") %>' runat="server" />
                                    <asp:Image ID="Image2" runat="server" />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->

        <!-- Single Page Header start -->
        <div class="container-fluid">
            <div id="carouselExampleDark" class="carousel carousel-dark slide" data-bs-ride="carousel">
                <div class="carousel-indicators">
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="0"
                        class="active" aria-current="true" aria-label="Slide 1">
                    </button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="1"
                        aria-label="Slide 2">
                    </button>
                    <button type="button" data-bs-target="#carouselExampleDark" data-bs-slide-to="2"
                        aria-label="Slide 3">
                    </button>
                </div>
                <div class="carousel-inner">
                    <div class="carousel-item active" data-bs-interval="10000">
                        <img src="img/banner.jpg" class="d-block w-100" height="570" alt="..." />
                        <div class="carousel-caption d-none d-md-block navcolro">
                            <p class="mb-2">
                                Fresh Veggies Nourishing Hearts Lucky Draw: You can Make a Difference
                            </p>
                            <h5 class="navcolro navfo">You Can Make a Difference</h5>
                        </div>
                    </div>
                    <div class="carousel-item " data-bs-interval="2000">
                        <img src="img/Fresh-ezgif.com-webp-to-jpg-converter.jpg" height="570" class="d-block w-100"
                            alt="..." />
                        <div class="carousel-caption d-none d-md-block navcolro">
                            <p class="mb-2">The latest additions to our Fresh Veggies family</p>
                            <h5 class="navcolro navfo">Organic Herbs!</h5>
                        </div>
                    </div>
                    <div class="carousel-item">
                        <img src="img/cebc-4b73-8230-ezgif.com-webp-to-jpg-converter.jpg" class="d-block w-100"
                            height="570" alt="..." />
                        <div class="carousel-caption d-none d-md-block navcolro">
                            <p class="mb-2">SAVE PRECIOUS TIME AND CREATE UNFORGETTABLE MOMENTS</p>
                            <h5 class="navcolro navfo">Stay Home, Stay Safe, Stay Happy</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Single Page Header End -->




        <!-- Fruits Shop Start-->
        <div class="container-fluid fruite pt-0">
            <div class="container pt-4">
                <h1 class="mb-4">Fresh fruits shop</h1>
                <div class="row g-4">
                    <div class="col-lg-12">
                        <div class="row g-4">
                            <div class="col-xl-3">
                                <div class="input-group w-100 mx-auto d-flex mb-2">
                                    <asp:TextBox ID="txt_search" CssClass="form-control p-3" placeholder="keywords" OnTextChanged="Search_Click"
                                        runat="server"></asp:TextBox>
                                    <span id="search-icon-1" class="input-group-text p-3"><i class="fa fa-search"></i>
                                    </span>
                                </div>
                            </div>
                            <div class="col-6"></div>
                        </div>
                        <div class="row g-4">
                            <div class="col-lg-3">
                                <div class="row g-4">
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4>Categories</h4>
                                            <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional">
                                                <ContentTemplate>
                                                    <ul class="list-unstyled fruite-categorie">
                                                        <asp:Repeater ID="Repeater3" runat="server" OnItemCommand="Repeater3_ItemCommand">
                                                            <ItemTemplate>
                                                                <li>
                                                                    <div class="d-flex justify-content-between fruite-name">
                                                                        <asp:LinkButton ID="LinkButton4" CommandName="product" CommandArgument='<%# Eval("CAid") %>'
                                                                            runat="server" Text='<%# Eval("CAname") %>'></asp:LinkButton>
                                                                        <span>(<%# Eval("ItemCount") %>)</span>
                                                                    </div>
                                                                </li>
                                                            </ItemTemplate>
                                                        </asp:Repeater>
                                                    </ul>
                                                </ContentTemplate>
                                            </asp:UpdatePanel>
                                        </div>

                                    </div>
                                    <div class="col-lg-12">
                                        <div class="mb-3">
                                            <h4 class="mb-2">Price</h4>
                                            <input type="range" class="form-range w-100" min="0" max="500" value="0" oninput="updateTextBox(this.value)"
                                                id="rangeInput" />
                                            <output id="amount" name="amount">0</output>


                                        </div>
                                    </div>

                                    <div class="col-lg-12">
                                        <h4 class="mb-3">Featured products</h4>
                                        <div class="d-flex align-items-center justify-content-start">
                                            <div class="rounded me-4" style="width: 100px; height: 100px;">
                                                <img src="img/featur-1.jpg" class="img-fluid rounded" alt="" />
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
                                            <div class="rounded me-4" style="width: 100px; height: 100px;">
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




                            <div class="col-lg-9">
                                <div class="row g-4 justify-content-center">

                                    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Conditional">
                                        <ContentTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged" AutoPostBack="true"
                                                CssClass="d-none"></asp:TextBox>

                                            <div class="row">
                                                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                                                    <ItemTemplate>
                                                        <div class="col-12 col-sm-6 col-md-4 mb-4">
                                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Productid">
                                                                <asp:Label ID="lbl_PRid" runat="server" Visible="false" Text='<%# Eval("PRid") %>'></asp:Label>
                                                                <div class="rounded position-relative fruite-item border rounded-bottom">
                                                                    <div class="fruite-img">
                                                                        <asp:Image ID="Image1" runat="server" class="img-fluid w-100 rounded-top" Width="200px"
                                                                            Height="220px" ImageUrl='<%# Eval("photo") %>' />
                                                                    </div>
                                                                    <div class="text-white bg-secondary px-3 py-1 rounded position-absolute" style="top: 10px;
                                                                        left: 10px;">
                                                                        <span>
                                                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("disc") %>'></asp:Label>
                                                                            % off
                                                                        </span>
                                                                    </div>
                                                                    <div class="p-2">
                                                                        <asp:Label ID="lbl_CAid" runat="server" Visible="false" Text='<%# Eval("CAid") %>'></asp:Label>
                                                                        <asp:Label ID="lbl_Pric" Visible="false" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                                                        <h5>
                                                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                                                            <asp:Label ID="Label7" runat="server" Text='<%#"("+ Eval("PRweight") +"gm)"%>'></asp:Label>
                                                                        </h5>
                                                                        <p class="text-dark mb-0">
                                                                            <asp:Label ID="Label2" runat="server" Font-Size="14px" Text='<%# TruncateDescription(Eval("description").ToString(),9) %>'></asp:Label>
                                                                        </p>
                                                                        <div class="d-flex justify-content-between flex-lg-wrap">
                                                                            <p class="text-dark mb-0 p-0">
                                                                                <asp:Label ID="Label3" Font-Size="27px" runat="server" Text='<%#"₹"+ Eval("price") %>'></asp:Label>
                                                                            </p>
                                                                            <p class="text-dark ">

                                                                                <asp:Label ID="Label5" runat="server" Text='<%#"(₹"+ Eval("Rate") %>'></asp:Label>

                                                                                <asp:Label ID="Label8" runat="server" Text=" /100 g) M.R.P:"></asp:Label>
                                                                                <asp:Label ID="Label6" CssClass="Fontline" runat="server" Text='<%#"₹"+ Eval("MRP") %>'></asp:Label>
                                                                            </p>
                                                                            <asp:LinkButton ID="LinkButton3" runat="server" CommandName="AddCART" class="btn border border-secondary rounded-pill px-3 text-primary">
                                                                      <i class="fa fa-shopping-bag me-2 text-primary"></i>Add to cart
                                                                            </asp:LinkButton>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </asp:LinkButton>
                                                        </div>
                                                    </ItemTemplate>
                                                </asp:Repeater>
                                            </div>
                                        </ContentTemplate>
                                        <Triggers>
                                            <asp:AsyncPostBackTrigger ControlID="TextBox1" EventName="TextChanged" />
                                        </Triggers>
                                    </asp:UpdatePanel>

                                    <div class="col-12">
                                        <div class="pagination d-flex justify-content-center mt-5">
                                            <asp:LinkButton ID="PreviousPage" runat="server" Text="&laquo;" OnClick="PreviousPage_Click"
                                                CssClass="page-link rounded" />
                                            <asp:Repeater ID="RepeaterPages" runat="server" OnItemCommand="RepeaterPages_ItemCommand">
                                                <ItemTemplate>
                                                    <asp:LinkButton ID="LinkButtonPage" CommandName="PageNumber" CommandArgument='<%# Container.DataItem %>'
                                                        Text='<%# Container.DataItem %>' runat="server" CssClass="page-link rounded" />
                                                </ItemTemplate>
                                            </asp:Repeater>
                                            <asp:LinkButton ID="NextPage" runat="server" Text="&raquo;" OnClick="NextPage_Click"
                                                CssClass="page-link rounded" />
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- Fruits Shop End-->


        <!-- Footer Start -->
        <div class="container-fluid bg-dark text-white-50 footer pt-5 mt-5">
            <div class="container py-5">
                <div class="pb-4 mb-4" style="border-bottom: 1px solid rgba(226, 175, 24, 0.5);">
                    <div class="row g-4">
                        <div class="col-lg-3">
                            <a href="#">
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
                            <asp:HyperLink ID="HyperLink6" NavigateUrl="~/USprofile.aspx" CssClass="btn-link"
                                runat="server">My Account</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink7" NavigateUrl="~/shop.aspx" CssClass="btn-link" runat="server">Shopping</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink8" NavigateUrl="~/Cart.aspx" CssClass="btn-link" runat="server">Shopping Cart</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink11" NavigateUrl="~/Order.aspx" CssClass="btn-link" runat="server">Order History</asp:HyperLink>
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
