<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Job Eligibility.aspx.cs" Inherits="OnlineCampusRecruitmentSystem.JobEligibility" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Job Eligibility</title>
    <style>
        body {
            font-family: sans-serif;
        }

        .container {
            width: 90%;
            max-width: 1200px;
            margin: 20px auto;
            padding: 20px;
        }

        h1 {
            text-align: center;
        }

        .eligibility-instructions {
            background-color: #f0f0f0;
            padding: 15px;
            margin-bottom: 20px;
            border-radius: 5px;
        }

        .grid-view {
            width: 100%;
            border-collapse: collapse;
        }

        .grid-view th, .grid-view td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .grid-view th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        /* Responsive grid */
        @media (max-width: 768px) {
            .grid-view {
                display: block;
                overflow-x: auto; /* Enable horizontal scrolling if needed */
            }

            .grid-view th, .grid-view td {
                display: table-cell; /* Restore table cell behavior */
                width: auto; /* Allow columns to adjust width */
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Job Eligibility</h1>

        <div class="eligibility-instructions">
            <h2>Eligibility Instructions</h2>
            <p>
                To determine your eligibility for a job, please review the requirements listed below. 
                Ensure you meet the specified qualifications, skills, experience, and certifications.
                Click on the "Apply" button for the job you are interested in if you meet the eligibility criteria.
            </p>
        </div>

        <asp:GridView ID="gvJobEligibility" runat="server" CssClass="grid-view" AutoGenerateColumns="false">
            <Columns>
                <asp:BoundField DataField="JobTitle" HeaderText="Job Title" />
                <asp:BoundField DataField="Location" HeaderText="Location" />
                <asp:BoundField DataField="Qualification" HeaderText="Qualification" />
                <asp:BoundField DataField="RequiredSkills" HeaderText="Required Skills" />
                <asp:BoundField DataField="Salary" HeaderText="Salary" />
                <asp:BoundField DataField="Experience" HeaderText="Experience" />
                <asp:BoundField DataField="Certifications" HeaderText="Certifications" />
                <asp:HyperLinkField HeaderText="Apply" Text="Apply" DataNavigateUrlFields="JobId" 
                    DataNavigateUrlFormatString="Apply.aspx?JobId={0}" /> <%-- Link to Apply page --%>
            </Columns>
        </asp:GridView>

    </div>
</body>
</html>