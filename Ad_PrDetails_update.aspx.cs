using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_PrDetails_update : System.Web.UI.Page
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
            lblErrorMAS.ForeColor = System.Drawing.Color.Red;
        }

        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string qry;

        DataTable dt = new DataTable();
        qry = "SELECT * FROM ProDetails_tb where PDid =" + Session["proDE"].ToString();

        dt = c1.GetDT(qry);

        if (dt.Rows.Count > 0)
        {
            txt_description.Text = dt.Rows[0]["Des"].ToString();
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
        String qry, fn, ext, path, fn1, ext1, path1;
        FileInfo finfo, finfo1;

        if (FileUpload1.HasFile)
        {
            fn = FileUpload1.FileName;finfo = new FileInfo(fn);ext = finfo.Extension;
            fn1 = FileUpload2.FileName;finfo1 = new FileInfo(fn1);ext1 = finfo1.Extension;

            path = MapPath("img");
            path = path + "\\" + ext;

            path1 = MapPath("img");
            path1 = path1 + "\\" + ext1;

            FileUpload1.SaveAs(path);
            FileUpload2.SaveAs(path1);

            qry = "UPDATE ProDetails_tb SET picture1='img\\" + fn + "',picture2='img\\" + fn1 + "'";
            qry = qry + ",Des='" + txt_description.Text + "' where  PDid=" + Session["proDE"].ToString();
            c1.ExeQry(qry);
             Response.Redirect("Ad_PrDetails_view.aspx");
        }
        else
        {
            qry = "UPDATE ProDetails_tb SET Des='" + txt_description.Text + "' where PDid=" + Session["proDE"].ToString();
            c1.ExeQry(qry);
             Response.Redirect("Ad_PrDetails_view.aspx");
        }
        }
            catch (Exception ex)
        {
            lbl_Msg.Text = ex.Message.ToString();
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