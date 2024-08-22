using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Product_add : System.Web.UI.Page
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
        if (Session["Ctgid"] == null)
            Response.Redirect("Ad_Product_add.aspx");
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
       

    }

    protected void Signout_Click(object sender, EventArgs e)
    {
        Session.Remove("adid");
        Response.Redirect("Ad_login.aspx");
    }
    
    protected void add_Click(object sender, EventArgs e)
    {
        try
        {
        String picture, fn, ext, path, DIprice, PERgm;
        FileInfo finfo;

        decimal weight = Convert.ToDecimal(txt_weight.Text);
        decimal mrp = Convert.ToDecimal(txt_MRP.Text);
        decimal discountPercentage = Convert.ToDecimal(txt_disc.Text);

        decimal discountAmount = (mrp * discountPercentage) / 100;
        decimal finalPrice = mrp - discountAmount;

        decimal pricePer100g = (finalPrice / weight) * 100;

        DIprice = finalPrice.ToString();
        PERgm = pricePer100g.ToString();

        fn = FileUpload1.FileName;
        finfo = new FileInfo(fn);
        ext = finfo.Extension;

        path = MapPath("img");
        path = path + "\\" + ext;

        FileUpload1.SaveAs(path);

        picture = "INSERT INTO Product_tb(photo,name,description,price,disc,Rate,Country,status,CAid,PRweight,MRP)";
        picture = picture + "VALUES ('img\\" + fn + "','" + txt_name.Text + "','" + txt_description.Text + "'";
        picture = picture + ",'" + DIprice + "','" + txt_disc.Text + "','" + PERgm + "','" + txt_country.Text + "'";
        picture = picture + ",1,'" + Session["Ctgid"] + "','" + txt_weight.Text + "','" + txt_MRP.Text + "')";

        c1.ExeQry(picture);
        Response.Redirect("Ad_Product_view.aspx");
      }
      
      catch(Exception ex)
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