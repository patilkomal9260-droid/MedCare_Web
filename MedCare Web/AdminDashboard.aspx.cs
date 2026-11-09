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
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["AdminId"] == null)
            {
                Response.Redirect("AdminLogin.aspx");
                return;
            }

            if (!IsPostBack)
            {
                lblWelcome.Text =
                    "Welcome, " +
                    Session["AdminUsername"].ToString();

                LoadDashboard();
            }
        }


        private void LoadDashboard()
        {
            using (SqlConnection con =
                DBConnection.GetConnection())
            {
                con.Open();

                lblPatients.Text =
                    GetCount(con, "SELECT COUNT(*) FROM Patients");

                lblDoctors.Text =
                    GetCount(con, "SELECT COUNT(*) FROM Doctors");

                lblAppointments.Text =
                    GetCount(con, "SELECT COUNT(*) FROM Appointments");

                lblPending.Text =
                    GetCount(con,
                    "SELECT COUNT(*) FROM Appointments WHERE Status='Pending'");
            }

            LoadAppointments();
            LoadFeedback();
            LoadMessages();
        }


        private string GetCount(
            SqlConnection con, string query)
        {
            using (SqlCommand cmd =
                new SqlCommand(query, con))
            {
                return cmd.ExecuteScalar().ToString();
            }
        }


        private void LoadAppointments()
        {
            using (SqlConnection con =
                DBConnection.GetConnection())
            {
                string query = @"
                SELECT
                A.AppointmentId,
                P.FullName AS PatientName,
                D.DoctorName,
                A.AppointmentDate,
                A.AppointmentTime,
                A.Status

                FROM Appointments A

                INNER JOIN Patients P
                ON A.PatientId = P.PatientId

                INNER JOIN Doctors D
                ON A.DoctorId = D.DoctorId

                ORDER BY A.AppointmentId DESC";

                using (SqlDataAdapter da =
                    new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    gvAppointments.DataSource = dt;

                    gvAppointments.DataBind();
                }
            }
        }


        protected void gvAppointments_RowDataBound(
            object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DropDownList ddl =
                    (DropDownList)e.Row.FindControl("ddlStatus");

                if (ddl != null)
                {
                    string status =
                        DataBinder.Eval(
                            e.Row.DataItem, "Status").ToString();

                    if (ddl.Items.FindByValue(status) != null)
                    {
                        ddl.SelectedValue = status;
                    }
                }
            }
        }


        protected void gvAppointments_RowCommand(
            object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "UpdateStatus")
            {
                int appointmentId =
                    Convert.ToInt32(e.CommandArgument);

                Button btn =
                    (Button)e.CommandSource;

                GridViewRow row =
                    (GridViewRow)btn.NamingContainer;

                DropDownList ddl =
                    (DropDownList)row.FindControl("ddlStatus");

                string status = ddl.SelectedValue;

                using (SqlConnection con =
                    DBConnection.GetConnection())
                {
                    string query = @"
                    UPDATE Appointments
                    SET Status = @Status
                    WHERE AppointmentId = @AppointmentId";

                    using (SqlCommand cmd =
                        new SqlCommand(query, con))
                    {
                        cmd.Parameters.Add(
                            "@Status",
                            SqlDbType.VarChar, 30).Value = status;

                        cmd.Parameters.Add(
                            "@AppointmentId",
                            SqlDbType.Int).Value = appointmentId;

                        con.Open();

                        cmd.ExecuteNonQuery();
                    }
                }

                LoadDashboard();
            }
        }


        private void LoadFeedback()
        {
            using (SqlConnection con =
                DBConnection.GetConnection())
            {
                string query =
                    "SELECT * FROM Feedback ORDER BY FeedbackId DESC";

                using (SqlDataAdapter da =
                    new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    gvFeedback.DataSource = dt;

                    gvFeedback.DataBind();
                }
            }
        }


        private void LoadMessages()
        {
            using (SqlConnection con =
                DBConnection.GetConnection())
            {
                string query =
                    "SELECT * FROM ContactMessages ORDER BY MessageId DESC";

                using (SqlDataAdapter da =
                    new SqlDataAdapter(query, con))
                {
                    DataTable dt = new DataTable();

                    da.Fill(dt);

                    gvMessages.DataSource = dt;

                    gvMessages.DataBind();
                }
            }
        }
     

        protected void btnLogout_Click(object sender, EventArgs e)
        {
            Session.Remove("AdminId");

            Session.Remove("AdminUsername");

            Response.Redirect("AdminLogin.aspx");
        }
    }
}