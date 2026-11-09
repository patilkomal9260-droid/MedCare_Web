using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedCare_Web
{
    public partial class Contact1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                string.IsNullOrWhiteSpace(txtSubject.Text) ||
                string.IsNullOrWhiteSpace(txtMessage.Text))
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please fill all fields!";

                return;
            }

            try
            {
                using (SqlConnection con =
                    DBConnection.GetConnection())
                {
                    string query = @"
                    INSERT INTO ContactMessages
                    (FullName, Email, Subject, Message)

                    VALUES
                    (@Name, @Email, @Subject, @Message)";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@Name",
                            SqlDbType.VarChar, 100).Value =
                            txtName.Text.Trim();

                        cmd.Parameters.Add(
                            "@Email",
                            SqlDbType.VarChar, 100).Value =
                            txtEmail.Text.Trim();

                        cmd.Parameters.Add(
                            "@Subject",
                            SqlDbType.VarChar, 150).Value =
                            txtSubject.Text.Trim();

                        cmd.Parameters.Add(
                            "@Message",
                            SqlDbType.VarChar, 1000).Value =
                            txtMessage.Text.Trim();

                        con.Open();

                        cmd.ExecuteNonQuery();

                        lblMessage.ForeColor =
                            System.Drawing.Color.Green;

                        lblMessage.Text =
                            "Your Message Sent Successfully!";

                        txtName.Text = "";
                        txtEmail.Text = "";
                        txtSubject.Text = "";
                        txtMessage.Text = "";
                    }
                }
            }

            catch (Exception)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Unable to send message. Please try again.";
            }
        }
    }
}