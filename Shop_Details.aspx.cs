using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Shop_Details : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        string qry;
        DataTable dt = new DataTable();

        if (Session["usid"] == null)
        {
            Session["ReturnUrl"] = Request.Url.AbsoluteUri;
            Response.Redirect("Sign_in.aspx");
        }
        else
        {
            qry = "select * from User_tb where status=1 and USid =" + Session["usid"].ToString();
            dt = c1.GetDT(qry);

            if (dt.Rows.Count > 0)
            {
                string photo = dt.Rows[0]["photo"] as string;
                if (string.IsNullOrEmpty(photo))
                {
                    IMg_Av.Visible = true;
                }
                else
                {
                    qry = "Select * from User_tb where Usid =" + Session["usid"].ToString();
                    Repeater3.DataSource = c1.GetDT(qry);
                    Repeater3.DataBind();
                }
            }
        }

        if (Session["Proid"] == null)
            Response.Redirect("Shop.aspx");
        
        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
            string query,abc;
            query = "SELECT ProDetails_tb.PRid,ProDetails_tb.Des,ProDetails_tb.Picture1,ProDetails_tb.Picture2,Product_tb.photo,Product_tb.name,Product_tb.price,Product_tb.description,Product_tb.CAid FROM ProDetails_tb INNER JOIN Product_tb ON ProDetails_tb.PRid = Product_tb.PRid where Product_tb.PRid ='" + Session["Proid"] + "'";

            Repeater1.DataSource = c1.GetDT(query);
            Repeater1.DataBind();

            abc = "SELECT * FROM Product_tb,Category_tb where Product_tb.CAid = Category_tb.CAid and Product_tb.PRid ='" + Session["Proid"] + "'";

            Repeater2.DataSource = c1.GetDT(abc);
            Repeater2.DataBind();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string CAid, Prid, QuCa, cnt, Qty = "1", price;

        CAid = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl__CAid")).Text;
        Prid = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_PRid")).Text;
        price = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Price")).Text;

        if (e.CommandName == "Cart")
        {
            QuCa = "SELECT Count(*) FROM Cart_tb WHERE PRid=" + Prid;
            cnt = c1.getScalar(QuCa);

            if (Convert.ToInt32(cnt) > 0)
            {
                Response.Redirect("cart.aspx");
            }
            else
            {
                QuCa = "INSERT INTO Cart_tb(USid,PDid,PRid,Qty,Total)VALUES ('" + Session["usid"] + "', '" + CAid + "','" + Session["Proid"] + "','" + Qty + "','" + price + "')";

                c1.ExeQry(QuCa);
                Response.Redirect("cart.aspx");
            }
        }

        else if (e.CommandName == "Buy")
        {
            Session.Add("proID", Prid);
            Response.Redirect("Buynow.aspx");
        }
    }

    protected void Sign_Click(object sender, EventArgs e)
    {
        Session.Remove("usid");
        FillDetails();
        Response.Redirect("Sign_in.aspx");
    }

}

