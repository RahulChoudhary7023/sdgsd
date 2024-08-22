<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Buynow.aspx.cs" Inherits="Buynow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fruitables - Vegetable Website Template</title>

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

        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
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
                                        <asp:HyperLink ID="HyperLink13" NavigateUrl="~/Order.aspx" class="dropdown-item"
                                            runat="server">Order</asp:HyperLink>
                                        <asp:HyperLink ID="HyperLink14" NavigateUrl="~/About.aspx" class="dropdown-item"
                                            runat="server">About</asp:HyperLink>
                                    </div>
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
                                    <asp:ImageButton ID="ImageButton1" CssClass="rounded-circle" CausesValidation="false"
                                        PostBackUrl="~/USprofile.aspx"
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

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                    <ItemTemplate>
                        <div class="container-fluid testimonial mt-5 py-5">
                            <div class="container">
                                <div class="row">
                                    <div class="col-md-7 product-details">
                                        <h4>Product Details</h4>
                                        <div class="d-flex pro">
                                            <div class="ps-3 w-40">
                                                <asp:Image ID="Image2" runat="server" Width="200px" Height="140px" alt="Product Image"
                                                    ImageUrl='<%# Eval("Photo") %>' />
                                            </div>
                                            <div class="ps-3 w-50">
                                                <div class="d-flex justify-content-between align-items-center">
                                                    <asp:Label ID="Label3" runat="server" Text="Name:">
                                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                                    </asp:Label>
                                                    <div>
                                                        <asp:LinkButton ID="LinkButton1" class="text-danger" PostBackUrl="~/Shop.aspx" runat="server"><i class="fas fa-trash-alt"></i></asp:LinkButton>
                                                    </div>
                                                </div>
                                                <p>
                                                    Price: ₹
                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                                    <span class="text-muted"><del>₹187</del></span>
                                                    <asp:Label ID="Label5" runat="server" Text='<%# Eval("disc") %>'></asp:Label>
                                                    %Off
                                                </p>
                                                <p>Brand: Fresh</p>
                                                <div class="d-flex align-items-center">
                                                    <asp:Label ID="Label6" runat="server">Qty:</asp:Label>
                                                    <asp:DropDownList ID="ddlQuantity" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlQuantity_SelectedIndexChanged">
                                                        <asp:ListItem Value="0" Selected="True">0</asp:ListItem>
                                                        <asp:ListItem Value="1">1</asp:ListItem>
                                                        <asp:ListItem Value="2">2</asp:ListItem>
                                                        <asp:ListItem Value="3">3</asp:ListItem>
                                                        <asp:ListItem Value="4">4</asp:ListItem>
                                                        <asp:ListItem Value="5">5</asp:ListItem>
                                                        <asp:ListItem Value="6">6</asp:ListItem>
                                                        <asp:ListItem Value="7">7</asp:ListItem>
                                                        <asp:ListItem Value="8">8</asp:ListItem>
                                                        <asp:ListItem Value="9">9</asp:ListItem>
                                                        <asp:ListItem Value="10">10</asp:ListItem>
                                                    </asp:DropDownList>
                                                    <asp:RequiredFieldValidator
                                                        ID="rfvQuantity"
                                                        runat="server"
                                                        ControlToValidate="ddlQuantity"
                                                        InitialValue="0"
                                                        ErrorMessage="select a quantity"
                                                        ForeColor="Red" />
                                                    <br />
                                                </div>
                                                <p>Size: 500gm</p>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-4 price-details">
                                        <h4>Price Details (1 Item)</h4>
                                        <div class="price-box">
                                            <p>
                                                Order Total: ₹
                            <asp:Label ID="lbl_price" Visible="false" runat="server" Text='<%# Eval("price") %>'></asp:Label>
                                                <asp:Label ID="lblTotal" runat="server"></asp:Label>
                                            </p>
                                            <p class="text-success mb-4">Yay! Your total discount is ₹37</p>
                                            <asp:LinkButton ID="LinkButton2" runat="server" CommandName="chackout" Width="100%"
                                                Font-Bold="false" class="btn btn-primary border-0 border-secondary py-3 text-white">Chackout</asp:LinkButton>
                                            <p class="mt-3 text-muted text-center">
                                                Clicking on 'Continue' will not deduct any money
                                            </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </ItemTemplate>

                </asp:Repeater>
            </ContentTemplate>
        </asp:UpdatePanel>


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


    <!-- Add Font Awesome -->

    <!-- Add JavaScript for increment and decrement -->

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
