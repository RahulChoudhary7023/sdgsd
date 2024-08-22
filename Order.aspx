<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Order.aspx.cs" Inherits="Order" %>

<!DOCTYPE html>

<html lang="en">

<head>
    <meta charset="utf-8">
    <title>Fruitables - Order Status</title>
    <meta content="width=device-width, initial-scale=1.0" name="viewport">
    <meta content="" name="keywords">
    <meta content="" name="description">

    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
        rel="stylesheet">

    <link href="lib/lightbox/css/lightbox.min.css" rel="stylesheet">
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/styl.css" rel="stylesheet">
</head>

<body>
    <form id="form1" runat="server">
        <!-- Spinner Start -->
        <div id="spinner" class="show w-100 vh-100 position-fixed translate-middle top-50 start-50  d-flex align-items-center justify-content-center">
            <div class="spinner-grow text-primary" role="status"></div>
        </div>
        <!-- Spinner End -->


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
                                    <asp:HyperLink ID="HyperLink3" NavigateUrl="~/Cart.aspx" class="dropdown-item" runat="server">Cart</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink5" NavigateUrl="~/Order.aspx" class="dropdown-item" runat="server">Order</asp:HyperLink>
                                    <asp:HyperLink ID="HyperLink6" NavigateUrl="~/About.aspx" class="dropdown-item" runat="server">About</asp:HyperLink>
                                </div>
                            </div>
                            <asp:HyperLink ID="HyperLink13" runat="server" NavigateUrl="~/Contact.aspx" class="nav-item nav-link">Contact</asp:HyperLink>
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
                            <asp:Repeater ID="Repeater3" runat="server">
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


        <!-- Order Status Start -->
        <div class="container-fluid py-5" style="padding-top: 5rem !important;">
            <div class="container">
                <h1 class="text-center text-dark display-6 mb-5">Order Status</h1>
                <div class="mb-3">
                    <label for="orderStatusFilter" class="form-label">Filter by Status:</label>
                    <asp:DropDownList ID="DropStatusID" class="form-select" runat="server"
                        OnSelectedIndexChanged="DropStatusID_SelectedIndexChanged" AutoPostBack="true">
                        <asp:ListItem Value="0">Pending</asp:ListItem>
                        <asp:ListItem Value="1">InTransit</asp:ListItem>
                        <asp:ListItem Value="2">Cancelled</asp:ListItem>
                        <asp:ListItem Value="3">Completed</asp:ListItem>
                    </asp:DropDownList>
                </div>

                <div class="table-responsive">
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>Order ID</th>
                                <th>Order Date</th>
                                <th>Name</th>
                                <th>Address</th>
                                <th>Tax </th>
                                <th>Total</th>
                                <th>Order</th>
                                <th>View</th>
                            </tr>
                        </thead>
                        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand">
                            <ItemTemplate>
                                <tbody id="orderTableBody">
                                    <tr>
                                        <td>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("OMid") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label3" runat="server" Text='<%# Eval("OrderDate") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label4" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label5" runat="server" Text='<%# Eval("StreetAdd1") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label7" runat="server" Text='<%# Eval("Tax") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label8" runat="server" Text='<%# Eval("Amount") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:Label ID="Label6" runat="server" Text='<%# Eval("status1") %>'></asp:Label>
                                        </td>
                                        <td>
                                            <asp:LinkButton ID="LinkButton1" CommandName="Details" runat="server">Details</asp:LinkButton>
                                        </td>
                                        <asp:Label ID="lbl_omid" Visible="false" runat="server" Text='<%# Eval("OMid") %>'></asp:Label>
                                    </tr>
                                </tbody>
                            </ItemTemplate>
                        </asp:Repeater>

                    </table>



                </div>
            </div>
        </div>
        <!-- Order Status End -->

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
