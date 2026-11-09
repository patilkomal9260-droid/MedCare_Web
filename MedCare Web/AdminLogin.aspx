<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="AdminLogin.aspx.cs" Inherits="MedCare_Web.AdminLogin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

.admin-login {
    max-width: 430px;
    margin: 60px auto;
    padding: 35px;
    background: white;
    border-radius: 15px;
    box-shadow: 0 5px 25px rgba(0,0,0,0.1);
}

.admin-login h2 {
    text-align: center;
    color: #2563eb;
    margin-bottom: 30px;
}

.form-group {
    margin-bottom: 20px;
}

.form-group label {
    display: block;
    margin-bottom: 8px;
    font-weight: bold;
}

.input-control {
    width: 100%;
    padding: 13px;
    border: 1px solid #cbd5e1;
    border-radius: 7px;
    box-sizing: border-box;
}

.login-btn {
    width: 100%;
    padding: 13px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 7px;
    cursor: pointer;
    font-size: 16px;
}

.message {
    display: block;
    text-align: center;
    margin-top: 15px;
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="admin-login">

    <h2>Admin Login</h2>

    <div class="form-group">

        <label>Username</label>

        <asp:TextBox ID="txtUsername"
        runat="server"
        CssClass="input-control">
        </asp:TextBox>

    </div>

    <div class="form-group">

        <label>Password</label>

        <asp:TextBox ID="txtPassword"
        runat="server"
        TextMode="Password"
        CssClass="input-control">
        </asp:TextBox>

    </div>

    <asp:Button ID="btnLogin"
    runat="server"
    Text="Login"
    CssClass="login-btn"
    OnClick="btnLogin_Click"/>

    <asp:Label ID="lblMessage"
    runat="server"
    CssClass="message">
    </asp:Label>

</div>
</asp:Content>
