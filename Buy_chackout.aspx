<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Buy_chackout.aspx.cs" EnableEventValidation="false" Inherits="Buy_chackout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fruitables - Vegetable Website</title>
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

                            <asp:ImageButton ID="IMg_Av" Visible="false" CssClass="rounded-circle" PostBackUrl="~/USprofile.aspx" src="img/avatar.jpg"
                                Width="40" Height="35" runat="server" />
                            <asp:Repeater ID="Repeater3" runat="server">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" CssClass="rounded-circle" CausesValidation="false" PostBackUrl="~/USprofile.aspx" runat="server"
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
            <h1 class="text-center text-white display-6">Checkout</h1>
        </div>
        <!-- Single Page Header End -->


        <!-- Checkout Page Start -->
        <div class="container-fluid ">
            <div class="container py-5">
                <h1 class="mb-4">Billing details</h1>
                <form action="#">
                    <div class="row g-5">
                        <div class="col-md-12 col-lg-6 col-xl-7">

                            <div class="form-item">
                                <label class="form-label my-3">Full Name (First and Last name)<sup>*</sup></label>
                                <asp:TextBox ID="txt_name" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_name" ControlToValidate="txt_name" ErrorMessage="Please enter a name."
                                    runat="server" ForeColor="Red" />
                            </div>

                            <div class="form-item">
                                <label class="form-label">Country<sup>*</sup></label>
                                <asp:TextBox ID="txt_country" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_country" ControlToValidate="txt_country" ErrorMessage="Please enter a Country."
                                    runat="server" ForeColor="Red" />
                            </div>

                            <div class="form-item">
                                <label class="form-label">Email <sup>*</sup></label>
                                <asp:TextBox ID="txt_email" TextMode="Email" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_email" ControlToValidate="txt_email" ErrorMessage="Email is required."
                                    runat="server" ForeColor="Red" />
                                <asp:RegularExpressionValidator ID="rev_email" ControlToValidate="txt_email" ErrorMessage="Invalid email address."
                                    ValidationExpression="\w+([-+.'']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" runat="server"
                                    ForeColor="Red" />
                            </div>

                            <div class="form-item">
                                <label class="form-label">Flat, House no., Building, Company, Apartment<sup>*</sup></label>
                                <asp:TextBox ID="txt_street1" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="REq1" ControlToValidate="txt_street1" ErrorMessage="Please enter an address."
                                    runat="server" ForeColor="Red" />
                            </div>

                            <div class="form-item">
                                <label class="form-label">Area, Street, Sector, Village<sup>*</sup></label>
                                <asp:TextBox ID="txt_street2" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="req" ControlToValidate="txt_street2" ErrorMessage="Please enter an address."
                                    runat="server" ForeColor="Red" />
                            </div>

                            <div class="form-item">
                                <label class="form-label">Pin Code<sup>*</sup></label>
                                <asp:TextBox ID="txt_pin" class="form-control" placeholder="6 digits [0-9] Pin Code"
                                    runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_pin" ControlToValidate="txt_pin" ErrorMessage="Please enter a ZIP or postal code."
                                    runat="server" ForeColor="Red" />
                                <asp:RegularExpressionValidator ID="rev_pin" ControlToValidate="txt_pin" ErrorMessage="Invalid Pin Code."
                                    ValidationExpression="^\d{6}$" runat="server" ForeColor="Red" />
                            </div>

                            <div class="form-item">
                                <label class="form-label">Mobile<sup>*</sup></label>
                                <asp:TextBox ID="txt_mobile" TextMode="Number" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_mobile" ControlToValidate="txt_mobile" ErrorMessage="Please enter a phone number so we can call if there are any issues with delivery."
                                    runat="server" ForeColor="Red" />
                                <asp:RegularExpressionValidator ID="rev_mobile" ControlToValidate="txt_mobile" ErrorMessage="Invalid Mobile number."
                                    ValidationExpression="^\d{10}$" runat="server" ForeColor="Red" />
                            </div>

                            <div class="form-item">
                                <label class="form-label">State<sup>*</sup></label>
                                <asp:TextBox ID="txt_state" class="form-control" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="rfv_state" ControlToValidate="txt_state" ErrorMessage="Please enter a state."
                                    runat="server" ForeColor="Red" />
                            </div>
                        </div>

                        <div class="col-md-12 col-lg-6 col-xl-5">
                            <div class="table-responsive">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row"></th>
                                            <td class="py-5"></td>
                                            <td class="py-5"></td>
                                            <td class="py-5">
                                                <p class="mb-0 text-dark py-3">Subtotal</p>
                                            </td>
                                            <td class="py-5">
                                                <div class="py-3 border-bottom border-top">
                                                    <p class="mb-0 text-dark">
                                                        ₹<asp:Label ID="lbl_SubTo" runat="server"></asp:Label>
                                                    </p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <td class="py-5"></td>
                                            <td class="py-5"></td>
                                            <td>
                                                <p class="mb-0 mt-3 text-dark py-4">Shipping</p>
                                            </td>
                                            <td colspan="1" class="py-5">
                                                <div class="form-check">
                                                    <asp:CheckBox ID="chkFreeShipping" Checked="true" runat="server" />
                                                    <asp:Label ID="lblFreeShipping" runat="server" AssociatedControlID="chkFreeShipping"
                                                        Text="Free Shipping" Style="color: #81c408;" />
                                                </div>
                                               
                                            </td>
                                        </tr>
                                        <tr>
                                            <th scope="row"></th>
                                            <td class="py-5"></td>
                                            <td class="py-5"></td>
                                            <td class="py-5">
                                                <p class="mb-0 text-dark text-uppercase py-3">TOTAL</p>
                                            </td>
                                            
                                            <td class="py-5">
                                                <div class="py-3 border-bottom border-top">
                                                    <p class="mb-0 text-dark">
                                                        ₹<asp:Label ID="lbl_Amount" runat="server"></asp:Label>
                                                    </p>
                                                </div>
                                            </td>
                                        </tr>
                                        <tr style="width: 100% !important;">
                                            <td colspan="5" class="py-5 text-end">
                                                <div class="py-1">
                                                    <asp:LinkButton ID="LinkButton1" class="btn border-secondary rounded-pill px-4 py-3 text-primary text-uppercase mb-4"
                                                        runat="server" OnClick="LinkButton1_Click">Submit</asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </tbody>

                                </table>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
        <!-- Checkout Page End -->



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
