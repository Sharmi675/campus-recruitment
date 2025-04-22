<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Index Module.aspx.cs" Inherits="OnlineCampusRecruitmentsystem.IndexModule" %>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Online Campus Recruitment System</title>
    <style>
        /* Basic Styling - Customize as needed */
        body {
            font-family: sans-serif;
        }
        .container {
            width: 80%;
            margin: 0 auto;
            padding: 20px;
        }
        .login-form {
            width: 300px;
            margin: 20px auto;
            border: 1px solid #ccc;
            padding: 20px;
        }
        .job-openings {
            margin-top: 20px;
        }
        .job-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Responsive grid */
            gap: 20px;
        }
        .job-card {
            border: 1px solid #ccc;
            padding: 20px;
        }
        .btn {
            padding: 10px 20px;
            margin-top: 10px;
            cursor: pointer;
        }
        .btn-primary {
            background-color: #007bff; /* Example */
            color: white;
            border: none;
        }
        .btn-success {
            background-color: #28a745; /* Example */
            color: white;
            border: none;
        }
        .error-message {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h1>Welcome to the Online Campus Recruitment System</h1>

            <div class="login-form">
                <h2>Admin Login</h2>
                <asp:Label ID="Label1" runat="server" Text="Username"></asp:Label><br />
                <asp:TextBox ID="txtAdminUsername" runat="server"></asp:TextBox><br />
                <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label><br />
                <asp:TextBox ID="txtAdminPassword" runat="server" TextMode="Password"></asp:TextBox><br />
                <asp:Button ID="btnAdminLogin" runat="server" Text="Login" OnClick="btnAdminLogin_Click" CssClass="btn btn-primary" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <br />
            </div>

            <div class="button-container">
                <asp:Button ID="btnStudentRegister" runat="server" Text="Student Registration" OnClick="btnStudentRegister_Click" CssClass="btn btn-secondary" />
            </div>

            <div class="job-openings">
            </div>

        </div>
    </form>
</body>
</html>