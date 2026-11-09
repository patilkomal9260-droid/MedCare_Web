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
    public partial class PatientDashboard : System.Web.UI.Page
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
                lblPatientName.Text =
                    Session["PatientName"].ToString();

                LoadPatientDashboard();
            }
        }


        private void LoadPatientDashboard()
        {
            int patientId =
                Convert.ToInt32(Session["PatientId"]);

            using (SqlConnection con =
                DBConnection.GetConnection())
            {
                con.Open();

                string countQuery = @"
                SELECT
                COUNT(*) AS TotalAppointments,

                SUM(CASE WHEN Status = 'Pending'
                THEN 1 ELSE 0 END) AS PendingAppointments,

                SUM(CASE WHEN Status = 'Completed'
                THEN 1 ELSE 0 END) AS CompletedAppointments

                FROM Appointments

                WHERE PatientId = @PatientId";

                using (SqlCommand cmd =
                    new SqlCommand(countQuery, con))
                {
                    cmd.Parameters.Add(
                        "@PatientId",
                        SqlDbType.Int).Value = patientId;

                    using (SqlDataReader dr =
                        cmd.ExecuteReader())
                    {
                        if (dr.Read())
                        {
                            lblTotalAppointments.Text =
                                dr["TotalAppointments"].ToString();

                            lblPending.Text =
                                dr["PendingAppointments"].ToString();

                            lblCompleted.Text =
                                dr["CompletedAppointments"].ToString();
                        }
                    }
                }
            }

            LoadAppointmentHistory(patientId);
        }


        private void LoadAppointmentHistory(int patientId)
        {
            using (SqlConnection con =
                DBConnection.GetConnection())
            {
                string query = @"
                SELECT
                A.AppointmentId,
                D.DoctorName,
                D.Specialization,
                A.AppointmentDate,
                A.AppointmentTime,
                A.Status

                FROM Appointments A

                INNER JOIN Doctors D

                ON A.DoctorId = D.DoctorId

                WHERE A.PatientId = @PatientId

                ORDER BY A.AppointmentId DESC";

                using (SqlCommand cmd =
                    new SqlCommand(query, con))
                {
                    cmd.Parameters.Add(
                        "@PatientId",
                        SqlDbType.Int).Value = patientId;

                    using (SqlDataAdapter da =
                        new SqlDataAdapter(cmd))
                    {
                        DataTable dt = new DataTable();

                        da.Fill(dt);

                        gvAppointments.DataSource = dt;

                        gvAppointments.DataBind();
                    }
                }
            }
        }
        

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Clear();

            Session.Abandon();

            Response.Redirect("Home.aspx");
        }
    
    }
}