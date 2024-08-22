<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="USprofile.aspx.cs"
    Inherits="USprofile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fruitables - User Profile</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.4/css/all.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css"
        rel="stylesheet" />

    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet" />
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/styl.css" rel="stylesheet" />

</head>

<body>
    <form id="form2" runat="server">
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
                                        <asp:HyperLink ID="HyperLink7" NavigateUrl="~/Order.aspx" class="dropdown-item" runat="server">Order</asp:HyperLink>
                                        <asp:HyperLink ID="HyperLink11" NavigateUrl="~/About.aspx" class="dropdown-item"
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
                            <asp:ImageButton ID="IMG_AV" Visible="false" PostBackUrl="~/USprofile.aspx" src="img/avatar.jpg"
                                Width="40" Height="35" CssClass="rounded-circle" runat="server" />
                            <asp:Repeater ID="Repeater3" runat="server">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" PostBackUrl="~/UserProfile.aspx" runat="server"
                                        Width="45" Height="40" CssClass="rounded-circle" ImageUrl='<%# Eval("photo") %>' />
                                </ItemTemplate>
                            </asp:Repeater>
                        </div>
                    </div>
                </nav>
            </div>
        </div>
        <!-- Navbar End -->


        <div class="container-fluid py-5 about">
            <div class="container">
                <h1 class="text-center text-dark display-6 mb-5">Your Profile
                    <asp:Label ID="lbl_error" runat="server"></asp:Label>
                </h1>
                <div class="row">
                    <div class="col-lg-4 mb-4">
                        <div class="card p-4">
                            <h5 class="text-primary mb-4 text-center">Profile Information</h5>
                            <div class="text-center mb-4">
                                <asp:ImageButton ID="IMG_USav" class="img-fluid rounded-circle mb-3" Visible="false"
                                    src="img/avatar.jpg"
                                    Width="150px" Height="150px" runat="server" />
                                <asp:Repeater ID="Repeater2" runat="server">
                                    <ItemTemplate>
                                        <asp:Image ID="Image1" runat="server" alt="Profile Picture" class="img-fluid rounded-circle mb-3"
                                            Width="150px" Height="150px" autopostback="true" ImageUrl='<%# Eval("photo") %>' />
                                    </ItemTemplate>
                                </asp:Repeater>

                                <h5 class="text-dark text-center justify-content-center">
                                    <asp:Label ID="lbl_name" runat="server"></asp:Label>
                                </h5>
                                <div class="d-flex justify-content-center mb-3">
                                    <a href="https://www.instagram.com" class="btn btn-outline-secondary me-2 btn-md-square rounded-circle">
                                        <i class="fab fa-instagram"></i></a>
                                    <a href="https://www.linkedin.com" class="btn btn-outline-secondary me-2 btn-md-square rounded-circle">
                                        <i class="fab fa-linkedin"></i></a>
                                    <a href="https://www.facebook.com" class="btn btn-outline-secondary me-2 btn-md-square rounded-circle">
                                        <i class="fab fa-facebook-f"></i></a>
                                    <a href="https://www.telegram.org" class="btn btn-outline-secondary me-2 btn-md-square rounded-circle">
                                        <i class="fab fa-telegram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-lg-8">
                        <ul class="nav nav-tabs mb-4" id="myTab" role="tablist">
                            <li class="nav-item" role="presentation">
                                <button class="nav-link active" id="profile-details-tab" data-bs-toggle="tab" data-bs-target="#profile-details"
                                    type="button" role="tab" aria-controls="profile-details" aria-selected="true">
                                    Personal
                                    Details</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="edit-profile-tab" data-bs-toggle="tab" data-bs-target="#edit-profile"
                                    type="button" role="tab" aria-controls="edit-profile" aria-selected="false">
                                    Edit
                                    Profile</button>
                            </li>
                            <li class="nav-item" role="presentation">
                                <button class="nav-link" id="change-password-tab" data-bs-toggle="tab" data-bs-target="#change-password"
                                    type="button" role="tab" aria-controls="change-password" aria-selected="false">
                                    Change
                                    Password</button>
                            </li>
                        </ul>

                        <div class="tab-content" id="myTabContent">
                            <asp:Repeater ID="Repeater1" runat="server">
                                <ItemTemplate>
                                    <div class="tab-pane fade show active" id="profile-details" role="tabpanel" aria-labelledby="profile-details-tab">
                                        <div class="card p-4 mb-4">
                                            <h5 class="text-primary mb-4">Profile Details</h5>

                                            <div class="mb-3">
                                                <asp:Label ID="Label6" class="form-label" runat="server" Font-Bold="false" Font-Size="Large"
                                                    Text="Username : "></asp:Label>
                                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("name") %>'></asp:Label>
                                            </div>
                                            <div class="mb-3">
                                                <asp:Label ID="Label8" class="form-label" runat="server" Font-Bold="false" Font-Size="Large"
                                                    Text="Email : "></asp:Label>
                                                <asp:Label ID="Label3" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                            </div>
                                            <div class="mb-3">
                                                <asp:Label ID="Label7" class="form-label" runat="server" Font-Bold="false" Font-Size="Large"
                                                    Text="Mobile : "></asp:Label>
                                                <asp:Label ID="Label4" runat="server" Text='<%# Eval("mobile") %>'></asp:Label>
                                            </div>

                                            <div class="mb-3">
                                                <asp:Label ID="Label9" class="form-label" runat="server" Font-Bold="false" Font-Size="Large"
                                                    Text="Address : "></asp:Label>
                                                <asp:Label ID="Label5" runat="server" Text='<%# Eval("USaddress") %>'></asp:Label>
                                            </div>
                                        </div>
                                    </div>
                                </ItemTemplate>
                            </asp:Repeater>


                            <div class="tab-pane fade" id="edit-profile" role="tabpanel" aria-labelledby="edit-profile-tab">
                                <div class="card p-4 mb-4">
                                    <h5 class="text-primary mb-4">Edit Profile</h5>
                                    <div id="editProfileForm" runat="server">

                                        <div class="mb-3">
                                            <asp:FileUpload ID="FileUpload1" CssClass="form-control" runat="server" />
                                        </div>

                                        <div class="mb-3">
                                            <label for="editUsername" class="form-label">Username</label>
                                            <asp:TextBox ID="txt_username" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_username" ControlToValidate="txt_username" CssClass="text-danger"
                                                runat="server" ErrorMessage="Username is required." Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="mb-3">
                                            <label for="editEmail" class="form-label">Email</label>
                                            <asp:TextBox ID="txt_email" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_email" ControlToValidate="txt_email" CssClass="text-danger"
                                                runat="server" ErrorMessage="Email is required." Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="rev_email" ControlToValidate="txt_email" CssClass="text-danger"
                                                runat="server" ErrorMessage="Invalid email format." Display="Dynamic" ValidationExpression="^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="mb-3">
                                            <label for="editAddress" class="form-label">Address</label>
                                            <asp:TextBox ID="txt_address" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_address" ControlToValidate="txt_address" CssClass="text-danger"
                                                runat="server" ErrorMessage="Address is required." Display="Dynamic"></asp:RequiredFieldValidator>
                                        </div>
                                        <div class="mb-3">
                                            <label for="editMobile" class="form-label">Mobile</label>
                                            <asp:TextBox ID="txt_mobile" CssClass="form-control" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_mobile" ControlToValidate="txt_mobile" CssClass="text-danger"
                                                runat="server" ErrorMessage="Mobile number is required." Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="rev_mobile" ControlToValidate="txt_mobile" CssClass="text-danger"
                                                runat="server" ErrorMessage="Mobile number must be 10 digits." Display="Dynamic"
                                                ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>
                                        </div>

                                        <asp:LinkButton ID="LinkButton1" CausesValidation="false" CssClass="btn btn-primary w-100"
                                            runat="server" OnClick="Edit_Click" Text="Save Changes"></asp:LinkButton>
                                    </div>
                                </div>
                            </div>

                            <div class="tab-pane fade" id="change-password" role="tabpanel" aria-labelledby="change-password-tab">
                                <div class="card p-4 mb-4">
                                    <h5 class="text-primary mb-4">Change Password</h5>
                                    <div id="changePasswordForm" runat="server">
                                        <div class="mb-3">
                                            <label for="currentPassword" class="form-label">Current Password</label>
                                            <asp:TextBox ID="txt_CUpass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_CUpass" runat="server" ControlToValidate="txt_CUpass"
                                                ErrorMessage="Current Password is required" CssClass="text-danger" Display="Dynamic" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="newPassword" class="form-label">New Password</label>
                                            <asp:TextBox ID="txt_NEpass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_NEpass" runat="server" ControlToValidate="txt_NEpass"
                                                ErrorMessage="New Password is required" CssClass="text-danger" Display="Dynamic" />
                                            <asp:RegularExpressionValidator ID="rev_NEpass" runat="server" ControlToValidate="txt_NEpass"
                                                ErrorMessage="* at least 6 characters."
                                                ValidationExpression="^[A-Za-z\d]{6}$" CssClass="text-danger" Display="Dynamic" />
                                        </div>
                                        <div class="mb-3">
                                            <label for="confirmNewPassword" class="form-label">Confirm New Password</label>
                                            <asp:TextBox ID="txt_COpass" CssClass="form-control" runat="server" TextMode="Password"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="rfv_COpass" runat="server" ControlToValidate="txt_COpass"
                                                ErrorMessage="Confirm New Password is required" CssClass="text-danger" Display="Dynamic" />
                                            <asp:CompareValidator ID="cv_Passwords" runat="server" ControlToCompare="txt_NEpass"
                                                ControlToValidate="txt_COpass" ErrorMessage="Passwords do not match" CssClass="text-danger"
                                                Display="Dynamic" />
                                        </div>
                                    </div>
                                    <asp:LinkButton ID="LinkButton2" CausesValidation="false" OnClick="pass_Click" CssClass="btn btn-primary w-100"
                                        runat="server" Text="Change Password"></asp:LinkButton>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
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
                            <asp:HyperLink ID="HyperLink8" NavigateUrl="~/USprofile.aspx" CssClass="btn-link"
                                runat="server">My Account</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink12" NavigateUrl="~/shop.aspx" CssClass="btn-link" runat="server">Shopping</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink13" NavigateUrl="~/Cart.aspx" CssClass="btn-link" runat="server">Shopping Cart</asp:HyperLink>
                            <asp:HyperLink ID="HyperLink14" NavigateUrl="~/Order.aspx" CssClass="btn-link" runat="server">Order History</asp:HyperLink>
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
