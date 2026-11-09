<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MedCare_Web.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
.login-container {
    max-width: 450px;
    margin: 60px auto;
    padding: 40px;
    background: white;
    border-radius: 15px;
    box-shadow: 0 5px 25px rgba(0,0,0,0.1);
}

.login-container h2 {
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
}

.login-btn {
    width: 100%;
    padding: 14px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 7px;
    font-size: 17px;
    cursor: pointer;
}

.login-btn:hover {
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
    <div class="login-container">

    <h2>Welcome Back!</h2>

    <p class="subtitle">
        Login to your MedCare Plus Account
    </p>

    <div class="form-group">

        <label>Username</label>

        <asp:TextBox ID="txtUsername"
        runat="server"
        CssClass="input-control"
        placeholder="Enter Username">
        </asp:TextBox>

        <asp:RequiredFieldValidator
        ID="rfvUsername"
        runat="server"
        ControlToValidate="txtUsername"
        ErrorMessage="Enter Username"
        ForeColor="Red">
        </asp:RequiredFieldValidator>

    </div>


    <div class="form-group">

        <label>Password</label>

        <asp:TextBox ID="txtPassword"
        runat="server"
        TextMode="Password"
        CssClass="input-control"
        placeholder="Enter Password">
        </asp:TextBox>

        <asp:RequiredFieldValidator
        ID="rfvPassword"
        runat="server"
        ControlToValidate="txtPassword"
        ErrorMessage="Enter Password"
        ForeColor="Red">
        </asp:RequiredFieldValidator>

    </div>


    <asp:Button ID="btnLogin"
    runat="server"
    Text="Login"
    CssClass="login-btn"
    OnClick="btnLogin_Click" />


    <asp:Label ID="lblMessage"
    runat="server"
    CssClass="message">
    </asp:Label>


    <p style="text-align:center">

        Don't have an account?

        <a href="Register.aspx">
            Register Here
        </a>

    </p>

</div>

</asp:Content>
