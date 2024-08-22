using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.IO;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class USprofile : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
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

            Repeater1.DataSource = dt;
            Repeater1.DataBind();

            if (dt.Rows.Count > 0)
            {
                txt_username.Text = dt.Rows[0]["name"].ToString();
                txt_email.Text = dt.Rows[0]["email"].ToString();
                txt_address.Text = dt.Rows[0]["USaddress"].ToString();
                txt_mobile.Text = dt.Rows[0]["mobile"].ToString();
                lbl_name.Text = dt.Rows[0]["name"].ToString();

                string photo = dt.Rows[0]["photo"] as string;
                if (string.IsNullOrEmpty(photo))
                {
                    IMG_AV.Visible = true;
                    IMG_USav.Visible = true;
                }
                else
                {
                    qry = "Select * from User_tb where USid =" + Session["usid"].ToString();
                    Repeater3.DataSource = c1.GetDT(qry);
                    Repeater3.DataBind();
                    Repeater2.DataSource = c1.GetDT(qry);
                    Repeater2.DataBind();
                }
            }
        }
    }


    protected void shop_Click(object sender, EventArgs e)
    {
        Session.Remove("caid");
        FillDetails();
        Response.Redirect("shop.aspx");
    }

    protected void Edit_Click(object sender, EventArgs e)
    {
        try
        {
            String profile, id = "", fn, ext, path;
            FileInfo finfo;

            if (FileUpload1.HasFile)
            {
                fn = FileUpload1.FileName;
                finfo = new FileInfo(fn);
                ext = finfo.Extension;

                id = Guid.NewGuid().ToString();
                path = MapPath("img");

                if (!Directory.Exists(path))
                {
                    Directory.CreateDirectory(path);
                }
                path = Path.Combine(path, id + ext);
                FileUpload1.SaveAs(path);

                profile = "UPDATE User_tb SET photo='img\\" + id + ext + "',name ='" + txt_username.Text + "',email ='" + txt_email.Text + "',USaddress ='" + txt_address.Text + "',mobile ='" + txt_mobile.Text + "' where USid ='" + Session["usid"] + "'";
                c1.ExeQry(profile);
                FillDetails();
            }
            else
            {
            profile = "UPDATE User_tb set name ='" + txt_username.Text + "',email ='" + txt_email.Text + "',USaddress ='" + txt_address.Text + "',mobile ='" + txt_mobile.Text + "' where USid ='" + Session["usid"] + "'";
            c1.ExeQry(profile);
            FillDetails();
            }
        }   
        catch (Exception ex)
        {
            lbl_error.Text = ex.Message.ToString();
            lbl_error.ForeColor = System.Drawing.Color.Red;
        }
    }
    protected void pass_Click(object sender, EventArgs e)
    {
        string qry = "", cnt;
        qry = "Select Count(*) From User_tb where USid = '" + Session["usid"].ToString() + "' and Password = '" + txt_CUpass.Text + "' ";
        cnt = c1.getScalar(qry);

        if (Convert.ToInt16(cnt) == 1)
        {
            qry = "Update User_tb Set Password = '" + txt_NEpass.Text + "' Where USid = '" + Session["usid"].ToString() + "'";
            c1.ExeQry(qry);
            txt_CUpass.Text = "";
            txt_NEpass.Text = "";
            txt_COpass.Text = "";
            FillDetails();
        }
        else
        {
            txt_CUpass.Text = "Current Password is worng";
            txt_CUpass.ForeColor = System.Drawing.Color.Red;
            FillDetails();
        }
    }
}