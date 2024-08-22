<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ad_user_view.aspx.cs" Inherits="Ad_user_view" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin User View</title>
    <link href="assets/img/favicon.png" rel="icon" />
    <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon" />

    <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="assets/vendor/bootstrap-icons/bootstrap-icons.css" rel="stylesheet" />

    <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet" />
    <link href="assets/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

              
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
                    <asp:TextBox ID="txt_search" placeholder="Search"
                        OnTextChanged="Search_Click" runat="server"></asp:TextBox>
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

                            <asp:ImageButton ID="Ima_avataer1" CssClass="rounded-circle pe-2" Width="60" Height="40"
                                Visible="false"
                                src="img\avatar.jpg" runat="server" />
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
                    <asp:HyperLink ID="HyperLink2" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Contact.aspx"
                        runat="server">
                        <i class="bi bi-envelope"></i>
                        <span>Contact</span>
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink3" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Signup.aspx"
                        runat="server">
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
                    <asp:HyperLink ID="HyperLink4" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Category_add.aspx"
                        runat="server">
                    <i class="bi bi-plus-circle"></i>
                         <span>Category add</span> 
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink5" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Category_view.aspx"
                        runat="server">
                        <i class="bi bi-layout-text-window-reverse"></i>
                        <span>Category view</span>
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink6" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Add_categoryid.aspx"
                        runat="server">
                        <i class="bi bi-plus-circle"></i>
                        <span>Product add</span>
                    </asp:HyperLink>
                </li>
                <li class="nav-item">
                    <asp:HyperLink ID="HyperLink7" CssClass="nav-link collapsed" NavigateUrl="~/Ad_Product_view.aspx"
                        runat="server">
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


        
        <!-- ======= Main Content ======= -->
        <div id="main" class="main">
            <!-- End Page Title -->

            <section class="section">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="card">
                            <div class="card-body">
                                <asp:Label ID="lbl_Msg" runat="server"></asp:Label>
                                <h5 class="card-title">Orders View</h5>
                                <!-- Orders Table -->
                                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                                    <ContentTemplate>
                                        <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_ItemCommand">
                                            <HeaderTemplate>
                                                <table class="table">
                                                    <thead>
                                                        <tr>
                                                            <th scope="col">User ID</th>
                                                            <th scope="col">photo</th>
                                                            <th scope="col">Name</th>
                                                            <th scope="col">Email</th>
                                                            <th scope="col">Mobile</th>
                                                            <th scope="col">Address</th>
                                                            <th scope="col">Status</th>
                                                            <th scope="col">CH_status</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                            </HeaderTemplate>
                                            <ItemTemplate>
                                                <tr>
                                                    <td><%# Eval("USid") %></td>
                                                    <td><asp:Image ID="Image3" runat="server" Height="52px" Width="70" ImageUrl='<%# Eval("photo") %>' /></td>
                                                    <td><%# Eval("name") %></td>
                                                    <td><%# Eval("email") %></td>
                                                    <td><%# Eval("Mobile") %></td>
                                                    <td><%# Eval("USaddress") %></td>
                                                    <td><%# Eval("status1") %></td>
                                                    <td>
                                                        <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn btn-primary btn-sm" Text="Change" CommandName="Change"></asp:LinkButton>
                                                    </td>

                                                    <asp:Label ID="lbl_OMId" Visible="false" runat="server" Text='<%# Eval("USid") %>'></asp:Label>
                                                    <asp:Label ID="lbl_sta" runat="server" Visible="false" Text='<%# Eval("status") %>'></asp:Label>
                                                </tr>
                                            </ItemTemplate>
                                            <FooterTemplate>
                                                </tbody>
                </table>
                                            </FooterTemplate>
                                        </asp:Repeater>
                                    </ContentTemplate>
                                    <Triggers>
                                        <asp:AsyncPostBackTrigger ControlID="Repeater2" EventName="ItemCommand" />
                                    </Triggers>
                                </asp:UpdatePanel>

                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </div>
        <!-- End Main Content -->
    </form>
    <script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
    <script src="assets/js/main.js"></script>
</body>
</html>
