using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Order : System.Web.UI.Page
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
        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
        string query,selectedStatus;
        selectedStatus = DropStatusID.SelectedValue.ToString();

        query = "SELECT *,CASE " + "WHEN status = 0 THEN 'Pending' " + "WHEN status = 1 THEN 'InTransit' " + "WHEN status = 2 THEN 'Cancelled' " +
       "WHEN status = 3 THEN 'Success' " +"ELSE 'Unknown' END AS status1 FROM OrderMaster_tb WHERE Regid = '"+ Session["usid"]+"'";

        query = query + "and status = '" + selectedStatus + "' ORDER BY OMid";

        Repeater1.DataSource = c1.GetDT(query);
        Repeater1.DataBind();
    }

    protected void Sign_Click(object sender, EventArgs e)
    {
        Session.Remove("usid");
        FillDetails();
        Response.Redirect("Sign_in.aspx");
    }
            
    protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        string ORid;

        ORid = ((Label)Repeater1.Items[e.Item.ItemIndex].FindControl("lbl_omid")).Text; 

        if(e.CommandName == "Details")
        {
            Session.Add("ORDid", ORid);
            Response.Redirect("OrderDetails.aspx");
        }
    }
    protected void DropStatusID_SelectedIndexChanged(object sender, EventArgs e)
    {
        FillDetails();
    }
}