using System;
using System.Data.OleDb;
using System.IO;
using System.Web.UI.WebControls;

namespace OnlineCampusRecruitmentSystem
{
    public partial class ApplyJob : System.Web.UI.Page
    {
        protected void btnApply_Click(object sender, EventArgs e)
        {
            lblMessage.Text = ""; // Clear previous messages
            lblMessage.CssClass = "";

            string resumeFileName = "";
            string resumeFilePath = "";
            string virtualPath = "";

            if (FileUploadResume.HasFile)
            {
                try
                {
                    resumeFileName = Path.GetFileName(FileUploadResume.FileName);
                    virtualPath = "~/Resumes/" + resumeFileName;
                    resumeFilePath = Server.MapPath(virtualPath);

                    FileUploadResume.SaveAs(resumeFilePath);
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "File upload failed: " + ex.Message;
                    lblMessage.CssClass = "error";
                    System.Diagnostics.Debug.WriteLine("File Upload Error: " + ex.Message);
                    return; // Stop processing
                }
            }
            else
            {
                lblMessage.Text = "Please select a file.";
                lblMessage.CssClass = "error";
                return;
            }

            // Get form field values, with NULL CHECKS!
            string jobTitle = ddlJobTitle.SelectedValue;
            string studentName = txtName.Text;
            string email = txtEmail.Text;
            string phoneNumber = txtPhoneNumber.Text;
            string highestQualification = "Master's Degree"; // Default value
            string graduationYear = "2025"; // Default value
            string majorField = "Computer Application"; // Default value
            string institutionName = "University Of Madras"; // Default value

            

            // Null checks for required fields (customize as needed)
            // ... other code ...

            // Phone Number Conversion
            long parsedPhoneNumber;
            if (!long.TryParse(phoneNumber, out parsedPhoneNumber))
            {
                lblMessage.Text = "Invalid Phone Number. Please enter a number.";
                lblMessage.CssClass = "error";
                return;
            }

            // Graduation Year Conversion
            int parsedGraduationYear;
            if (!int.TryParse(graduationYear, out parsedGraduationYear))
            {
                lblMessage.Text = "Invalid Graduation Year. Please enter a number.";
                lblMessage.CssClass = "error";
                return;
            }

string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\HP\\OneDrive\\Documents\\CampusRecruitment.accdb;Persist Security Info=False;";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                try
                {
                    connection.Open();

                    string insertQuery = "INSERT INTO [Apply job] (JobTitle, StudentName, Email, PhoneNumber, HighestQualification, GraduationYear, MajorField, InstitutionName, ResumeFilePath) " +
                                            "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

                    using (OleDbCommand command = new OleDbCommand(insertQuery, connection))
                    {
                        command.Parameters.Add("?", OleDbType.VarChar).Value = jobTitle;      // Text
                        command.Parameters.Add("?", OleDbType.VarChar).Value = studentName;   // Text
                        command.Parameters.Add("?", OleDbType.VarChar).Value = email;         // Text
                        command.Parameters.Add("?", OleDbType.BigInt).Value = parsedPhoneNumber; // Number (Int64)
                        command.Parameters.Add("?", OleDbType.VarChar).Value = highestQualification; // Text
                        command.Parameters.Add("?", OleDbType.Integer).Value = parsedGraduationYear; // Number (Integer)
                        command.Parameters.Add("?", OleDbType.VarChar).Value = majorField;     // Text
                        command.Parameters.Add("?", OleDbType.VarChar).Value = institutionName; // Text
                        command.Parameters.Add("?", OleDbType.LongVarChar).Value = virtualPath;   // Memo (LongVarChar)

                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            lblMessage.Text = "Job Applied successfully!";
                            lblMessage.CssClass = "success";
                            Response.Redirect("Online Test.aspx"); // Redirect after success
                        }
                        else
                        {
                            lblMessage.Text = "Error saving details. No rows were inserted.";
                            lblMessage.CssClass = "error";
                        }
                    }
                }
                catch (OleDbException ex)
                {
                    lblMessage.Text = "Database error: " + ex.Message;
                    lblMessage.CssClass = "error";
                    System.Diagnostics.Debug.WriteLine("Database Error: " + ex.Message);
                    return; // Stop processing
                }
                catch (Exception ex)
                {
                    lblMessage.Text = "An unexpected error occurred: " + ex.Message;
                    lblMessage.CssClass = "error";
                    System.Diagnostics.Debug.WriteLine("General Error: " + ex.Message);
                    return; // Stop processing
                }
            }
        }
    }
}