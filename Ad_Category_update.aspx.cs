using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Category_update : System.Web.UI.Page
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

            if (Session["upid"] == null)
                Response.Redirect("Ad_Category_view.aspx");
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
        try
        {
            string qry;
            qry = "SELECT * FROM Category_tb where CAid =" + Session["upid"].ToString();

            DataTable dt = new DataTable();
            dt = c1.GetDT(qry);

            if (dt.Rows.Count > 0)
            {
                txt_name.Text = dt.Rows[0]["CAname"].ToString();
                txt_discription.Text = dt.Rows[0]["CAdescription"].ToString();
                txt_status.Text = dt.Rows[0]["CAstatus"].ToString();
            }
        }
        catch (Exception ex)
        {
            lbl_Msg.Text = "Error: " + ex.Message;
            lbl_Msg.ForeColor = System.Drawing.Color.Red;
        }
    }

    protected void Signout_Click(object sender, EventArgs e)
    {
        Session.Remove("adid");
        Response.Redirect("Ad_login.aspx");
    }

    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        try
        {
            String picture, fn, ext, id, path;
            FileInfo finfo;

            if (FileUpload1.HasFile)
            {
                fn = FileUpload1.FileName; finfo = new FileInfo(fn); ext = finfo.Extension;

                id = Guid.NewGuid().ToString();
                path = MapPath("img");

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                path = Path.Combine(path, id + ext);
                FileUpload1.SaveAs(path);

                picture = "UPDATE Category_tb SET CAphoto='img\\" + id + ext + "',CAname='" + txt_name.Text + "',CAdescription='" + txt_discription.Text + "',CAstatus='" + txt_status.Text + "'where CAid=" + Session["upid"].ToString();
                c1.ExeQry(picture);
            }
            else
            {
                picture = "UPDATE Category_tb SET CAname='" + txt_name.Text + "',CAdescription='" + txt_discription.Text + "',CAstatus='" + txt_status.Text + "'where CAid=" + Session["upid"].ToString();
                c1.ExeQry(picture);
            }
            Response.Redirect("Ad_Category_view.aspx");
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
        //    SEqry = "SELECT *,CASE WHEN CAstatus=1 THEN 'Enable' ELSE 'disable' END AS status1 FROM Category_tb where CAname LIKE '%" + txt_search.Text + "%'";

        //    DataTable dt = new DataTable();
        //    dt = c1.GetDT(SEqry);

        //    DataList1.DataSource = dt;
        //    DataList1.DataBind();
        //}
        //catch (Exception ex)
        //{
        //    lbl_Msg.Text = "Error: " + ex.Message;
        //    lbl_Msg.ForeColor = System.Drawing.Color.Red;
        //}
    }
}