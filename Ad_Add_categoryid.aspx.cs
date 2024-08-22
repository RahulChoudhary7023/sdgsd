using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Add_categoryid : System.Web.UI.Page
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
            lblErrorMAS.Text = "Error: " + ex.Message;
            lblErrorMAS.ForeColor = System.Drawing.Color.Blue;
        }

        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string query;

        query = "SELECT * FROM Category_tb where CAstatus =1 ORDER BY CAid";
        Repeater2.DataSource = c1.GetDS(query);
        Repeater2.DataBind();
    }

    protected void Signout_Click(object sender, EventArgs e)
    {
        Session.Remove("adid");
        Response.Redirect("Ad_login.aspx");
    }

    protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        try
        { 
        string id;

        if (e.CommandName == "idclick")
        {
            id = e.CommandArgument.ToString();

            Session.Add("Ctgid", id);
            Response.Redirect("Ad_Product_add.aspx");
        }
      }
        catch (Exception ex)
        {
            lblErrorMAS.Text = "Error: " + ex.Message;
            lblErrorMAS.ForeColor = System.Drawing.Color.Brown;
        }
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        try
        {
            string SEqry;

            SEqry = "SELECT * FROM Category_tb where CAname LIKE '%" + txt_search.Text + "%'";

            DataTable dt = new DataTable();
            dt = c1.GetDT(SEqry);

            Repeater2.DataSource = dt;
            Repeater2.DataBind();
        }
        catch (Exception ex)
        {
            lblErrorMAS.Text = "Error: " + ex.Message;
            lblErrorMAS.ForeColor = System.Drawing.Color.Black;
        }
    }
}