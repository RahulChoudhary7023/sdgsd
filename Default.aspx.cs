using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Home : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        string qry;
        DataTable dt = new DataTable();

          if(Session["usid"] == null)
        {
            
            Pro_HY.Visible = true;
            Session["ReturnUrl"] = Request.Url.AbsoluteUri;
        }
          else
          {
              Hyper_order.Visible = true;
              qry = "select * from UserTB where status=1 and USid =" + Session["usid"].ToString();
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
                      qry = "Select * from UserTB where Usid =" + Session["usid"].ToString();
                      Repeater2.DataSource = c1.GetDT(qry);
                      Repeater2.DataBind();
                  }
              }
          }

        if(!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string query,abc;

        query = "SELECT * FROM CategoryTB where CAstatus=1 order by CAid";

        Repeater1.DataSource = c1.GetDT(query);
        Repeater1.DataBind();

        abc = "SELECT * FROM ProductTB where status=1 and CAid ='" + 9+"'";

        Repeater3.DataSource = c1.GetDT(abc);
        Repeater3.DataBind();
    }
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id;

        id = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Caid")).Text;

        if(e.CommandName == "shopid")
        {
            Session.Add("caid", id);
            Response.Redirect("shop.aspx");
        }
    }

    protected void shop_Click(object sender, EventArgs e)
    {
        Session.Remove("caid");
        FillDetails();
        Response.Redirect("shop.aspx");
    }
    protected void Sign_Click(object sender, EventArgs e)
    {
        Session.Remove("usid");
        FillDetails();
        Response.Redirect("Sign_in.aspx");
    }

    public string TruncateDescription(string description, int maxWords)
    {
        if (string.IsNullOrEmpty(description)) return description;

        var words = description.Split(' ');
        if (words.Length <= maxWords) return description;

        return string.Join(" ", words.Take(maxWords)) + "...";
    }
    protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id, QuCa, price;

        id = ((Label)Repeater3.Items[e.Item.ItemIndex].FindControl("lbl_PRid")).Text;
        price = ((Label)Repeater3.Items[e.Item.ItemIndex].FindControl("lbl_Pric")).Text;

        if (e.CommandName == "Addcart")
        {
            if (Session["usid"] == null)
            {
                Response.Redirect("Sign_in.aspx");
                Session["ReturnUrl"] = Request.Url.AbsoluteUri;
            }
            else
            {
                QuCa = "INSERT INTO CartTB(USid,PRid,Qty,Total)VALUES ('" + Session["usid"] + "','" + id + "',1,'" + price + "')";
                c1.ExeQry(QuCa);
            }
        }
        else if (e.CommandName == "Productid")
        {
            if (Session["usid"] == null)
            {
                Response.Redirect("Sign_in.aspx");
                Session["ReturnUrl"] = Request.Url.AbsoluteUri;
            }
            else
            {
                Session.Add("Proid", id);
                Response.Redirect("Shop_Details.aspx");
            }
        }
    }
}