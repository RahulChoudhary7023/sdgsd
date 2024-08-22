<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Ad_Signup.aspx.cs" EnableEventValidation="false"
    Inherits="Ad_Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Admin Register </title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
        rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>

    <script src="js/JScript.js"></script>
    <link href="assets/css/style.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-2">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-6 lg col-md-6 d-flex flex-column align-items-center justify-content-center">


                            <!-- End Logo -->

                            <div class="card mb-3 lg">
                                <div class="card-body">

                                    <div class=" pb-1">
                                        <h5 class="card-title text-center pb-0 fs-4">Create an Account</h5>
                                        <p class="text-center small">Enter your personal details to create account</p>
                                    </div>

                                    <div class="row needs-validation">
                                        <div class="col-12">
                                            <label for="yourName" class="form-label">Full Name</label>
                                            <asp:TextBox ID="txt_name" runat="server" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Fill The Name"
                                                ControlToValidate="txt_name" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourEmail" class="form-label">Email</label>
                                            <asp:TextBox ID="txt_email" TextMode="Email" runat="server" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Fill The Email"
                                                ControlToValidate="txt_email" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="col-12">
                                            <label for="yourUsername" class="form-label">Number</label>
                                            <asp:TextBox ID="txt_number" TextMode="Number" runat="server" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Fill The Number"
                                                ControlToValidate="txt_number" ForeColor="Red"></asp:RequiredFieldValidator>
                                        </div>


                                        <div class="col-12">
                                            <label for="yourPassword" class="form-label">Password</label>
                                            <asp:TextBox ID="txt_password" TextMode="Password" runat="server" class="form-control"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Fill The Password"
                                                ControlToValidate="txt_password" ForeColor="Red"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="* at least 6 characters." ControlToValidate="txt_password" 
                                            CssClass="form-error" ValidationExpression="^[A-Za-z\d]{6}$"></asp:RegularExpressionValidator>                                        
                                        
                                        </div>

                                        <div class="col-12 mt-2">
                                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary w-100" runat="server"
                                                OnClick="Create_Click">Create Account</asp:LinkButton>
                                        </div>
                                        <div class="col-12 mt-2">
                                            <asp:Label ID="Label1" CssClass="small mb-0" runat="server" Text="Already have an account?">
                                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Ad_login.aspx" runat="server">Log in</asp:HyperLink>
                                            </asp:Label>

                                            <asp:Label ID="lbl_Msg" runat="server"></asp:Label>
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

</body>
</html>
