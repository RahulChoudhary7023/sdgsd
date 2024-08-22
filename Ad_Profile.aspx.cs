using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.IO;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ad_Profile : System.Web.UI.Page
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
                        Ima_avataer2.Visible = true;
                    }
                    else
                    {
                        query = "Select * from tb_admin where ADid =" + Session["adid"].ToString();
                        Repeater3.DataSource = c1.GetDT(query);
                        Repeater3.DataBind();
                    }
                }
            }
        }
        catch(Exception ex)
        {
            lbl_ErrorMsg.Text = "Error: " + ex.Message;
            lbl_ErrorMsg.ForeColor = System.Drawing.Color.Red;
        }

        if(!IsPostBack)
        FillDetails();
    }

    private void FillDetails()
    {
        try
        {
            string abc;
            DataTable dt = new DataTable();

            abc = "SELECT * from tb_admin where ADid =" + Session["adid"].ToString();
            dt = c1.GetDT(abc);

            if (dt.Rows.Count > 0)
            {
                txt_name.Text = dt.Rows[0]["ADname"].ToString();
                txt_phone.Text = dt.Rows[0]["ADmobile"].ToString();
                txt_email.Text = dt.Rows[0]["ADemail"].ToString();
                txt_address.Text = dt.Rows[0]["ADaddress"].ToString();
            }
            Repeater1.DataSource = c1.GetDS(abc);
            Repeater1.DataBind();

            Repeater2.DataSource = c1.GetDS(abc);
            Repeater2.DataBind();

            Repeater3.DataSource = c1.GetDS(abc);
            Repeater3.DataBind();
        }
        catch(Exception ex)
        {
            lbl_ErrorMsg.Text = "Error: " + ex.Message;
            lbl_ErrorMsg.ForeColor = System.Drawing.Color.Red;
        }
    }

     protected void UPDATE_Click(object sender, EventArgs e)
     {
         try
         {
             string qry, path, fn, ext;
             FileInfo finfo;

             if (FileUpload1.HasFile)
             {
                 fn = FileUpload1.FileName;
                 finfo = new FileInfo(fn);
                 ext = finfo.Extension;

                 path = MapPath("img");
                 path = path + "\\" + ext;

                 FileUpload1.SaveAs(path);

                 qry = "UPDATE tb_admin SET ADphoto ='img\\" + fn + "' ,ADname='" + txt_name.Text + "',ADmobile='" + txt_phone.Text + "',ADaddress='" + txt_address.Text + "',ADemail='" + txt_email.Text + "' where  ADid = " + Session["ADid"].ToString();
                 c1.ExeQry(qry);
             }
             else
             {
                 qry = "UPDATE tb_admin SET ADname='" + txt_name.Text + "',ADaddress='" + txt_address.Text + "',ADmobile='" + txt_phone.Text + "',ADemail='" + txt_email.Text + "' where  ADid = " + Session["ADid"].ToString();
                 c1.ExeQry(qry);
             }
             FillDetails();
         }

         catch(Exception ex)
         {
             lbl_ErrorMsg.Text = "Error: " + ex.Message;
             lbl_ErrorMsg.ForeColor = System.Drawing.Color.Red;
         }
     }

     protected void ChangePASS_Click(object sender, EventArgs e)
     {
         string qry, cnt;

         qry = "Select Count(*) From tb_admin where ADid = '" + Session["ADid"].ToString() + "' and ADPassword = '" + Cu_pass.Text + "' ";
         cnt = c1.getScalar(qry);

         if (Convert.ToInt16(cnt) == 1)
         {
             qry = "Update tb_admin Set ADPassword = '" + Ne_pass.Text + "' Where ADid = '" + Session["ADid"].ToString() + "'";
             c1.ExeQry(qry);
             Cu_pass.Text = "";
             Ne_pass.Text = "";
             Re_pass.Text = "";
             FillDetails();
         }
         else
         {
             Cu_pass.Text = "Current Password is worng";
             Cu_pass.ForeColor = System.Drawing.Color.Red;
             FillDetails();
         }
     }

     protected void Signout_Click(object sender, EventArgs e)
     {
         Session.Remove("adid");
         Response.Redirect("Ad_login.aspx");
     }

}