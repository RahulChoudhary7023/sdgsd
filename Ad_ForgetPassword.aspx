<%@ Page Language="C#" AutoEventWireup="true" EnableEventValidation="false" CodeFile="Ad_ForgetPassword.aspx.cs" Inherits="Ad_ForgetPassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <title>Pages / Register - NiceAdmin Bootstrap Template</title>

   <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous"/>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>

  <link href="assets/css/style.css" rel="stylesheet"/>
</head>
<body>
    <form id="form1" runat="server">
       <div class="container">
      <section class="section register min-vh-100 d-flex flex-column align-items-center justify-content-center py-4">
        <div class="container">
          <div class="row justify-content-center">
            <div class="col-lg-6 col-md-6 lg d-flex flex-column align-items-center justify-content-center">

              <div class="card mb-3 lg">

                <div class="card-body">

                  <div class="pt-4 pb-2">
                    <h5 class="card-title text-center pb-0 fs-4">Forget Password</h5>
                    <p class="text-center small">Enter your Email & Now check the gmail</p>
                  </div>

                  <div class="row g-3 needs-validation">
                    <div class="col-12">
                        <label for="yourUsername" class="form-label">Enter Your Email</label>
                        <asp:TextBox ID="txt_email" runat="server" TextMode="Email" class="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Fill The Email" ControlToValidate="txt_email" ForeColor="#FF0066"></asp:RequiredFieldValidator>
                    </div>

                    <div class="col-12">
                      <asp:LinkButton ID="LinkButton1" class="btn btn-primary w-100 mt-3 mb-4" CausesValidation="false" OnClick="login_Click" runat="server">Send</asp:LinkButton>
                    </div>
                      <asp:Label ID="lbl_msg" runat="server"></asp:Label>
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