<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Feedback.aspx.cs" Inherits="MedCare_Web.Feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

.feedback-container {
    max-width: 650px;
    margin: 40px auto;
    padding: 35px;
    background: white;
    border-radius: 15px;
    box-shadow: 0 5px 25px rgba(0,0,0,0.1);
}

.feedback-container h2 {
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
    box-sizing: border-box;
}

.submit-btn {
    width: 100%;
    padding: 14px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 7px;
    font-size: 17px;
    cursor: pointer;
}

.submit-btn:hover {
    background: #1e40af;
}

.message {
    display: block;
    text-align: center;
    margin-top: 15px;
    font-weight: bold;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="feedback-container">

    <h2>Share Your Feedback</h2>

    <p class="subtitle">
        Your Feedback Helps Us Improve Our Services
    </p>

    <div class="form-group">

        <label>Full Name</label>

        <asp:TextBox ID="txtName"
        runat="server"
        CssClass="input-control">
        </asp:TextBox>

    </div>

    <div class="form-group">

        <label>Email</label>

        <asp:TextBox ID="txtEmail"
        runat="server"
        TextMode="Email"
        CssClass="input-control">
        </asp:TextBox>

    </div>

    <div class="form-group">

        <label>Department</label>

        <asp:DropDownList ID="ddlDepartment"
        runat="server"
        CssClass="input-control">

            <asp:ListItem Text="Select Department"
            Value="" />

            <asp:ListItem>Cardiology</asp:ListItem>

            <asp:ListItem>Dermatology</asp:ListItem>

            <asp:ListItem>General Medicine</asp:ListItem>

            <asp:ListItem>Emergency</asp:ListItem>

            <asp:ListItem>Laboratory</asp:ListItem>

            <asp:ListItem>Other</asp:ListItem>

        </asp:DropDownList>

    </div>

    <div class="form-group">

        <label>Rating</label>

        <asp:DropDownList ID="ddlRating"
        runat="server"
        CssClass="input-control">

            <asp:ListItem Text="Select Rating"
            Value="" />

            <asp:ListItem Text="5 - Excellent"
            Value="5" />

            <asp:ListItem Text="4 - Very Good"
            Value="4" />

            <asp:ListItem Text="3 - Good"
            Value="3" />

            <asp:ListItem Text="2 - Average"
            Value="2" />

            <asp:ListItem Text="1 - Poor"
            Value="1" />

        </asp:DropDownList>

    </div>

    <div class="form-group">

        <label>Your Feedback</label>

        <asp:TextBox ID="txtComments"
        runat="server"
        TextMode="MultiLine"
        Rows="5"
        CssClass="input-control">
        </asp:TextBox>

    </div>

    <asp:Button ID="btnSubmit"
    runat="server"
    Text="Submit Feedback"
    CssClass="submit-btn"
    OnClick="btnSubmit_Click" />

    <asp:Label ID="lblMessage"
    runat="server"
    CssClass="message">
    </asp:Label>

</div>
</asp:Content>
