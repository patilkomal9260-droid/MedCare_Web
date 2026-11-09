<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="PatientDashboard.aspx.cs" Inherits="MedCare_Web.PatientDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .patient-dashboard {
    max-width: 1100px;
    margin: 40px auto;
    padding: 20px;
}

.patient-dashboard h2 {
    color: #2563eb;
    margin-bottom: 20px;
}

.dashboard-cards {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin: 30px 0;
}

.dashboard-card {
    background: #eff6ff;
    padding: 25px;
    border-radius: 12px;
    text-align: center;
}

.dashboard-card h3 {
    color: #2563eb;
}

.number {
    font-size: 30px;
    font-weight: bold;
}

.appointment-grid {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

.appointment-grid th {
    background: #2563eb;
    color: white;
    padding: 12px;
}

.appointment-grid td {
    padding: 12px;
    border: 1px solid #ddd;
}

@media(max-width:700px) {
    .dashboard-cards {
        grid-template-columns: 1fr;
    }
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="patient-dashboard">

    <h2>Patient Dashboard</h2>

    <h3>
        Welcome,
        <asp:Label ID="lblPatientName"
        runat="server"></asp:Label>
    </h3>

    <div class="dashboard-cards">

        <div class="dashboard-card">
            <h3>My Appointments</h3>

            <asp:Label ID="lblTotalAppointments"
            runat="server"
            CssClass="number">
            0
            </asp:Label>
        </div>

        <div class="dashboard-card">
            <h3>Pending</h3>

            <asp:Label ID="lblPending"
            runat="server"
            CssClass="number">
            0
            </asp:Label>
        </div>

        <div class="dashboard-card">
            <h3>Completed</h3>

            <asp:Label ID="lblCompleted"
            runat="server"
            CssClass="number">
            0
            </asp:Label>
        </div>

    </div>

    <h2>My Appointment History</h2>

    <asp:GridView ID="gvAppointments"
    runat="server"
    AutoGenerateColumns="False"
    CssClass="appointment-grid"
    EmptyDataText="No Appointments Found">

        <Columns>

            <asp:BoundField
            DataField="AppointmentId"
            HeaderText="Appointment ID" />

            <asp:BoundField
            DataField="DoctorName"
            HeaderText="Doctor Name" />

            <asp:BoundField
            DataField="Specialization"
            HeaderText="Specialization" />

            <asp:BoundField
            DataField="AppointmentDate"
            HeaderText="Date"
            DataFormatString="{0:dd-MM-yyyy}" />

            <asp:BoundField
            DataField="AppointmentTime"
            HeaderText="Time" />

            <asp:BoundField
            DataField="Status"
            HeaderText="Status" />

        </Columns>

    </asp:GridView>

</div>
</asp:Content>
