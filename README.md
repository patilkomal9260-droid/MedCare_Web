 🏥MedCare Web – Hospital Management System

**MedCare Web** is a web-based Hospital Management System developed using (ASP.NET Web Forms, C#, and SQL Server). 
The application provides a simple and user-friendly platform to manage hospital services, patient registration, login, 
appointment booking, feedback, and administrative activities.

The main objective of this project is to simplify basic hospital management operations and improve communication between 
patients and hospital administrators.

---
## 📌 Project Overview

MedCare Web is designed to provide an organized digital platform where patients can access hospital information, register their accounts,
log in, book appointments, and share feedback.
The system also includes an administrator module to manage hospital-related activities through a dedicated dashboard.

🌐 Features

#👤 Patient Module
- Patient Registration
- Secure Patient Login
- Patient Dashboard
- View Hospital Services
- Book Appointments
- Submit Feedback
- Contact Hospital

#🔐 Admin Module
- Admin Login
- Admin Dashboard
- Manage Hospital Activities
- Access Patient and Appointment Information

🛠️ Technologies Used

| Technology | Purpose |
| ASP.NET Web Forms | Web Application Development |
| C# | Backend Programming |
| HTML | Web Page Structure |
| CSS | Website Styling |
| SQL Server | Database Management |
| ADO.NET | Database Connectivity |
| Visual Studio | Development Environment |

## 📂 Project Structure
MedCare-Web/
│
│   └── style.css
│
├── Screenshots/
│   ├── Home.png
│   ├── Register.png
│   ├── Login.png
│   ├── Services.png
│   ├── Appointment.png
│   ├── Feedback.png
│   ├── Contact.png
│   ├── PatientDashboard.png
│   ├── AdminLogin.png
│   └── AdminDashboard.png
│
├── Home.aspx
├── Register.aspx
├── Login.aspx
├── Services.aspx
├── Appointment.aspx
├── Feedback.aspx
├── Contact.aspx
├── PatientDashboard.aspx
├── AdminLogin.aspx
├── AdminDashboard.aspx
├── Site.Master
├── DBConnection.cs
└── Web.config

📄 Module Description

| Page | Description |
| Home.aspx | Displays the hospital homepage |
| Register.aspx | Allows new patients to register |
| Login.aspx | Provides patient login functionality |
| Services.aspx | Displays available hospital services |
| Appointment.aspx | Allows patients to book appointments |
| Feedback.aspx | Allows patients to submit feedback |
| Contact.aspx | Displays hospital contact information |
| PatientDashboard.aspx | Patient's main dashboard |
| AdminLogin.aspx | Provides administrator login |
| AdminDashboard.aspx | Administrator management dashboard |
| Site.Master | Provides a common layout and navigation |
| DBConnection.cs | Handles database connectivity |
| Web.config | Stores application configuration settings |

## ⚙️ Installation and Setup

Follow these steps to run the project.
*Step 1: Open the Project-
1. Open Visual Studio.
2. Open the MedCare Web solution.
3. Build the project.

*Step 2: Configure Database-
1. Open SQL Server Management Studio.
2. Create a database for MedCare Web.
3. Create the required tables.
4. Configure the database connection string in `Web.config`.
5. Verify the connection in `DBConnection.cs`.

*Step 3: Run the Application**
Press `F5` in Visual Studio to run the application.

##🔒 Security Considerations
- Validate user input before processing.
- Use parameterized SQL queries to prevent SQL injection.
- Store passwords using secure password hashing.
- Restrict administrator pages to authenticated administrators.
- Manage user sessions securely.

🎯 Project Objectives
- To develop a web-based hospital management application.
- To simplify patient registration and appointment booking.
- To provide an organized platform for hospital information.
- To implement database connectivity using SQL Server.
- To understand practical implementation of ASP.NET Web Forms and C#.

 🚀 Future Enhancements
- Online payment integration.
- Doctor registration and management.
- Appointment approval and cancellation.
- Email and SMS notifications.
- Patient medical history management.
- Improved admin analytics and reporting.
---
