using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;
using System.Net.Mail;
using System.Net;
using System.Configuration;
using System.Web.UI.WebControls;

public partial class Ad_ForgetPassword : System.Web.UI.Page
{
    Class1 c1 = new Class1();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            FillDetails();
    }

    private void FillDetails()
    {
    }

    protected void login_Click(object sender, EventArgs e)
    {
        string query = "SELECT * FROM tb_admin WHERE ADemail ='" + txt_email.Text + "' ";
        DataTable dt = new DataTable();
        dt = c1.GetDT(query);

        if (dt.Rows.Count == 0)
        {
            lbl_msg.Text = "Email is wrong.";
            lbl_msg.ForeColor = System.Drawing.Color.Red;
        }
        else
        {
            string adminId = dt.Rows[0]["ADid"].ToString();
            string username = dt.Rows[0]["ADname"].ToString();
            string recipientEmail = dt.Rows[0]["ADemail"].ToString();

            string emailBody = "Hi {username},<br/><br/>Click the link below to reset your password:<br/><br/>http://localhost:49697/Ad_Resetpassword.aspx?ADid=" + adminId;

            MailMessage mailMessage = new MailMessage("ranwa658@gmail.com", recipientEmail);
            mailMessage.Subject = "Reset Password";
            mailMessage.Body = emailBody;
            mailMessage.IsBodyHtml = true;

            SmtpClient smtpClient = new SmtpClient("smtp.gmail.com", 587);
            smtpClient.Credentials = new NetworkCredential("ranwa658@gmail.com", "gyht uovc rfef amyi");
            smtpClient.EnableSsl = true;

            try
            {
                smtpClient.Send(mailMessage);
                lbl_msg.Text = "A reset link has been sent to your email address.";
                lbl_msg.ForeColor = System.Drawing.Color.Green;
            }
            catch (SmtpFailedRecipientException ex)
            {
                lbl_msg.Text = "Failed to deliver message to the recipient: " + ex.Message;
                lbl_msg.ForeColor = System.Drawing.Color.Red;
            }
            catch (Exception ex)
            {
                lbl_msg.Text = "Error sending email: " + ex.Message;
                lbl_msg.ForeColor = System.Drawing.Color.Red;
            }
        }
    }

    protected void sign_Click(object sender, EventArgs e)
    {
        Response.Redirect("Ad_register.aspx");
    }
}
