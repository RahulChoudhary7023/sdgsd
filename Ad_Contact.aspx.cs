using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Contact : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string query;
            DataTable dt = new DataTable();

            if (Session["adid"] == null)
            {
                Session["ReturnUrl"] = Request.Url.AbsoluteUri;
                Response.Redirect("Ad_login.aspx");
            }
            else
            {
                query = "select * from tb_admin where ADid =" + Session["adid"].ToString();
                dt = c1.GetDT(query);

                if (dt.Rows.Count > 0)
                {
                    string photo = dt.Rows[0]["ADphoto"] as string;
                    if (string.IsNullOrEmpty(photo))
                    {
                        Ima_avataer1.Visible = true;
                    }
                    else
                    {
                        query = "Select * from tb_admin where ADid =" + Session["adid"].ToString();
                    }
                    Repeater1.DataSource = c1.GetDT(query);
                    Repeater1.DataBind();
                }
            }
        }
        catch (Exception ex)
        {
            lbl_Msg.Text = "Error: " + ex.Message;
            lbl_Msg.ForeColor = System.Drawing.Color.Red;
        }
        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {

    }

    protected void Signout_Click(object sender, EventArgs e)
    {
        Session.Remove("adid");
        Response.Redirect("Ad_login.aspx");
    }
    protected void Search_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    string SEqry;
        //    SEqry = "SELECT *,CASE WHEN Status=1 THEN 'Pending' ELSE 'Succes' END AS Orderstatus FROM OrderMaster_tb where name LIKE '%" + txt_search.Text + "%'";

        //    DataTable dt = new DataTable();
        //    dt = c1.GetDT(SEqry);

        //    Repeater2.DataSource = dt;
        //    Repeater2.DataBind();
        //}
        //catch (Exception ex)
        //{
        //    lbl_Msg.Text = "Error: " + ex.Message;
        //    lbl_Msg.ForeColor = System.Drawing.Color.Red;
        //}
    }
}