<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Appointment.aspx.cs" Inherits="MedCare_Web.Appointment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

.appointment-container {
    max-width: 650px;
    margin: 40px auto;
    padding: 35px;
    background: white;
    border-radius: 15px;
    box-shadow: 0 5px 25px rgba(0,0,0,0.1);
}

.appointment-container h2 {
    text-align: center;
    color: #2563eb;
    margin-bottom: 10px;
}

.subtitle {
    text-align: center;
    color: gray;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: 600;
}

.input-control {
    width: 100%;
    padding: 13px;
    border: 1px solid #cbd5e1;
    border-radius: 7px;
    font-size: 15px;
}

.book-btn {
    width: 100%;
    padding: 14px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 7px;
    font-size: 17px;
    cursor: pointer;
}

.book-btn:hover {
    background: #1e40af;
}

.message {
    display: block;
    text-align: center;
    margin: 15px;
    font-weight: bold;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="appointment-container">

    <h2>Book Your Appointment</h2>

    <p class="subtitle">
        Schedule Your Doctor Appointment
    </p>

    <div class="form-group">

        <label>Patient Name</label>

        <asp:TextBox ID="txtPatientName"
        runat="server"
        CssClass="input-control"
        ReadOnly="true">
        </asp:TextBox>

    </div>


    <div class="form-group">

        <label>Select Doctor</label>

        <asp:DropDownList ID="ddlDoctor"
        runat="server"
        CssClass="input-control"
        AutoPostBack="true"
        OnSelectedIndexChanged="ddlDoctor_SelectedIndexChanged">

        </asp:DropDownList>

    </div>


    <div class="form-group">

        <label>Specialization</label>

        <asp:TextBox ID="txtSpecialization"
        runat="server"
        CssClass="input-control"
        ReadOnly="true">
        </asp:TextBox>

    </div>


    <div class="form-group">

        <label>Appointment Date</label>

        <asp:TextBox ID="txtDate"
        runat="server"
        TextMode="Date"
        CssClass="input-control">
        </asp:TextBox>

    </div>


    <div class="form-group">

        <label>Appointment Time</label>

        <asp:DropDownList ID="ddlTime"
        runat="server"
        CssClass="input-control">

            <asp:ListItem Text="Select Time" Value="" />

            <asp:ListItem>09:00 AM</asp:ListItem>

            <asp:ListItem>10:00 AM</asp:ListItem>

            <asp:ListItem>11:00 AM</asp:ListItem>

            <asp:ListItem>12:00 PM</asp:ListItem>

            <asp:ListItem>01:00 PM</asp:ListItem>

            <asp:ListItem>02:00 PM</asp:ListItem>

            <asp:ListItem>03:00 PM</asp:ListItem>

            <asp:ListItem>04:00 PM</asp:ListItem>

            <asp:ListItem>05:00 PM</asp:ListItem>

        </asp:DropDownList>

    </div>


    <asp:Button ID="btnBook"
    runat="server"
    Text="Book Appointment"
    CssClass="book-btn"
    OnClick="btnBook_Click" />


    <asp:Label ID="lblMessage"
    runat="server"
    CssClass="message">
    </asp:Label>

</div>
</asp:Content>
