<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Score Module.aspx.cs" Inherits="OnlineCampusRecruitmentSystem.ScoreModule" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Online Test Results</title>
    <style type="text/css">
        body {
            font-family: Arial, sans-serif;
        }
        .container {
            width: 600px;
            margin: 0 auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .result {
            margin-bottom: 20px;
        }
        .selected {
            color: green; /* Or any style you prefer for "Selected" */
        }
        .not-selected {
            color: red; /* Or any style you prefer for "Not Selected" */
        }
        .next-button { /* Style for the "Next" button */
             padding: 10px 20px;
            background-color: #4CAF50; /* Green */
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
             text-decoration: none;
        }
        .next-button:hover {
            background-color: #45a049;
        }
        .label {
            font-weight: bold;
            margin-right: 5px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Online Test Results</h2>

            <div class="result">
                <asp:Label ID="lblUserNameLabel" runat="server" CssClass="label" Text="User Name:"></asp:Label>
                <asp:TextBox ID="txtUserName" runat="server" ReadOnly="true"></asp:TextBox><br /> <br />
                <asp:Label ID="lblScoreLabel" runat="server" CssClass="label" Text="Your Score:"></asp:Label>
                <asp:Label ID="lblScore" runat="server"></asp:Label> / <asp:Label ID="lblTotalQuestions" runat="server"></asp:Label><br /> <br />
                <asp:Label ID="lblResultLabel" runat="server" CssClass="label" Text="Result:"></asp:Label>
                <asp:Label ID="lblResult" runat="server"></asp:Label><br /> <br />
                <asp:Label ID="lblMessage" runat="server" CssClass="message"></asp:Label>
            </div>

            <asp:Button ID="btnNext" runat="server" Text="Next" OnClick="btnNext_Click" CssClass="next-button" />
        </div>
    </form>
</body>
</html>