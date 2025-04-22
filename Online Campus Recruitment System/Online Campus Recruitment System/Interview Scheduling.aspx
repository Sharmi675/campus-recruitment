<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Interview Scheduling.aspx.cs" Inherits="OnlineCampusRecruitment.InterviewScheduling" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Interview Scheduling</title>
    <style>
        /* Add your CSS styles here */
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h2> Personal Interview Scheduling</h2>
            <hr />
            <asp:Label ID="lblCandidateName" runat="server" Text="Candidate Name:"></asp:Label>
            <asp:TextBox ID="txtCandidateName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblInterviewerName" runat="server" Text="Interviewer Name:"></asp:Label>
            <asp:TextBox ID="txtInterviewerName" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblLocation" runat="server" Text="Location"></asp:Label>
            <asp:TextBox ID="txtLocation" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblInterviewDate" runat="server" Text="Interview Date:"></asp:Label>
            <asp:TextBox ID="txtInterviewDate" runat="server"></asp:TextBox>
            <br />
            <asp:Label ID="lblInterviewTime" runat="server" Text="Interview Time:"></asp:Label>
            <asp:TextBox ID="txtInterviewTime" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="btnScheduleInterview" runat="server" Text="Schedule Interview" OnClick="btnScheduleInterview_Click" />
            <br />
            <asp:Label ID="lblInterviewNotification" runat="server" Text="Interview Notification:"></asp:Label>
            <asp:TextBox ID="txtInterviewNotification" runat="server" TextMode="MultiLine"></asp:TextBox>
            <br />
            <asp:Button ID="btnSendInterviewNotification" runat="server" Text="Send Interview Notification" OnClick="btnSendInterviewNotification_Click" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Label ID="lblMessage" runat="server" Text="[lblMessage]"></asp:Label>
        </div>
    </form>
</body>
</html>
