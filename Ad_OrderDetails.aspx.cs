using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_OrderDetails : System.Web.UI.Page
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

        if (Session["omid"] == null)
            Response.Redirect("Ad_Order_view.aspx");

        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string query;

        query = "SELECT * FROM OrderDetails_tb where OMid="+Session["omid"].ToString();
        Repeater_Products.DataSource = c1.GetDS(query);
        Repeater_Products .DataBind();
    }

    protected void Signout_Click(object sender, EventArgs e)
    {
        Session.Remove("adid");
        Response.Redirect("Ad_login.aspx");
    }

    protected void Repeater_Products_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
      try
      { 
        string id, qry;

        id = ((Label)Repeater_Products.Items[e.Item.ItemIndex].FindControl("lbl_ODId")).Text;

         if (e.CommandName == "btn_Delete")
        {
            qry = "Delete from OrderDetails_tb where ODid =" + id;

            c1.ExeQry(qry);
            FillDetails();
        }
      }
      catch (Exception ex)
      {
          lbl_Msg.Text = "Error: " + ex.Message;
          lbl_Msg.ForeColor = System.Drawing.Color.Red;
      }
    }

    protected void Search_Click(object sender, EventArgs e)
    {
        //try
        //{
        //    string SEqry;

        //    SEqry = "SELECT *,CASE WHEN status=1 THEN 'Enable' ELSE 'disable' END AS status1 FROM Product_tb where name LIKE '%" + txt_search.Text + "%'";

        //    DataTable dt = new DataTable();
        //    dt = c1.GetDT(SEqry);

        //    DataList1.DataSource = dt;
        //    DataList1.DataBind();
        //}
        //catch (Exception ex)
        //{
        //    lbl_ErrorMsg.Text = "Error: " + ex.Message;
        //    lbl_ErrorMsg.ForeColor = System.Drawing.Color.Red;
        //}
    }
}