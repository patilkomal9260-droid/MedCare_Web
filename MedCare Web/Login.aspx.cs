using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MedCare_Web
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (!Page.IsValid)
                return;

            string username = txtUsername.Text.Trim();

            string password = txtPassword.Text;

            try
            {
                using (SqlConnection con =
                    DBConnection.GetConnection())
                {
                    string query = @"
                    SELECT PatientId, FullName, Password
                    FROM Patients
                    WHERE Username = @Username";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.AddWithValue(
                            "@Username", username);

                        con.Open();

                        using (SqlDataReader dr =
                            cmd.ExecuteReader())
                        {
                            if (dr.Read())
                            {
                                string storedPassword =
                                    dr["Password"].ToString();

                                if (VerifyPassword(
                                    password, storedPassword))
                                {
                                    Session["PatientId"] =
                                        dr["PatientId"];

                                    Session["PatientName"] =
                                        dr["FullName"].ToString();

                                    Session["Username"] =
                                        username;

                                    Response.Redirect(
                                        "PatientDashboard.aspx");
                                }
                                else
                                {
                                    lblMessage.ForeColor =
                                        System.Drawing.Color.Red;

                                    lblMessage.Text =
                                        "Invalid Username or Password!";
                                }
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

            catch (Exception)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Something went wrong. Try again.";
            }
        }


        private bool VerifyPassword(
            string password, string storedPassword)
        {
            try
            {
                string[] parts =
                    storedPassword.Split(':');

                if (parts.Length != 2)
                    return false;

                byte[] salt =
                    Convert.FromBase64String(parts[0]);

                byte[] savedHash =
                    Convert.FromBase64String(parts[1]);

                using (var pbkdf2 =
                    new Rfc2898DeriveBytes(
                        password, salt, 100000))
                {
                    byte[] enteredHash =
                        pbkdf2.GetBytes(32);

                    if (enteredHash.Length != savedHash.Length)
                        return false;

                    var diff = (uint)enteredHash.Length ^ (uint)savedHash.Length;
                    for (int i = 0; i < enteredHash.Length; i++)
                    {
                        diff |= (uint)(enteredHash[i] ^ savedHash[i]);
                    }
                    return diff == 0;
                }
            }
            catch
            {
                return false;
            }
        }

    }
}
