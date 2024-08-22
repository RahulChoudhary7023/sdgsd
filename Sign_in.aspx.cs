using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sign_in : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string query;
        DataTable dt = new DataTable();

        query = "SELECT * FROM User_tb where email ='" + txt_email.Text + "' and password ='" + txt_password.Text + "'and status =1";
        dt = c1.GetDT(query);

        if(dt.Rows.Count == 0)
        {
            lbl_Msg.Text = "Either Mobile Number / Password is Wrong";
            lbl_Msg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            Session.Add("email", dt.Rows[0]["email"]);
            Session.Add("usid", dt.Rows[0]["USid"]);

            string returnUrl = Session["ReturnUrl"] as string;
            if (!string.IsNullOrEmpty(returnUrl))
            {
                Session["ReturnUrl"] = null; // Clear the session variable
                Response.Redirect(returnUrl);
            }
            else
            {
                Response.Redirect("Home.aspx");
            }
        }
    }
}