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
    public partial class Appointment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["PatientId"] == null)
            {
                Response.Redirect("Login.aspx");
                return;
            }

            if (!IsPostBack)
            {
                txtPatientName.Text =
                    Session["PatientName"].ToString();

                LoadDoctors();

                txtDate.Attributes["min"] =
                    DateTime.Today.ToString("yyyy-MM-dd");
            }
        }


        // Load Doctors From Database

        private void LoadDoctors()
        {
            using (SqlConnection con =
                DBConnection.GetConnection())
            {
                string query =
                    "SELECT DoctorId, DoctorName, Specialization FROM Doctors";

                using (SqlDataAdapter da =
                    new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    ddlDoctor.DataSource = dt;

                    ddlDoctor.DataTextField =
                        "DoctorName";

                    ddlDoctor.DataValueField =
                        "DoctorId";

                    ddlDoctor.DataBind();

                    ddlDoctor.Items.Insert(
                        0,
                        new System.Web.UI.WebControls.ListItem(
                            "Select Doctor", ""));
                }
            }
        }


        // Show Doctor Specialization

        protected void ddlDoctor_SelectedIndexChanged(
            object sender, EventArgs e)
        {
            txtSpecialization.Text = "";

            if (ddlDoctor.SelectedValue == "")
                return;

            using (SqlConnection con =
                DBConnection.GetConnection())
            {
                string query =
                    @"SELECT Specialization
                      FROM Doctors
                      WHERE DoctorId = @DoctorId";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue(
                        "@DoctorId",
                        Convert.ToInt32(
                            ddlDoctor.SelectedValue));

                    con.Open();

                    object result = cmd.ExecuteScalar();

                    if (result != null)
                    {
                        txtSpecialization.Text =
                            result.ToString();
                    }
                }
            }
        }

        // Book Appointment
        protected void btnBook_Click(object sender, EventArgs e)
        {
            if (ddlDoctor.SelectedValue == "")
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please Select Doctor!";

                return;
            }

            if (string.IsNullOrWhiteSpace(txtDate.Text))
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please Select Appointment Date!";

                return;
            }

            if (ddlTime.SelectedValue == "")
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please Select Appointment Time!";

                return;
            }

            DateTime appointmentDate;

            if (!DateTime.TryParse(
                txtDate.Text, out appointmentDate))
            {
                lblMessage.Text = "Invalid Date!";
                return;
            }

            if (appointmentDate.Date < DateTime.Today)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Please Select Future Date!";

                return;
            }

            try
            {
                int patientId =
                    Convert.ToInt32(Session["PatientId"]);

                int doctorId =
                    Convert.ToInt32(ddlDoctor.SelectedValue);

                using (SqlConnection con =
                    DBConnection.GetConnection())
                {
                    string query = @"
                    INSERT INTO Appointments
                    (PatientId, DoctorId,
                     AppointmentDate, AppointmentTime, Status)

                    VALUES
                    (@PatientId, @DoctorId,
                     @Date, @Time, 'Pending')";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@PatientId",
                            SqlDbType.Int).Value = patientId;

                        cmd.Parameters.Add(
                            "@DoctorId",
                            SqlDbType.Int).Value = doctorId;

                        cmd.Parameters.Add(
                            "@Date",
                            SqlDbType.Date).Value =
                            appointmentDate.Date;

                        cmd.Parameters.Add(
                            "@Time",
                            SqlDbType.VarChar, 30).Value =
                            ddlTime.SelectedValue;

                        con.Open();

                        cmd.ExecuteNonQuery();

                        lblMessage.ForeColor =
                            System.Drawing.Color.Green;

                        lblMessage.Text =
                            "Appointment Booked Successfully!";

                        ddlDoctor.SelectedIndex = 0;

                        txtSpecialization.Text = "";

                        txtDate.Text = "";

                        ddlTime.SelectedIndex = 0;
                    }
                }
            }

            catch (Exception)
            {
                lblMessage.ForeColor =
                    System.Drawing.Color.Red;

                lblMessage.Text =
                    "Unable to book appointment. Please try again.";
            }
        }

    }

}