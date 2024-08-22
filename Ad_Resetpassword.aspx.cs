using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Ad_Resetpassword : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            FillDetails();

    }

    private void FillDetails()
    {
        string qry,cnt;

        DataTable dt = new DataTable();
        cnt = Request.QueryString["ADid"];

        qry = "Select * From tb_admin where ADid =" + cnt;
        dt = c1.GetDT(qry);

       if(dt.Rows.Count == 0)
       {
           lbl_msg.Text = "your password Reset link is Expired or invalid ...try again";
           lbl_msg.ForeColor = System.Drawing.Color.Red;
       }

        else
        {
            tx_NePass.Visible = true;
            tx_ConPass.Visible = true;
        }
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        string qry = "", cnt;
        qry = "Select Count(*) From tb_admin where ADid ="+ Request.QueryString["ADid"];
        cnt = c1.getScalar(qry);

        if (Convert.ToInt16(cnt) == 1)
        {
            qry = "Update tb_admin Set ADPassword = '" + tx_NePass.Text + "' Where ADid = '" + Request.QueryString["ADid"] +"'";
            c1.ExeQry(qry);

            tx_NePass.Text = "";
            tx_ConPass.Text = "";
            FillDetails();
            Response.Redirect("Ad_login.aspx");
        }
        else
        {
            tx_NePass.Text = "Current Password is worng";
            tx_ConPass.ForeColor = System.Drawing.Color.Red;
            FillDetails();
        }
    }
}