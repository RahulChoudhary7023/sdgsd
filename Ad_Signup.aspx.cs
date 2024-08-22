using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Signup : System.Web.UI.Page
{
    Class1 cl = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            FillDetails(); 
    }

    private void FillDetails()
    {

    }
    
    protected void Create_Click(object sender, EventArgs e)
    {
        try
        {
        string qry, cnt;

        qry = "Select Count (*) From tb_admin where ADmobile = '" + txt_number.Text + "' and ADpassword ='" + txt_password.Text + "' ";
        cnt = cl.getScalar(qry);

        if(Convert.ToInt32(cnt) > 0)
        {
            lbl_Msg.Text = "Mobile Number is Already Registered, Login to View Details ";
            lbl_Msg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            qry = "Insert Into tb_admin (ADname,ADemail,ADmobile,ADpassword) values('" + txt_name.Text + "','" + txt_email.Text + "','" + txt_number.Text + "','" + txt_password.Text + "')";
            cl.ExeQry(qry);
            Response.Redirect("Ad_login.aspx");
        }
      }
     catch (Exception ex)
     {
         lbl_Msg.Text = "Error: " + ex.Message;
         lbl_Msg.ForeColor = System.Drawing.Color.Red;
     }
  }

}