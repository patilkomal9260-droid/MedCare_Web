<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="MedCare_Web.Contact1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

.contact-container {
    max-width: 1100px;
    margin: 40px auto;
    padding: 20px;
}

.contact-title {
    text-align: center;
    color: #2563eb;
    margin-bottom: 10px;
}

.contact-subtitle {
    text-align: center;
    color: gray;
    margin-bottom: 35px;
}

.contact-info {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
    margin-bottom: 35px;
}

.info-card {
    background: #eff6ff;
    padding: 25px;
    border-radius: 12px;
    text-align: center;
}

.info-card h3 {
    color: #2563eb;
}

.contact-form {
    max-width: 650px;
    margin: auto;
    background: white;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 5px 25px rgba(0,0,0,0.1);
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    font-weight: bold;
    margin-bottom: 8px;
}

.input-control {
    width: 100%;
    padding: 13px;
    border: 1px solid #cbd5e1;
    border-radius: 7px;
    box-sizing: border-box;
}

.submit-btn {
    width: 100%;
    padding: 14px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 7px;
    cursor: pointer;
    font-size: 17px;
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

@media(max-width:700px) {
    .contact-info {
        grid-template-columns: 1fr;
    }
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="contact-container">

    <h2 class="contact-title">Contact Us</h2>

    <p class="contact-subtitle">
        We Are Always Ready To Help You
    </p>

    <div class="contact-info">

        <div class="info-card">
            <h3>📍 Address</h3>
            <p>MedCare Plus Hospital</p>
            <p>Kolhapur, Maharashtra</p>
        </div>

        <div class="info-card">
            <h3>📞 Phone</h3>
            <p>+91 9876543210</p>
        </div>

        <div class="info-card">
            <h3>✉ Email</h3>
            <p>medcare@example.com</p>
        </div>

    </div>

    <div class="contact-form">

        <h2>Send Us a Message</h2>

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

            <label>Subject</label>

            <asp:TextBox ID="txtSubject"
            runat="server"
            CssClass="input-control">
            </asp:TextBox>

        </div>

        <div class="form-group">

            <label>Message</label>

            <asp:TextBox ID="txtMessage"
            runat="server"
            TextMode="MultiLine"
            Rows="5"
            CssClass="input-control">
            </asp:TextBox>

        </div>

        <asp:Button ID="btnSubmit"
        runat="server"
        Text="Send Message"
        CssClass="submit-btn"
        OnClick="btnSubmit_Click" />

        <asp:Label ID="lblMessage"
        runat="server"
        CssClass="message">
        </asp:Label>

    </div>

</div>
</asp:Content>
