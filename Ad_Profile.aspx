<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Ad_Profile.aspx.cs"
    Inherits="Ad_Profile" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Users / Profile - NiceAdmin Bootstrap Template</title>

    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />
    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="assets/vendor/quill/quill.snow.css" rel="stylesheet" />
    <link href="assets/vendor/quill/quill.bubble.css" rel="stylesheet" />
    <link href="assets/vendor/remixicon/remixicon.css" rel="stylesheet" />
    <link href="assets/vendor/simple-datatables/style.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />

    <style>
        .content {
            display: none;
        }

        .tab-content > .active {
            display: block;
        }

        .PROsize {
            font-size: 20px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />

        <!-- ======= Header ======= -->
        <header id="header" class="header fixed-top d-flex align-items-center">
            <div class="d-flex align-items-center justify-content-between">
                <a href="#" class="logo d-flex align-items-center">
                    <img src="assets/img/logo.png" alt="" />
                    <span class="d-none d-lg-block">Admin</span>
                </a>
                <i class="bi bi-list toggle-sidebar-btn"></i>
            </div>

            <div class="search-bar">
                <div class="search-form d-flex align-items-center">
                    <asp:TextBox ID="TextBox1" placeholder="Search" runat="server"></asp:TextBox>
                </div>
            </div>

            <nav class="header-nav ms-auto">
                <ul class="d-flex align-items-center">
                    <li class="nav-item d-block d-lg-none">
                        <a class="nav-link nav-icon search-bar-toggle " href="#">
                            <i class="bi bi-search"></i>
                        </a>
                    </li>
                    <li class="nav-item dropdown">
                        <a class="nav-link nav-icon" href="#" data-bs-toggle="dropdown">
                            <i class="bi bi-bell"></i>
                        </a>
                    </li>
                    <li class="nav-item ">
                        <asp:LinkButton ID="LinkButton7"
                            CssClass="nav-link nav-icon d-flex align-items-center" runat="server" OnClick="Signout_Click">
                            <i class="bi bi-box-arrow-right"></i>
                        </asp:LinkButton>
                    </li>
                    <li class="nav-item dropdown pe-3">
                     <asp:LinkButton ID="LinkButton8" PostBackUrl="~/Ad_Profile.aspx" runat="server" CssClass="nav-link nav-profile d-flex align-items-center pe-0">
                       
                      <asp:ImageButton ID="Ima_avataer1" CssClass="rounded-circle pe-2" Width="60" Height="40" Visible="false" src="img\avatar.jpg" runat="server" />
                        <asp:Repeater ID="Repeater1" runat="server">
                            <ItemTemplate>
                                    <asp:Image ID="Image2" runat="server" CssClass="rounded-circle pe-2" ImageUrl='<%# Eval("ADphoto") %>' />
                                    <asp:Label ID="Label7" runat="server" CssClass="d-none d-md-block" Text='<%# Eval("ADname") %>'></asp:Label>
                                
                            </ItemTemplate>
                        </asp:Repeater>
                     </asp:LinkButton>
                    </li>
                </ul>
            </nav>
        </header>

        <!-- ======= Sidebar ======= -->
        <aside id="sidebar" class="sidebar">
            <ul class="sidebar-nav" id="sidebar-nav">

                <li class="nav-heading">Pages</li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink1" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Profile.aspx"
                        runat="server">
                        <i class="bi bi-person"></i>
                        <span>Profile</span>
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink2" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Contact.aspx" runat="server">
                        <i class="bi bi-envelope"></i>
                        <span>Contact</span>
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink3" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Signup.aspx" runat="server">
                        <i class="bi bi-card-list"></i>
                       <span>Register</span>
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:LinkButton ID="LinkButton4" CssClass="nav-link collapsed" OnClick="Signout_Click"
                        runat="server">
                       <i class="bi bi-box-arrow-in-right"></i>
                       <span>Login</span>
                    </asp:LinkButton>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink4" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Category_add.aspx" runat="server">
                    <i class="bi bi-plus-circle"></i>
                         <span>Category add</span> 
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink5" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Category_view.aspx" runat="server">
                        <i class="bi bi-layout-text-window-reverse"></i>
                        <span>Category view</span>
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink6" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Add_categoryid.aspx" runat="server">
                        <i class="bi bi-plus-circle"></i>
                        <span>Product add</span>
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink7" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Product_view.aspx" runat="server">
                         <i class="bi bi-layout-text-window-reverse"></i>
                        <span>Product view</span>
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink8" CssClass="nav-link collapsed" NavigateUrl="~/Ad_PrDetails_view.aspx"
                        runat="server">
                         <i class="bi bi-layout-text-window-reverse"></i>
                        <span>Product Details</span>
                    </asp:HyperLink>
                </li>
                 <li class="nav-item">
                    <asp:HyperLink ID="HyperLink9" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Order_view.aspx"
                        runat="server">
                         <i class="bi bi-layout-text-window-reverse"></i>
                        <span>Order view</span>
                    </asp:HyperLink>
                </li>
                 <li class="nav-item">
                    <asp:HyperLink ID="HyperLink10" CssClass="nav-link collapsed" NavigateUrl="~/Ad_user_view.aspx"
                        runat="server">
                         <i class="bi bi-person"></i>
                        <span>User view</span>
                    </asp:HyperLink>
                </li>
            </ul>
        </aside>
        <!-- End Sidebar-->

        <div class="main" id="main">
            <div class="pagetitle">
                <h1>Profile</h1>
                <asp:Label ID="lbl_ErrorMsg" runat="server"></asp:Label>
            </div>

            <section class="section profile">
                <div class="row">
                    <div class="col-xl-4">
                        <div class="card">
                            <div class="card-body profile-card pt-4 d-flex flex-column align-items-center">
                                  <asp:ImageButton ID="Ima_avataer2" CssClass="rounded-circle" Height="200" Visible="false" src="img\avatar.jpg" runat="server" />
        
                              <asp:Repeater ID="Repeater2" runat="server">
                                <ItemTemplate>
                                        <asp:Image ID="Ima_data" runat="server" CssClass="rounded-circle" ImageUrl='<%# Eval("ADphoto") %>' />

                                        <asp:Label ID="Label1" CssClass="mt-2" Font-Size="24px" runat="server" Text='<%# Eval("ADname") %>'></asp:Label>
                                        <div class="social-links mt-1">
                                            <a href="https://www.telegram.org" class="twitter"><i class="bi bi-telegram"></i>
                                            </a>
                                            <a href="https://www.facebook.com" class="facebook"><i class="bi bi-facebook"></i>
                                            </a>
                                            <a href="https://www.instagram.com" class="instagram"><i class="bi bi-instagram"></i>
                                            </a>
                                            <a href="https://www.linkedin.com" class="linkedin"><i class="bi bi-linkedin"></i>
                                            </a>
                                        </div>
                                </ItemTemplate>
                            </asp:Repeater>
                           </div>
                        </div>
                    </div>

                    <div class="col-xl-8">
                        <div class="card">
                            <div class="card-body pt-3">
                                <ul class="nav nav-tabs nav-tabs-bordered">
                                    <li class="nav-item">
                                        <a class="nav-link active" id="profile-overview-tab" data-toggle="tab" href="#profile-overview"
                                            role="tab">Overview</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-edit-tab" data-toggle="tab" href="#profile-edit"
                                            role="tab">Edit Profile</a>
                                    </li>
                                    <li class="nav-item">
                                        <a class="nav-link" id="profile-change-password-tab" data-toggle="tab" href="#profile-change-password"
                                            role="tab">Change Password</a>
                                    </li>
                                </ul>
                                <div class="tab-content pt-2">
                                    <div class="tab-pane fade show active" id="profile-overview" role="tabpanel">
                                        <h1 class="card-title">Profile Details</h1>
                                        <asp:Repeater ID="Repeater3" runat="server">
                                            <ItemTemplate>

                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label PROsize">Full Name</div>
                                                    <div class="col-lg-9 col-md-8">
                                                        <asp:Label ID="Label1" runat="server" CssClass="PROsize" Font-Size="20px" Text='<%# Eval("ADname") %>'></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label PROsize">Phone</div>
                                                    <div class="col-lg-9 col-md-8">
                                                        <asp:Label ID="Label2" runat="server" CssClass="PROsize" Text='<%# Eval("ADmobile") %>'></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label PROsize">Email</div>
                                                    <div class="col-lg-9 col-md-8">
                                                        <asp:Label ID="Label3" runat="server" CssClass="PROsize" Text='<%# Eval("ADemail") %>'></asp:Label>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-lg-3 col-md-4 label PROsize">Address</div>
                                                    <div class="col-lg-9 col-md-8">
                                                        <asp:Label ID="Label4" runat="server" CssClass="PROsize" Text='<%# Eval("ADaddress") %>'></asp:Label>
                                                    </div>
                                                </div>
                                                </div>
                                 
                                            </ItemTemplate>
                                        </asp:Repeater>


                                        <div class="tab-pane fade" id="profile-edit" role="tabpanel">
                                            <!-- Profile Edit Form -->
                                            <div class="row mb-2 mt-3">
                                                <label for="profileImage" class="col-md-4 col-lg-3 col-form-label">Profile Image</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <asp:FileUpload ID="FileUpload1" runat="server" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label for="fullName" class="col-md-4 col-lg-3 col-form-label">Full Name</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <asp:TextBox ID="txt_name" runat="server" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txt_name"
                                                        ErrorMessage="Name is required" ValidationGroup="ProfileEditGroup" CssClass="text-danger" />
                                                </div>
                                            </div>
                                            <div class="row">
                                                <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Phone</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <asp:TextBox ID="txt_phone" TextMode="Number" runat="server" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txt_phone"
                                                        ErrorMessage="Phone is required" ValidationGroup="ProfileEditGroup" CssClass="text-danger" />
                                                    <asp:RegularExpressionValidator ID="rev_mobile" ControlToValidate="txt_phone" ValidationGroup="ProfileEditGroup"
                                                        CssClass="text-danger"
                                                        runat="server" ErrorMessage="number 10 digits." Display="Dynamic"
                                                        ValidationExpression="^\d{10}$"></asp:RegularExpressionValidator>

                                                </div>
                                            </div>

                                            <div class="row">
                                                <label for="Email" class="col-md-4 col-lg-3 col-form-label">Email</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <asp:TextBox ID="txt_email" TextMode="Email" runat="server" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ValidationGroup="ProfileEditGroup"
                                                        runat="server" ControlToValidate="txt_email"
                                                        ErrorMessage="Email is required" CssClass="text-danger" />
                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txt_email"
                                                        ErrorMessage="Invalid email format" ValidationGroup="ProfileEditGroup" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                                        CssClass="text-danger" />
                                                </div>
                                            </div>

                                            <div class="row">
                                                <label for="Phone" class="col-md-4 col-lg-3 col-form-label">Address</label>
                                                <div class="col-md-8 col-lg-9">
                                                    <asp:TextBox ID="txt_address" runat="server" CssClass="form-control" />
                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="txt_address"
                                                        ErrorMessage="Address is required" CssClass="text-danger" ValidationGroup="ProfileEditGroup" />
                                                </div>
                                            </div>

                                            <div class="text-start">
                                                <asp:LinkButton ID="LinkButton1" Text="Save Changes" CssClass="btn btn-primary" runat="server"
                                                    OnClick="UPDATE_Click" ValidationGroup="ProfileEditGroup">Save Changes</asp:LinkButton>
                                            </div>
                                        </div>

                                        <div class="tab-pane fade" id="profile-change-password" role="tabpanel">
                                            <!-- Change Password Form -->
                                            <div class="row mb-3 mt-3">
                                                <div class="row mb-2">
                                                    <label for="currentPassword" class="col-md-4 col-lg-3 col-form-label">Current Password</label>
                                                    <div class="col-md-8 col-lg-9">
                                                        <asp:TextBox ID="Cu_pass" runat="server" TextMode="Password" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ValidationGroup="ChangePASSGroup"
                                                            runat="server" ControlToValidate="Cu_pass"
                                                            ErrorMessage="Current password is required" CssClass="text-danger" />
                                                    </div>
                                                </div>

                                                <div class="row mb-1">
                                                    <label for="newPassword" class="col-md-4 col-lg-3 col-form-label">New Password</label>
                                                    <div class="col-md-8 col-lg-9">
                                                        <asp:TextBox ID="Ne_pass" runat="server" TextMode="Password" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ValidationGroup="ChangePASSGroup"
                                                            runat="server" ControlToValidate="Ne_pass"
                                                            ErrorMessage="New password is required" CssClass="text-danger" />
                                                        <asp:RegularExpressionValidator ID="rev_NEpass" runat="server" ControlToValidate="Ne_pass"
                                                            ErrorMessage="* at least 6 characters."
                                                            ValidationExpression="^[A-Za-z\d]{6}$" CssClass="text-danger" Display="Dynamic" />

                                                    </div>
                                                </div>

                                                <div class="row mb-1">
                                                    <label for="renewPassword" class="col-md-4 col-lg-3 col-form-label">Re-enter Password</label>
                                                    <div class="col-md-8 col-lg-9">
                                                        <asp:TextBox ID="Re_pass" runat="server" TextMode="Password" CssClass="form-control" />
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ValidationGroup="ChangePASSGroup"
                                                            ControlToValidate="Re_pass"
                                                            ErrorMessage="Re-entered password is required" CssClass="text-danger" />
                                                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="Re_pass"
                                                            ControlToCompare="Ne_pass" ErrorMessage="Passwords do not match" ValidationGroup="ChangePASSGroup"
                                                            CssClass="text-danger" />
                                                    </div>
                                                </div>
                                                <div class="text-start">
                                                    <asp:LinkButton ID="LinkButton2" Text="Change Password" CssClass="btn btn-primary"
                                                        runat="server" OnClick="ChangePASS_Click" ValidationGroup="ChangePASSGroup"> Change Password</asp:LinkButton>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
    </form>

    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#profile-overview-tab').tab('show');
        });
    </script>
</body>
</html>
