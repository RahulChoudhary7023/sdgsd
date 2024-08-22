<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Ad_Resetpassword.aspx.cs" Inherits="Ad_Resetpassword" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Password - NiceAdmin</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet"/>
    <link href="assets/css/style.css" rel="stylesheet"/>
    <style>
        .input-group .form-control {
            padding-right: 2.5rem;
        }
        .input-group .form-control + .input-group-text {
            cursor: pointer;
        }
        .validator-message {
            display: block;
            margin-top: 0.5rem;
            font-size: 0.875em;
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
                <div class="container">
                    <div class="row justify-content-center">
                        <div class="col-lg-6 col-md-6 d-flex flex-column align-items-center justify-content-center">
                            <div class="card mb-3">
                                <div class="card-body">
                                    <div class="pt-4 pb-2">
                                        <h5 class="card-title text-center pb-0 fs-4">Change Your Password</h5>

                                    <asp:Label ID="lbl_msg" runat="server"></asp:Label>
                                    </div>
                                    <div class="row g-3 needs-validation">
                                        <div class="col-12">
                                            <label for="tx_NePass" class="form-label">New Password</label>
                                            <div class="input-group">
                                                <asp:TextBox ID="tx_NePass" Visible="false" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                                <span class="input-group-text" onclick="togglePasswordVisibility('tx_NePass')">
                                                    <i class="fas fa-eye" id="toggleIconTx_NePass"></i>
                                                </span>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fill In The New Password" ControlToValidate="tx_NePass" CssClass="validator-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:RegularExpressionValidator ID="revPassword" runat="server" ControlToValidate="tx_NePass" ErrorMessage="at least 6 digits." CssClass="validator-message" ValidationExpression="^[A-Za-z\d]{6}$" Display="Dynamic"></asp:RegularExpressionValidator>
                                        </div>
                                        <div class="col-12">
                                            <label for="tx_ConPass" class="form-label">Confirm Password</label>
                                            <div class="input-group">
                                                <asp:TextBox ID="tx_ConPass"  Visible="false" TextMode="Password" runat="server" CssClass="form-control"></asp:TextBox>
                                                <span class="input-group-text" onclick="togglePasswordVisibility('tx_ConPass')">
                                                    <i class="fas fa-eye" id="toggleIconTx_ConPass"></i>
                                                </span>
                                            </div>
                                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Fill In The Confiram Password" ControlToValidate="tx_ConPass" CssClass="validator-message" Display="Dynamic"></asp:RequiredFieldValidator>
                                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Passwords do not match" ControlToCompare="tx_NePass" ControlToValidate="tx_ConPass" CssClass="validator-message" Display="Dynamic"></asp:CompareValidator>
                                        </div>
                                        <div class="col-12">
                                            <asp:LinkButton ID="LinkButton1" CssClass="btn btn-primary w-100" runat="server" OnClick="LinkButton1_Click">Save</asp:LinkButton>
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
    <script>
        function togglePasswordVisibility(id) {
            const passwordField = document.getElementById(id);
            const toggleIcon = document.getElementById(`toggleIcon${id}`);
        if (passwordField.type === "password") {
            passwordField.type = "text";
            toggleIcon.classList.remove("fa-eye");
            toggleIcon.classList.add("fa-eye-slash");
        } else {
            passwordField.type = "password";
            toggleIcon.classList.remove("fa-eye-slash");
            toggleIcon.classList.add("fa-eye");
        }
        }
    </script>
</body>
</html>
