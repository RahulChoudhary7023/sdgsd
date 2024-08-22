using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Shop : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    private const int PageSize = 9;

    private int CurrentPage
    {
        get
        {
            if (ViewState["CurrentPage"] == null)
                return 0;
            else
                return (int)ViewState["CurrentPage"];
        }
        set
        {
            ViewState["CurrentPage"] = value;
        }
    }

    private int TotalPages
    {
        get
        {
            string countQuery = "SELECT COUNT(*) FROM Product_tb where status=1 and CAid ='" + Session["caid"]+"'";
            int totalRows;
            using (var conn = new SqlConnection("SERVER=DESKTOP-8H03IUM;DATABASE=Db_veg;Trusted_Connection=yes;"))
            {
                using (var cmd = new SqlCommand(countQuery, conn))
                {
                    conn.Open();
                    totalRows = (int)cmd.ExecuteScalar();
                }
            }
            return (int)Math.Ceiling((double)totalRows / PageSize);
        }
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        string qry;
        DataTable dt = new DataTable();

        if (Session["usid"] == null)
        {
            Pro_HY.Visible = true;
            Session["ReturnUrl"] = Request.Url.AbsoluteUri;
        }
        else
        {
            Hyper_order.Visible = true;
            qry = "select * from User_tb where USid =" + Session["usid"].ToString();
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
                    qry = "Select * from User_tb where status=1 and Usid =" + Session["usid"].ToString();
                    Repeater2.DataSource = c1.GetDT(qry);
                    Repeater2.DataBind();
                }
            }
        }

        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string CAqry,query = Session["caid"] == null
    ? @"SELECT * FROM Product_tb WHERE status = 1 ORDER BY PRid OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY"
    : @"SELECT * FROM Product_tb WHERE status = 1 AND CAid = @caid ORDER BY PRid OFFSET @Offset ROWS FETCH NEXT @PageSize ROWS ONLY";

        using (var conn = new SqlConnection("SERVER=DESKTOP-8H03IUM;DATABASE=Db_veg;Trusted_Connection=yes;"))
        {
            using (var cmd = new SqlCommand(query, conn))
            {
                cmd.Parameters.AddWithValue("@Offset", CurrentPage * PageSize);
                cmd.Parameters.AddWithValue("@PageSize", PageSize);
                if (Session["caid"] != null)
                {
                    cmd.Parameters.AddWithValue("@caid", Session["caid"].ToString());
                }

                conn.Open();
                DataTable dt = new DataTable();
                using (var reader = cmd.ExecuteReader())
                {
                    dt.Load(reader);
                }

                Repeater1.DataSource = dt;
                Repeater1.DataBind();
            }
        }

        RepeaterPages.DataSource = Enumerable.Range(1, TotalPages);
        RepeaterPages.DataBind();

        CAqry = "SELECT Product_tb.CAid, Category_tb.CAname, COUNT(*) AS ItemCount " +
       "FROM Product_tb INNER JOIN Category_tb ON Product_tb.CAid = Category_tb.CAid " +
       "WHERE Product_tb.status = 1 " +
       "GROUP BY Product_tb.CAid, Category_tb.CAname " +
       "ORDER BY Product_tb.CAid";

        Repeater3.DataSource = c1.GetDT(CAqry);
        Repeater3.DataBind();
    }

    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string id,price,QuCa;

        id = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_PRid")).Text;
        price = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_Pric")).Text;

        if (e.CommandName == "FilterByID")
        {
            string caid = e.CommandArgument.ToString();
            Session["caid"] = caid;
            FillDetails();
        }

        else if (e.CommandName == "Productid")
        {
            Session.Add("Proid", id);
            Response.Redirect("Shop_Details.aspx");
        }

        else if (e.CommandName == "AddCART")
        {
            if (Session["usid"] == null)
            {
                Response.Redirect("Sign_in.aspx");
                Session["ReturnUrl"] = Request.Url.AbsoluteUri;
            }
            else
            {
                QuCa = "INSERT INTO Cart_tb(USid,PRid,Qty,Total)VALUES ('" + Session["usid"] + "','" + id + "',1,'" + price + "')";
                c1.ExeQry(QuCa);
            }
        }
    }

    protected void shop_Click(object sender, EventArgs e)
    {
        Session.Remove("caid");
        FillDetails();
    }

    protected void RepeaterPages_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "PageNumber")
        {
            CurrentPage = int.Parse(e.CommandArgument.ToString()) - 1; // Convert to zero-based index
            ViewState["CurrentPage"] = CurrentPage;
            FillDetails();
        }
    }


    protected void NextPage_Click(object sender, EventArgs e)
    {
        if (CurrentPage < (TotalPages - 1))
        {
            CurrentPage++;
            FillDetails();
        }
    }

    protected void PreviousPage_Click(object sender, EventArgs e)
    {
        if (CurrentPage > 0)
        {
            CurrentPage--;
            FillDetails();
        }
    }

    public string TruncateDescription(string description, int maxWords)
    {
        if (string.IsNullOrEmpty(description)) return description;

        var words = description.Split(' ');
        if (words.Length <= maxWords) return description;

        return string.Join(" ", words.Take(maxWords)) + "...";
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {
        string selectedPrice;
        selectedPrice = "SELECT * FROM Product_tb where price>'" + TextBox1.Text + "' and  status=1";

        Repeater1.DataSource = c1.GetDT(selectedPrice);
        Repeater1.DataBind();
    }

    protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName == "product")
        {
            int CAid = Convert.ToInt32(e.CommandArgument);
            string query = "SELECT * FROM Product_tb WHERE status=1 and CAid ="+CAid;

            DataTable dt = new DataTable();
            dt = c1.GetDT(query);

            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            UpdatePanel1.Update();
        }
    }

    protected void Search_Click(object sender, EventArgs e)
    {
            string SEqry;
            SEqry = "SELECT * FROM Product_tb where name LIKE '%" + txt_search.Text + "%' and status = 1";

            DataTable dt = new DataTable();
            dt = c1.GetDT(SEqry);

            Repeater1.DataSource = dt;
            Repeater1.DataBind();
    }
}