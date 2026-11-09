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
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            {
                if (!Page.IsValid)
                    return;

                string name = txtName.Text.Trim();

                int age = Convert.ToInt32(txtAge.Text);

                string gender = ddlGender.SelectedValue;

                string mobile = txtMobile.Text.Trim();

                string email = txtEmail.Text.Trim();

                string address = txtAddress.Text.Trim();

                string username = txtUsername.Text.Trim();

                string password = txtPassword.Text;

                // Generate password hash
                byte[] salt = new byte[16];

                using (var rng = RandomNumberGenerator.Create())
                {
                    rng.GetBytes(salt);
                }

                byte[] hash;

                using (var pbkdf2 =
                    new Rfc2898DeriveBytes(password, salt, 100000))
                {
                    hash = pbkdf2.GetBytes(32);
                }

                string storedPassword =
                    Convert.ToBase64String(salt) + ":" +
                    Convert.ToBase64String(hash);

                try
                {
                    using (SqlConnection con =
                        DBConnection.GetConnection())
                    {
                        string query = @"
                    INSERT INTO Patients
                    (FullName, Age, Gender, Mobile,
                     Email, Address, Username, Password)

                    VALUES
                    (@Name, @Age, @Gender, @Mobile,
                     @Email, @Address, @Username, @Password)";

                        using (SqlCommand cmd =
                            new SqlCommand(query, con))
                        {
                            cmd.Parameters.AddWithValue("@Name", name);

                            cmd.Parameters.AddWithValue("@Age", age);

                            cmd.Parameters.AddWithValue("@Gender", gender);

                            cmd.Parameters.AddWithValue("@Mobile", mobile);

                            cmd.Parameters.AddWithValue("@Email", email);

                            cmd.Parameters.AddWithValue("@Address", address);

                            cmd.Parameters.AddWithValue("@Username", username);

                            cmd.Parameters.AddWithValue("@Password", storedPassword);

                            con.Open();

                            cmd.ExecuteNonQuery();

                            lblMessage.ForeColor =
                                System.Drawing.Color.Green;

                            lblMessage.Text =
                                "Registration Successful!";
                        }
                    }
                }

                catch (SqlException ex)
                {
                    if (ex.Number == 2627 || ex.Number == 2601)
                    {
                        lblMessage.ForeColor =
                            System.Drawing.Color.Red;

                        lblMessage.Text =
                            "Username already exists!";
                    }
                    else
                    {
                        lblMessage.ForeColor =
                            System.Drawing.Color.Red;

                        lblMessage.Text =
                            "Database Error. Please try again.";
                    }
                }

                catch (Exception)
                {
                    lblMessage.ForeColor =
                        System.Drawing.Color.Red;

                    lblMessage.Text =
                        "Something went wrong!";
                }
            }
        }
    }
}