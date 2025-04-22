using System;
using System.Data.OleDb;
using System.Web.UI;

namespace OnlineCampusRecruitmentsystem
{
    public partial class IndexModule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }
        protected void btnLogin_Click(object sender, EventArgs e)
        {
            string connectionString = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\HP\\OneDrive\\Documents\\CampusRecruitment.accdb";
            using (OleDbConnection con = new OleDbConnection(connectionString))
            {
                try
                {
                    con.Open();
                    // Specify the columns explicitly in the INSERT query
                    string query = "INSERT INTO Admin (Username, [Password]) VALUES (?,?)";
                    using (OleDbCommand command = new OleDbCommand(query, con))
                    {
                        // Add parameters in the correct order
                      
                        command.Parameters.AddWithValue("@Username", txtUsername.Text);
                        command.Parameters.AddWithValue("@Password", txtPassword.Text);

                        // Execute the query
                        command.ExecuteNonQuery();
                    }

                    // Redirect after successful execution
                    Response.Redirect("StudentRegistration.aspx");
                }
                catch (Exception ex)
                {
                    // Handle exceptions (e.g., log them or show an error message)
                    Response.Write("Error: " + ex.Message);
                }
            }
        }
    }
}


