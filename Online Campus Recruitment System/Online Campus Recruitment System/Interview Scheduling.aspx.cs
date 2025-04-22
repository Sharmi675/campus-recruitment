using System;
using System.Configuration; // For web.config access
using System.Data;
using System.Data.OleDb;
using System.Net.Mail;
using System.Net;
using System.Web.UI;

namespace OnlineCampusRecruitment
{
    public partial class InterviewScheduling : System.Web.UI.Page
    {

protected void btnScheduleInterview_Click(object sender, EventArgs e)
        {
            if (ScheduleInterview())
            {
                SendInterviewNotification();
            }
        }

        protected bool ScheduleInterview()
        {
            string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\HP\\OneDrive\\Documents\\CampusRecruitment.accdb";  // Get from web.config
            string query = "INSERT INTO [Interview Schedule] ([Candidate Name], [Interviewer Name], [Interview Date], [Interview Time]) VALUES (?, ?, ?, ?)";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    try
                    {
                        connection.Open();

                        command.Parameters.AddWithValue("@CandidateName", txtCandidateName.Text);
                        command.Parameters.AddWithValue("@InterviewerName", txtInterviewerName.Text);
                        

                        DateTime interviewDate;
                        if (!DateTime.TryParse(txtInterviewDate.Text, out interviewDate))
                        {
                            ShowErrorMessage("Invalid Interview Date format.");
                            return false;
                        }
                        command.Parameters.AddWithValue("@InterviewDate", interviewDate);

                        TimeSpan interviewTime;
                        if (!TimeSpan.TryParse(txtInterviewTime.Text, out interviewTime))
                        {
                            ShowErrorMessage("Invalid Interview Time format.");
                            return false;
                        }
                        command.Parameters.AddWithValue("@InterviewTime", interviewTime);

                        int rowsAffected = command.ExecuteNonQuery();
                        if (rowsAffected > 0)
                        {
                            ShowSuccessMessage("Interview scheduled successfully!");
                            return true;
                        }
                        else
                        {
                            ShowErrorMessage("Failed to schedule interview.");
                            return false;
                        }

                    }
                    catch (Exception ex)
                    {
                        ShowErrorMessage("An error occurred while scheduling: " + ex.Message);
                        return false;
                    }
                }
            }
        }

        protected void SendInterviewNotification()
        {
            try
            {
                string candidateEmail = "sharmimadhavan123@gmail.com"; // Store in a variable for easier handling

                if (string.IsNullOrEmpty(candidateEmail))
                {
                    ShowErrorMessage("Candidate email is required.");
                    return; // Don't proceed if email is empty
                }

                if (!IsValidEmail(candidateEmail)) // Check if the email is valid
                {
                    ShowErrorMessage("Invalid candidate email format.");
                    return; // Don't proceed if email is invalid
                }

                MailMessage mailMessage = new MailMessage();
                mailMessage.From = new MailAddress("sharmimadhavan123@gmail.com");
                mailMessage.To.Add(new MailAddress("sharmimadhavan123@gmail.com")); // Now safe to add

                mailMessage.Subject = "Interview Notification";
                mailMessage.Body = txtInterviewNotification.Text;

                SmtpClient smtpClient = new SmtpClient("smtp.gmail.com");
                smtpClient.Port = 587;
                smtpClient.Credentials = new NetworkCredential("sharmimbsccs20@gmail.com", "jvgc pjqe fgel smvp");
                smtpClient.EnableSsl = true;

                smtpClient.Send(mailMessage);
                ShowSuccessMessage("Interview notification sent successfully!");
            }
            catch (FormatException ex)  // Catch FormatException specifically
            {
                ShowErrorMessage("Invalid candidate email format: " + ex.Message); // More specific error message
            }
            catch (SmtpException ex) // Catch SmtpException for email sending issues
            {
                ShowErrorMessage("Error sending notification: " + ex.Message);
            }
            catch (Exception ex) // Catch other exceptions
            {
                ShowErrorMessage("An unexpected error occurred: " + ex.Message);
            }
        }

        // Helper function to validate email format (using Regex)
        private bool IsValidEmail(string email)
        {
            try
            {
                var addr = new System.Net.Mail.MailAddress(email);
                return addr.Address == email;
            }
            catch
            {
                return false;
            }
        }

        private void ShowSuccessMessage(string message)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = System.Drawing.Color.Green;
        }

        private void ShowErrorMessage(string message)
        {
            lblMessage.Text = message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }

        protected void btnSendInterviewNotification_Click(object sender, EventArgs e)
        {
            SendInterviewNotification(); // Call the SendInterviewNotification function
        }
    }
}