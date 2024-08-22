using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class About : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        string qry;
        DataTable dt = new DataTable();

        if (Session["usid"] == null)
        {
            Pro_HY.Visible = true;
        }
        else
        {
            Hyper_order.Visible = true;
            qry = "select * from User_tb where USid =" + Session["usid"].ToString();
            dt = c1.GetDT(qry);

            if (dt.Rows.Count > 0)
            {
                string photo = dt.Rows[0]["photo"] as string;
                if (string.IsNullOrEmpty(photo))
                {
                    IMg_Av.Visible = true;
                    Session["ReturnUrl"] = Request.Url.AbsoluteUri;
                }
                else
                {
                    qry = "Select * from User_tb where Usid =" + Session["usid"].ToString();
                    Repeater2.DataSource = c1.GetDT(qry);
                    Repeater2.DataBind();
                }
            }
        }

        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        
    }
   
    protected void shop_Click(object sender, EventArgs e)
    {
        Session.Remove("caid");
        FillDetails();
        Response.Redirect("shop.aspx");
    }
}