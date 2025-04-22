<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Apply Job.aspx.cs" Inherits="OnlineCampusRecruitmentSystem.ApplyJob" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Apply Job</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
            width: 500px; /* Increased width for better layout */
        }

        h2 {
            text-align: center;
            color: #333;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            color: #555;
        }

        input[type="text"],
        input[type="email"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
            transition: border-color 0.2s ease-in-out;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        select:focus {
            border-color: #007bff;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.2);
        }

        .file-upload { /* Style for file upload */
            margin-top: 5px;
        }

        button {
            background-color: #007bff;
            color: #fff;
            padding: 10px 15px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            width: 100%;
        }

        button:hover {
            background-color: #0056b3;
        }

        .message {
            margin-top: 15px;
            font-weight: 500;
        }

        .success {
            color: #28a745;
        }

        .error {
            color: #dc3545;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Job Application</h2>
        <form id="form1" runat="server" enctype="multipart/form-data">

            <div class="form-group">
                <asp:Label ID="lblJobTitle" runat="server" AssociatedControlID="ddlJobTitle">Job Title:</asp:Label>
                <asp:DropDownList ID="ddlJobTitle" runat="server" CssClass="form-control">
                    <asp:ListItem>Software Developer</asp:ListItem>
                    <asp:ListItem>Data Analyst</asp:ListItem>
                    <asp:ListItem>Financial Analyst</asp:ListItem>
                    <asp:ListItem>Processor</asp:ListItem>
                    <asp:ListItem>Project Coordinator</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lblName" runat="server" AssociatedControlID="txtName">Student Name:</asp:Label>
                <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" AssociatedControlID="txtEmail">Email:</asp:Label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblPhoneNumber" runat="server" Text="Phone Number:" AssociatedControlID="txtPhoneNumber"></asp:Label>
                <asp:TextBox ID="txtPhoneNumber" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblHighestQualification" runat="server" Text="Highest Qualification:" AssociatedControlID="ddlHighestQualification"></asp:Label>
                <asp:DropDownList ID="ddlHighestQualification" runat="server" CssClass="form-control">
                    <asp:ListItem>High School</asp:ListItem>
                    <asp:ListItem>Bachelor's Degree</asp:ListItem>
                    <asp:ListItem>Master's Degree</asp:ListItem>
                </asp:DropDownList>
            </div>

            <div class="form-group">
                <asp:Label ID="lblGraduationYear" runat="server" Text="Graduation Year:" AssociatedControlID="txtGraduationYear"></asp:Label>
                <asp:TextBox ID="txtGraduationYear" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblMajorField" runat="server" Text="Major Field:" AssociatedControlID="txtMajorField"></asp:Label>
                <asp:TextBox ID="txtMajorField" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <asp:Label ID="lblInstitutionName" runat="server" Text="Institution Name:" AssociatedControlID="txtInstitutionName"></asp:Label>
                <asp:TextBox ID="txtInstitutionName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            


            <div class="form-group">
                <asp:Label ID="lblResume" runat="server" AssociatedControlID="FileUploadResume">Resume:</asp:Label>
                <asp:FileUpload ID="FileUploadResume" runat="server" CssClass="file-upload" />
            </div>

            <asp:Button ID="btnApply" runat="server" Text="Apply" CssClass="button" OnClick="btnApply_Click" />

            <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>

        </form>
    </div>
</body>
</html>