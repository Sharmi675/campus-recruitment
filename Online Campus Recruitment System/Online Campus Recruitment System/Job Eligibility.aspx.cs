using System;
using System.Data.OleDb;
using System.Web.UI;

public partial class JobEligibility : System.Web.UI.Page
{
    private string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\HP\\OneDrive\\Documents\\CampusRecruitment.accdb Persist Security Info=False;"; // Replace with your actual connection string

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadJobEligibility();
        }
    }

    private void LoadJobEligibility()
    {
        using (OleDbConnection connection = new OleDbConnection(connectionString))
        {
            try
            {
                connection.Open();
                string query = "SELECT JobId, JobTitle, Location, Qualification, RequiredSkills, Salary, Experience, Certifications FROM JobEligibility"; // Your query
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    
                }
            }
            catch (Exception ex)
            {
                // Handle exceptions (log, display message, etc.)
                Console.WriteLine("Error: " + ex.Message);
                // Optionally display an error message to the user:
                // lblErrorMessage.Text = "An error occurred: " + ex.Message;  // Assuming you have a label with this ID
                // lblErrorMessage.Visible = true;
            }
        }
    }
}