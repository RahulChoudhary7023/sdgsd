using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Product_view : System.Web.UI.Page
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
        
        catch(Exception ex)
        {
            lbl_ErrorMsg.Text = "Error: " + ex.Message;
            lbl_ErrorMsg.ForeColor = System.Drawing.Color.Red;
        }

        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string qry;
        DataTable dt = new DataTable();

        qry = "SELECT *,CASE WHEN status=1 THEN 'Enable' ELSE 'disable' END AS status1 FROM Product_tb ORDER BY CAid ASC";
        dt = c1.GetDT(qry);

        DataList1.DataSource = dt;
        DataList1.DataBind();
    }

    protected void Signout_Click(object sender, EventArgs e)
    {
        Session.Remove("adid");
        Response.Redirect("Ad_login.aspx");
    }

    protected void DataList1_ItemCommand1(object source, RepeaterCommandEventArgs e)
    {
        try
        {
            string id, qry1, status = "1";

            id = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lbl_PRid")).Text;
            status = ((Label)DataList1.Items[e.Item.ItemIndex].FindControl("lbl_sta")).Text;

            if (e.CommandName == "change_status")
            {
                if (status.Equals("0"))
                {
                    qry1 = "Update Product_tb set status = 1 where  PRid=" + id;

                    c1.ExeQry(qry1);
                    FillDetails();
                }
                else
                {
                    qry1 = "Update Product_tb set status = 0 where  PRid=" + id;

                    c1.ExeQry(qry1);
                    FillDetails();
                }
            }

            else if (e.CommandName == "btn_Delete")
            {
                qry1 = "Delete from Product_tb where PRid =" + id;

                c1.ExeQry(qry1);
                FillDetails();
            }

            else if (e.CommandName == "edit")
            {
                Session.Add("ProId", id);
                Response.Redirect("Ad_Product_update.aspx");
            }

            else if (e.CommandName == "add_det")
            {
                Session.Add("PrId", id);
                Response.Redirect("Ad_PrDetails_add.aspx");
            }
        }

        catch(Exception ex)
        {
            lbl_ErrorMsg.Text = "Error: " + ex.Message;
            lbl_ErrorMsg.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void Search_Click(object sender, EventArgs e)
    {
      try
      { 
        string SEqry;

        SEqry = "SELECT *,CASE WHEN status=1 THEN 'Enable' ELSE 'disable' END AS status1 FROM Product_tb where name LIKE '%" + txt_search.Text + "%'";

        DataTable dt = new DataTable();
        dt = c1.GetDT(SEqry);

        DataList1.DataSource = dt;
        DataList1.DataBind();
      }
      catch (Exception ex)
      {
          lbl_ErrorMsg.Text = "Error: " + ex.Message;
          lbl_ErrorMsg.ForeColor = System.Drawing.Color.Red;
      }
    }
}
