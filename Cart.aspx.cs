using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Cart : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        string qry;
        DataTable dt = new DataTable();

        if (Session["usid"] == null)
        {
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


        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        try
        {
        string query,abc;
        DataTable dt = new DataTable();
            
        query = "SELECT * FROM Product_tb,Cart_tb where Product_tb.PRid = Cart_tb.PRid and Cart_tb.USid ='" + Session["usid"] + "'";
      
        Repeater1.DataSource = c1.GetDT(query);
        Repeater1.DataBind();

        abc = "SELECT sum(qty*price) as Total FROM Product_tb,Cart_tb where Product_tb.PRid=Cart_tb.PRid and Cart_tb.USid='" + Session["usid"] + "'";
        dt = c1.GetDT(abc);

        if (dt.Rows.Count > 0)
        {
            lbl_total.Text = dt.Rows[0]["Total"].ToString();
            double total;
            if (double.TryParse(lbl_total.Text, out total))
            {
                lbl_total.Text = String.Format("{0:n}", total);
            }
            else
            {
                lbl_total.Text = "Invalid format";
            }
        }
      }
        catch (Exception ex)
        {
            lbl_total.Text = "Error: " + ex.Message;
        }
    }

     protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string  qry, ctid,price;
        int qtid,pce;

        qtid = int.Parse(((TextBox)Repeater1.Items[e.Item.ItemIndex].FindControl("qtyTextBox")).Text);
        ctid = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_cid")).Text;

        price = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_price")).Text;
        pce = Convert.ToInt32(price);

     if (e.CommandName == "Delete")
        {
            qry = "DELETE FROM Cart_tb where Cid =" + ctid;
            c1.ExeQry(qry);
            FillDetails();
        }
     else if (e.CommandName == "Increase")
     {
         string query = "UPDATE Cart_tb SET qty = qty + 1 , Total='" + (qtid + 1)*pce + "'  WHERE Cid ='" + ctid + "'";
         c1.ExeQry(query);
         FillDetails();
     }
     else if (e.CommandName == "Decrease" && qtid > 1)
     {
         string query = "UPDATE Cart_tb SET qty = qty - 1 , Total= '" + (qtid - 1) * pce + "' WHERE Cid ='" + ctid + "'";
         c1.ExeQry(query);
         FillDetails();
     }
    }

     protected void Button1_Click(object sender, EventArgs e)
     {
         Session.Add("ToAm", lbl_total.Text);
         Response.Redirect("Cart_Chackout.aspx");
     }
}
       
  

