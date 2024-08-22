using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Sign_up : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string query,cnt,sta="1";

        query = "Select Count (*) From User_tb where name = '" + txt_name.Text + "' and password ='" + txt_password.Text + "' ";
        cnt = c1.getScalar(query);

        if (Convert.ToInt32(cnt) > 0)
        {
            lbl_Msg.Text = "Mobile Number is Already Registered, Login to View Details ";
            lbl_Msg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            query = "Insert Into User_tb (name,email,password,status) values('" + txt_name.Text + "','" + txt_email.Text + "','" + txt_password.Text + "','" + sta + "')";
            c1.ExeQry(query);
            Response.Redirect("Sign_in.aspx");
        }

    }
}