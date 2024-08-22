<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Sign_up.aspx.cs" EnableEventValidation="false" Inherits="Sign_up" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Register - NiceAdmin Bootstrap Template</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script type="text/javascript" src="js/JScript.js"></script>
    <link href="assets/css/style.css" rel="stylesheet"/>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"/>
    <style>
        body {
            background-image: url('img/account-on-smartphone-app-png-image_4740863.png');
            background-size: cover;
            background-position: center;
            background-repeat: no-repeat;
            background-color: black;
            color:white;
        }

        .form-error {
            display: block;
            margin-top: 0px;
            margin-bottom: 5px;
            color: red;
            font-size: 0.875em;
            line-height:10px;
        }

        .form-control {
            margin-bottom: 2px; /* Reduced space between textboxes */
            padding: 5px; /* Adjusted padding for textboxes */
        }

        #txt_name {
            margin-bottom: 2px; /* Space between txt_name and txt_email */
        }

        #txt_email {
            margin-bottom: 2px; /* Space between txt_email and next element (if any) */
        }

        .card {
            background-color: #1b1919;
            opacity: 0;
            transform: translateY(20px);
            animation: fadeInUp 0.6s ease-out forwards, borderColorChange 2s linear infinite;
            border: 2px solid transparent;
        }

        @keyframes fadeInUp {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes borderColorChange {
            0% {
                border-color: red;
            }
            33% {
                border-color: blue;
            }
            66% {
                border-color: green;
            }
            100% {
                border-color: red;
            }
        }

          .home-icon {
            float: right;
            right:5px;
            color: #ffffff;
            font-size: 24px;
        }

        .home-icon:hover {
            color: #adb5bd;
        }
       
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-xl-6 col-md-6 d-flex flex-column align-items-center justify-content-center" style="width:100% !important;">
                            <div class="card mb-3" style="width:420px;">
                                <div class="card-body">
                                    <div class="pt-2 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4" style="color:white;">Create an Account</h5>
                                        <p class="text-center small">Enter your personal details to create an account</p>
                                    </div>
                                    
                                    <div class="row">
                                        <div class="col-12 mb-2">
                                            <asp:Label ID="Label1" Font-Bold="true" ForeColor="White" class="form-label" runat="server" Text="Your Name"></asp:Label>
                                            <asp:TextBox ID="txt_name" ForeColor="White" runat="server" placeholder="First and last name" class="form-control p-2" BackColor="#333333"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Fill The Your Name" ControlToValidate="txt_name" CssClass="form-error"></asp:RequiredFieldValidator>
                                        </div>

                                        <div class="col-12">
                                            <asp:Label ID="Label2" Font-Bold="true" ForeColor="White" class="form-label" runat="server" Text="Email Address"></asp:Label>
                                            <asp:TextBox ID="txt_email" ForeColor="White" TextMode="Email" runat="server" placeholder="Email Address" class="form-control p-2" BackColor="#333333"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Fill The Email" ControlToValidate="txt_email" CssClass="form-error"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="EmailValidator" runat="server" ErrorMessage="Invalid email format" ControlToValidate="txt_email" CssClass="form-error" ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"></asp:RegularExpressionValidator>
                                        </div>

                                        <div class="col-12 ">
                                            <asp:Label ID="Label3" Font-Bold="true" ForeColor="White" class="form-label" runat="server" Text="Password "></asp:Label>
                                            <asp:TextBox ID="txt_password" ForeColor="White" TextMode="Password" runat="server" placeholder="At least 6 characters." class="form-control p-2" BackColor="#333333"></asp:TextBox>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="*Fill The Password" ControlToValidate="txt_password" CssClass="form-error"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="* at least 6 characters." ControlToValidate="txt_password" 
                                            CssClass="form-error" ValidationExpression="^[A-Za-z\d]{6}$"></asp:RegularExpressionValidator>                                        
                                        </div>
                                        <div class="col-12 mt-0">
                                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary w-100" 
                                                runat="server" OnClick="LinkButton1_Click">Submit</asp:LinkButton>
                                        </div>
                                         <div class="col-12 mt-2">
                                            <asp:Label ID="Label4" ForeColor="White" class="small mb-0 text-center" runat="server" Text=" Already have an account?">
                                                <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Sign_in.aspx" runat="server">Sign in</asp:HyperLink>
                                            </asp:Label>
                                            <a href="~/Home.aspx" class="home-icon">
                                                <i class="fas fa-home"></i> <!-- FontAwesome Home Icon -->
                                            </a>
                                        </div>
                                        <asp:Label ID="lbl_Msg" runat="server"></asp:Label>
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
