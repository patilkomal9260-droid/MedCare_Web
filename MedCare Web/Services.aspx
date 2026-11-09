<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Services.aspx.cs" Inherits="MedCare_Web.Services" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

.services-header {
    text-align: center;
    padding: 50px 20px;
    background: #eff6ff;
}

.services-header h1 {
    color: #2563eb;
    font-size: 38px;
    margin-bottom: 15px;
}

.services-header p {
    color: #64748b;
    font-size: 17px;
}

.services-container {
    max-width: 1150px;
    margin: 40px auto;
    padding: 20px;
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 25px;
}

.service-card {
    background: white;
    padding: 30px 20px;
    text-align: center;
    border-radius: 15px;
    box-shadow: 0 4px 15px rgba(0,0,0,0.08);
    transition: 0.3s;
}

.service-card:hover {
    transform: translateY(-8px);
    box-shadow: 0 8px 25px rgba(37,99,235,0.2);
}

.service-icon {
    font-size: 45px;
    margin-bottom: 15px;
}

.service-card h3 {
    color: #2563eb;
    margin-bottom: 15px;
}

.service-card p {
    color: #64748b;
    line-height: 1.6;
    min-height: 75px;
}

.service-card a {
    display: inline-block;
    margin-top: 20px;
    background: #2563eb;
    color: white;
    text-decoration: none;
    padding: 12px 25px;
    border-radius: 7px;
}

.service-card a:hover {
    background: #1e40af;
}

@media(max-width:800px) {
    .services-container {
        grid-template-columns: repeat(2, 1fr);
    }
}

@media(max-width:550px) {
    .services-container {
        grid-template-columns: 1fr;
    }
}

</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <div class="services-header">

    <h1>Our Medical Services</h1>

    <p>
        We provide quality healthcare services
        for your healthy life.
    </p>

</div>


<div class="services-container">


    <div class="service-card">

        <div class="service-icon">🚑</div>

        <h3>24/7 Emergency Care</h3>

        <p>
            Emergency medical services are
            available 24 hours a day for patients.
        </p>

        <a href="Contact.aspx">
            Contact Us
        </a>

    </div>


    <div class="service-card">

        <div class="service-icon">🩺</div>

        <h3>Outpatient Department</h3>

        <p>
            Consult experienced doctors for
            regular health checkups and treatment.
        </p>

        <a href="Appointment.aspx">
            Book Appointment
        </a>

    </div>


    <div class="service-card">

        <div class="service-icon">🔬</div>

        <h3>Laboratory & Diagnostics</h3>

        <p>
            Advanced laboratory testing and
            diagnostic facilities for patients.
        </p>

        <a href="Appointment.aspx">
            Book Appointment
        </a>

    </div>


    <div class="service-card">

        <div class="service-icon">💊</div>

        <h3>In-House Pharmacy</h3>

        <p>
            Get prescribed medicines and
            healthcare products conveniently.
        </p>

        <a href="Contact.aspx">
            Contact Us
        </a>

    </div>


    <div class="service-card">

        <div class="service-icon">🏥</div>

        <h3>Inpatient Wards & ICU</h3>

        <p>
            Comfortable patient rooms and
            intensive care facilities.
        </p>

        <a href="Contact.aspx">
            Contact Us
        </a>

    </div>


    <div class="service-card">

        <div class="service-icon">⚕️</div>

        <h3>Advanced Surgery Center</h3>

        <p>
            Modern surgical facilities with
            experienced medical professionals.
        </p>

        <a href="Appointment.aspx">
            Book Appointment
        </a>

    </div>


</div>
</asp:Content>
