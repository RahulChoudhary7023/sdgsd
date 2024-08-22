using System;
using System.Collections.Generic;
using System.Linq;
using System.Web; 
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_login : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        txt_number.Focus();
    }

    protected void login_Click (object sender, EventArgs e)
    {
      try
      { 
        string abc;
        DataTable dt = new DataTable();
   
        abc = "Select * from tb_admin where ADmobile = '"+ txt_number.Text +"' and ADpassword = '"+ txt_password.Text +"'";
        dt = c1.GetDT(abc);

        if(dt.Rows.Count == 0)
        {
            lbl_msg.Text = "Either Mobile Number / Password is Wrong";
            lbl_msg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            Session.Add("ADmobile", dt.Rows[0]["ADmobile"]);
            Session.Add("adid", dt.Rows[0]["ADid"]);
            Response.Redirect("Ad_Profile.aspx");
            string returnUrl = Session["ReturnUrl"] as string;
            if (!string.IsNullOrEmpty(returnUrl))
            {
                Session["ReturnUrl"] = null; // Clear the session variable
                Response.Redirect(returnUrl);
            }
        }
      }
      
     catch(Exception ex)
      {
          lbl_msg.Text = "Error: " + ex.Message;
          lbl_msg.ForeColor = System.Drawing.Color.Red;
      }
   }
}