using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Buy_chackout : System.Web.UI.Page
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
            lbl_SubTo.Text = Session["totalAM"].ToString();
            lbl_Amount.Text = Session["totalAM"].ToString();
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            string query,OMid;

            query = "insert into OrderMaster_tb (name,Country,number,email,pincode,StreetAdd1,StreetAdd2,State,Amount,Status,Tax,RegID,OrderDate)";
            query = query + " OUTPUT INSERTED.OMID VALUES('" + txt_name.Text + "','" + txt_country.Text + "','" + txt_mobile.Text + "','" + txt_email.Text + "',";
            query = query + "'" + txt_pin.Text + "','" + txt_street1.Text + "','" + txt_street2.Text + "','" + txt_state.Text + "',";
            query = query + "'" + lbl_Amount.Text + "',0,0,'" + Session["usid"] + "','" + DateTime.Today + "')";

            OMid = c1.getScalar(query);

             query = " INSERT INTO OrderDetails_tb (OMid, ProductID, Qty, Price)";
             query = query + " SELECT " + OMid + ", PRid,Qty,Total from Cart_tb";
             query = query + " where USid ='" + Session["usid"] + "'";

             c1.ExeQry(query);
            Response.Redirect("Thank you.aspx");
        }
}