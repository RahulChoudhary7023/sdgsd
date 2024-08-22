using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Product_update : System.Web.UI.Page
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
            lblErrorMAS.Text = "Error: " + ex.Message;
            lblErrorMAS.ForeColor = System.Drawing.Color.Red;
        }

        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        try
        {
        string qry;
        DataTable dt = new DataTable();

        qry = "SELECT * FROM Product_tb where PRid =" + Session["ProId"].ToString();
        dt = c1.GetDT(qry);

        if(dt.Rows.Count > 0)
        {
            txt_name.Text = dt.Rows[0]["name"].ToString();
            txt_discription.Text = dt.Rows[0]["description"].ToString();
            txt_weight.Text = dt.Rows[0]["PRweight"].ToString();
            txt_country.Text = dt.Rows[0]["Country"].ToString();
            txt_dis.Text = dt.Rows[0]["disc"].ToString();
            txt_MRP.Text = dt.Rows[0]["MRP"].ToString();
        }
      }
      catch(Exception ex)
        {
            lblErrorMAS.Text = "Error: " + ex.Message;
            lblErrorMAS.ForeColor = System.Drawing.Color.Red;
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
        String picture, fn, ext, path,DIprice,PERgm;
        FileInfo finfo;

        decimal weight = Convert.ToDecimal(txt_weight.Text);
        decimal mrp = Convert.ToDecimal(txt_MRP.Text);
        decimal discountPercentage = Convert.ToDecimal(txt_dis.Text);

        decimal discountAmount = (mrp * discountPercentage) / 100;
        decimal finalPrice = mrp - discountAmount;

        decimal pricePer100g = (finalPrice / weight) * 100;

        DIprice = finalPrice.ToString();
        PERgm =  pricePer100g.ToString();

        if(FileUpload1.HasFile)
        {
            fn = FileUpload1.FileName; finfo = new FileInfo(fn); ext = finfo.Extension;

            path = Server.MapPath("img");
            path = path + "\\" + ext;
            FileUpload1.SaveAs(path);

            picture = "UPDATE Product_tb SET photo='img\\" + fn + "',name='" + txt_name.Text + "'";
            picture = picture + ",description='" + txt_discription.Text + "',Rate='" + PERgm + "'";
            picture = picture + ",Country='" + txt_country.Text + "',disc='" + txt_dis.Text + "'";
            picture = picture + ",price='" + DIprice + "',MRP='" + txt_MRP.Text + "',PRweight='" + txt_weight.Text + "'";
            picture = picture + "where  PRid=" + Session["ProId"].ToString();
            c1.ExeQry(picture);
        }
        else
        {
            picture = "UPDATE Product_tb SET name='" + txt_name.Text + "',description='" + txt_discription.Text + "'";
            picture = picture + ",Rate='" + PERgm + "',Country='" + txt_country.Text + "',disc='" + txt_dis.Text + "'";
            picture = picture + ",price='" + DIprice + "',MRP='" + txt_MRP.Text + "',PRweight='" + txt_weight.Text + "'";
            picture = picture + "where  PRid=" + Session["ProId"].ToString();
            c1.ExeQry(picture);
        }
        Response.Redirect("Ad_Product_view.aspx");
        }

       catch (Exception ex)
       {
           lblErrorMAS.Text = "Error: " + ex.Message;
           lblErrorMAS.ForeColor = System.Drawing.Color.Red;
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