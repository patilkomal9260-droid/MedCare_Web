<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MedCare_Web.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

.register-container {
    max-width: 750px;
    margin: 40px auto;
    padding: 35px;
    background: white;
    border-radius: 15px;
    box-shadow: 0 5px 25px rgba(0,0,0,0.1);
}

.register-container h2 {
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
    margin-bottom: 18px;
}

.form-group label {
    display: block;
    margin-bottom: 7px;
    font-weight: 600;
}

.input-control {
    width: 100%;
    padding: 12px;
    border: 1px solid #cbd5e1;
    border-radius: 7px;
    font-size: 15px;
}

.register-btn {
    width: 100%;
    padding: 14px;
    background: #2563eb;
    color: white;
    border: none;
    border-radius: 7px;
    font-size: 17px;
    cursor: pointer;
}

.register-btn:hover {
    background: #1e40af;
}

.error {
    color: red;
    font-size: 13px;
}

.message {
    display: block;
    text-align: center;
    margin: 15px 0;
    font-weight: bold;
}

</style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="register-container">

    <h2>Patient Registration</h2>

    <p class="subtitle">
        Create your MedCare Plus Account
    </p>

    <div class="form-group">

        <label>Full Name</label>

        <asp:TextBox ID="txtName"
        runat="server"
        CssClass="input-control"
        placeholder="Enter Full Name">
        </asp:TextBox>

        <asp:RequiredFieldValidator
        ID="rfvName"
        runat="server"
        ControlToValidate="txtName"
        ErrorMessage="Please enter name"
        CssClass="error">
        </asp:RequiredFieldValidator>

    </div>


    <div class="form-group">

        <label>Age</label>

        <asp:TextBox ID="txtAge"
        runat="server"
        TextMode="Number"
        CssClass="input-control">
        </asp:TextBox>

        <asp:RangeValidator
        ID="rvAge"
        runat="server"
        ControlToValidate="txtAge"
        MinimumValue="1"
        MaximumValue="120"
        Type="Integer"
        ErrorMessage="Enter valid age"
        CssClass="error">
        </asp:RangeValidator>

    </div>


    <div class="form-group">

        <label>Gender</label>

        <asp:DropDownList ID="ddlGender"
        runat="server"
        CssClass="input-control">

            <asp:ListItem Text="Select Gender"
            Value="">
            </asp:ListItem>

            <asp:ListItem>Male</asp:ListItem>

            <asp:ListItem>Female</asp:ListItem>

            <asp:ListItem>Other</asp:ListItem>

        </asp:DropDownList>

        <asp:RequiredFieldValidator
        ID="rfvGender"
        runat="server"
        ControlToValidate="ddlGender"
        InitialValue=""
        ErrorMessage="Select gender"
        CssClass="error">
        </asp:RequiredFieldValidator>

    </div>


    <div class="form-group">

        <label>Mobile Number</label>

        <asp:TextBox ID="txtMobile"
        runat="server"
        TextMode="Phone"
        MaxLength="10"
        CssClass="input-control">
        </asp:TextBox>

        <asp:RequiredFieldValidator
        ID="rfvMobile"
        runat="server"
        ControlToValidate="txtMobile"
        ErrorMessage="Enter mobile number"
        CssClass="error">
        </asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator
        ID="revMobile"
        runat="server"
        ControlToValidate="txtMobile"
        ValidationExpression="^[6-9][0-9]{9}$"
        ErrorMessage="Enter valid 10 digit mobile number"
        CssClass="error">
        </asp:RegularExpressionValidator>

    </div>


    <div class="form-group">

        <label>Email Address</label>

        <asp:TextBox ID="txtEmail"
        runat="server"
        TextMode="Email"
        CssClass="input-control">
        </asp:TextBox>

        <asp:RequiredFieldValidator
        ID="rfvEmail"
        runat="server"
        ControlToValidate="txtEmail"
        ErrorMessage="Enter email"
        CssClass="error">
        </asp:RequiredFieldValidator>

        <asp:RegularExpressionValidator
        ID="revEmail"
        runat="server"
        ControlToValidate="txtEmail"
        ValidationExpression="^[^@\s]+@[^@\s]+\.[^@\s]+$"
        ErrorMessage="Enter valid email"
        CssClass="error">
        </asp:RegularExpressionValidator>

    </div>


    <div class="form-group">

        <label>Address</label>

        <asp:TextBox ID="txtAddress"
        runat="server"
        TextMode="MultiLine"
        Rows="3"
        CssClass="input-control">
        </asp:TextBox>

        <asp:RequiredFieldValidator
        ID="rfvAddress"
        runat="server"
        ControlToValidate="txtAddress"
        ErrorMessage="Enter address"
        CssClass="error">
        </asp:RequiredFieldValidator>

    </div>


    <div class="form-group">

        <label>Username</label>

        <asp:TextBox ID="txtUsername"
        runat="server"
        CssClass="input-control"
        placeholder="Create Username">
        </asp:TextBox>

        <asp:RequiredFieldValidator
        ID="rfvUsername"
        runat="server"
        ControlToValidate="txtUsername"
        ErrorMessage="Enter username"
        CssClass="error">
        </asp:RequiredFieldValidator>

    </div>


    <div class="form-group">

        <label>Password</label>

        <asp:TextBox ID="txtPassword"
        runat="server"
        TextMode="Password"
        CssClass="input-control">
        </asp:TextBox>

        <asp:RequiredFieldValidator
        ID="rfvPassword"
        runat="server"
        ControlToValidate="txtPassword"
        ErrorMessage="Enter password"
        CssClass="error">
        </asp:RequiredFieldValidator>

    </div>


    <asp:Button ID="btnRegister"
    runat="server"
    Text="Register Now"
    CssClass="register-btn"
    OnClick="btnRegister_Click" />


    <asp:Label ID="lblMessage"
    runat="server"
    CssClass="message">
    </asp:Label>


    <p style="text-align:center">

        Already have an account?

        <a href="Login.aspx">Login Here</a>

    </p>

</div>

</asp:Content>
