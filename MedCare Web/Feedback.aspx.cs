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
    public partial class Feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtName.Text) ||
                string.IsNullOrWhiteSpace(txtEmail.Text) ||
                ddlDepartment.SelectedValue == "" ||
                ddlRating.SelectedValue == "" ||
                string.IsNullOrWhiteSpace(txtComments.Text))
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
                    INSERT INTO Feedback
                    (FullName, Email, Department,
                     Rating, Comments)

                    VALUES
                    (@Name, @Email, @Department,
                     @Rating, @Comments)";

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
                            "@Department",
                            SqlDbType.VarChar, 100).Value =
                            ddlDepartment.SelectedValue;

                        cmd.Parameters.Add(
                            "@Rating",
                            SqlDbType.Int).Value =
                            Convert.ToInt32(
                                ddlRating.SelectedValue);

                        cmd.Parameters.Add(
                            "@Comments",
                            SqlDbType.VarChar, 500).Value =
                            txtComments.Text.Trim();

                        con.Open();

                        cmd.ExecuteNonQuery();

                        lblMessage.ForeColor =
                            System.Drawing.Color.Green;

                        lblMessage.Text =
                            "Thank You! Feedback Submitted Successfully.";

                        txtName.Text = "";
                        txtEmail.Text = "";
                        txtComments.Text = "";

                        ddlDepartment.SelectedIndex = 0;
                        ddlRating.SelectedIndex = 0;
                    }
                }
            }

            catch (Exception)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Unable to submit feedback. Please try again.";
            }
        }
    }
}