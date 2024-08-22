using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Buynow : System.Web.UI.Page
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


        if (Session["proId"] == null)
            Response.Redirect("Shop.aspx");

        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string query;

        query = "Select * FROM Product_tb where PRid =" + Session["proID"].ToString();

        Repeater1.DataSource = c1.GetDT(query);
        Repeater1.DataBind();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string prcQry;

        prcQry = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_price")).Text;

        if(e.CommandName == "chackout")
        {
            Response.Redirect("Buy_chackout.aspx");
        }

    }
   
    protected void ddlQuantity_SelectedIndexChanged(object sender, EventArgs e)
    {
        string totalAM;
    DropDownList ddl = (DropDownList)sender;
    RepeaterItem item = (RepeaterItem)ddl.NamingContainer;

    // Get the price from the label
    Label lblPrice = (Label)item.FindControl("Label4");
    decimal price = Convert.ToDecimal(lblPrice.Text);
    
    // Get the quantity from the DropDownList
    int quantity = Convert.ToInt32(ddl.SelectedValue);
    
    // Calculate the total price
    decimal totalPrice = price * quantity;
    
    // Update the labels
    Label lblTotal = (Label)item.FindControl("lblTotal");
    lblTotal.Text = String.Format("{0:F2}", totalPrice);

    totalAM = lblTotal.Text;
    Session.Add("totalAM", totalAM);
    }
}
