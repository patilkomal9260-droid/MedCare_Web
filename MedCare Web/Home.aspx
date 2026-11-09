<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MedCare_Web.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .hero-section {
    min-height: 450px;
    background: linear-gradient(
        120deg,
        #0f3d5e,
        #0284c7
    );
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
    padding: 40px 20px;
}

.hero-content {
    max-width: 750px;
    color: white;
}

.hero-content h1 {
    font-size: 42px;
    margin-bottom: 20px;
}

.hero-content p {
    font-size: 18px;
    margin-bottom: 25px;
}

@media(max-width:600px) {
    .hero-content h1 {
        font-size: 29px;
    }
}
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
<div class="hero-section">

    <div class="hero-content">

        <h1>
            Providing Compassionate Care, Always.
        </h1>

        <p>
            Your Health Is Our Priority.
            We Provide Quality Healthcare
            With Experienced Doctors.
        </p>

        <a href="Appointment.aspx"
        class="btn">
            Book Appointment
        </a>

        <a href="Services.aspx"
        class="btn">
            Explore Services
        </a>

    </div>

</div>


<div style="padding:50px 6%;">

    <div style="
    display:grid;
    grid-template-columns:repeat(auto-fit,minmax(220px,1fr));
    gap:25px;">

        <div class="card">
            <h3>👨‍⚕️ Expert Doctors</h3>
            <p>
                Experienced and qualified doctors
                for better healthcare.
            </p>
        </div>

        <div class="card">
            <h3>🏥 Modern Facilities</h3>
            <p>
                Modern medical facilities
                and advanced equipment.
            </p>
        </div>

        <div class="card">
            <h3>🚑 Emergency Care</h3>
            <p>
                Emergency healthcare services
                whenever needed.
            </p>
        </div>
    </div>

</div>
</asp:Content>



