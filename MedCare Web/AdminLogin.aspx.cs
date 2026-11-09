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
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack &&
               Session["AdminId"] != null)
            {
                Response.Redirect("AdminDashboard.aspx");
            }
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtUsername.Text) ||
                string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Enter Username and Password!";

                return;
            }

            using (SqlConnection con =
                DBConnection.GetConnection())
            {
                string query = @"
                SELECT AdminId, Username
                FROM Admin
                WHERE Username = @Username
                AND Password = @Password";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@Username",
                        SqlDbType.VarChar, 100).Value =
                        txtUsername.Text.Trim();

                    cmd.Parameters.Add(
                        "@Password",
                        SqlDbType.VarChar, 255).Value =
                        txtPassword.Text;

                    con.Open();

                    using (SqlDataReader dr =
                        cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            Session["AdminId"] =
                                dr["AdminId"].ToString();

                            Session["AdminUsername"] =
                                dr["Username"].ToString();

                            Response.Redirect(
                                "AdminDashboard.aspx");
                        }
                        else
                        {
                            lblMessage.ForeColor =
                                System.Drawing.Color.Red;

                            lblMessage.Text =
                                "Invalid Username or Password!";
                        }
                    }
                }
            }
        }
    }
}