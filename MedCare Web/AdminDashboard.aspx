<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="MedCare_Web.AdminDashboard" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

.dashboard {
    max-width: 1200px;
    margin: 30px auto;
    padding: 20px;
}

.dashboard h2 {
    color: #2563eb;
    text-align: center;
}

.welcome {
    text-align: center;
    margin-bottom: 30px;
}

.cards {
    display: grid;
    grid-template-columns: repeat(4, 1fr);
    gap: 20px;
    margin-bottom: 40px;
}

.card {
    padding: 25px;
    background: #eff6ff;
    border-radius: 12px;
    text-align: center;
}

.card h3 {
    color: #2563eb;
}

.number {
    font-size: 30px;
    font-weight: bold;
}

.section {
    margin-top: 35px;
    overflow-x: auto;
}

.grid {
    width: 100%;
    border-collapse: collapse;
    margin-top: 15px;
}

.grid th {
    background: #2563eb;
    color: white;
    padding: 12px;
}

.grid td {
    padding: 12px;
    border: 1px solid #ddd;
}

.logout-btn {
    padding: 10px 20px;
    background: #dc2626;
    color: white;
    border: none;
    border-radius: 6px;
    cursor: pointer;
}

@media(max-width:800px) {
    .cards {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media(max-width:500px) {
    .cards {
        grid-template-columns: 1fr;
    }
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="dashboard">

    <h2>Admin Dashboard</h2>

    <div class="welcome">

        <asp:Label ID="lblWelcome"
        runat="server">
        </asp:Label>

        <br /><br />

        <asp:Button ID="btnLogout"
        runat="server"
        Text="Logout"
        CssClass="logout-btn"
        OnClick="btnLogout_Click"/>

    </div>


    <div class="cards">

        <div class="card">
            <h3>Total Patients</h3>

            <asp:Label ID="lblPatients"
            runat="server"
            CssClass="number">
            0
            </asp:Label>
        </div>

        <div class="card">
            <h3>Total Doctors</h3>

            <asp:Label ID="lblDoctors"
            runat="server"
            CssClass="number">
            0
            </asp:Label>
        </div>

        <div class="card">
            <h3>Appointments</h3>

            <asp:Label ID="lblAppointments"
            runat="server"
            CssClass="number">
            0
            </asp:Label>
        </div>

        <div class="card">
            <h3>Pending</h3>

            <asp:Label ID="lblPending"
            runat="server"
            CssClass="number">
            0
            </asp:Label>
        </div>

    </div>


    <div class="section">

        <h2>Appointment Details</h2>

        <asp:GridView ID="gvAppointments"
        runat="server"
        AutoGenerateColumns="False"
        CssClass="grid"
        OnRowDataBound="gvAppointments_RowDataBound"
        OnRowCommand="gvAppointments_RowCommand">

            <Columns>

                <asp:BoundField
                DataField="AppointmentId"
                HeaderText="Appointment ID" />

                <asp:BoundField
                DataField="PatientName"
                HeaderText="Patient Name" />

                <asp:BoundField
                DataField="DoctorName"
                HeaderText="Doctor Name" />

                <asp:BoundField
                DataField="AppointmentDate"
                HeaderText="Date"
                DataFormatString="{0:dd-MM-yyyy}" />

                <asp:BoundField
                DataField="AppointmentTime"
                HeaderText="Time" />

                <asp:TemplateField HeaderText="Status">

                    <ItemTemplate>

                        <asp:DropDownList
                        ID="ddlStatus"
                        runat="server">

                            <asp:ListItem>Pending</asp:ListItem>

                            <asp:ListItem>Completed</asp:ListItem>

                            <asp:ListItem>Cancelled</asp:ListItem>

                        </asp:DropDownList>

                        <asp:Button
                        ID="btnUpdate"
                        runat="server"
                        Text="Update"
                        CommandName="UpdateStatus"
                        CommandArgument='<%# Eval("AppointmentId") %>' />

                    </ItemTemplate>

                </asp:TemplateField>

            </Columns>

        </asp:GridView>

    </div>


    <div class="section">

        <h2>Patient Feedback</h2>

        <asp:GridView ID="gvFeedback"
        runat="server"
        AutoGenerateColumns="True"
        CssClass="grid">
        </asp:GridView>

    </div>


    <div class="section">

        <h2>Contact Messages</h2>

        <asp:GridView ID="gvMessages"
        runat="server"
        AutoGenerateColumns="True"
        CssClass="grid">
        </asp:GridView>

    </div>
</div>
</asp:Content>
