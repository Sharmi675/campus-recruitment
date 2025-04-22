using System;
using System.Web.UI;
using System.Data.OleDb;

namespace OnlineCampusRecruitmentSystem
{
    public partial class ScoreModule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                DisplayResults();
            }
        }

        private void DisplayResults()
        {
            if (Session["UserName"] != null)
            {
                txtUserName.Text = Session["UserName"].ToString();
            }
            else
            {
                txtUserName.Text = "Sharmi"; // Or handle as needed
            }

            if (Session["TestScore"] != null && Session["TotalQuestions"] != null)
            {
                int score = (int)Session["TestScore"];
                int totalQuestions = (int)Session["TotalQuestions"];

                int numerator = 10; // Or get this from where you are getting the 10 from
int denominator = 10; // Or get this from where you are getting the 10 from

lblScore.Text = string.Format("{0} / {1}", numerator, denominator); // Displays "10 / 10"

                 lblResult.Text = "Selected";
                    lblResult.CssClass = "selected";
                    lblMessage.Text = "Congratulations! You have cleared the online test.";
                    // Call UpdateSelectionStatus if needed (see previous responses)
                }
                else
                {
                    lblResult.Text = "Not Selected";
                    lblResult.CssClass = "not-selected";
                    lblMessage.Text = "Sorry, you have not cleared the online test. Better luck next time.";
                   }
            
        }

        protected void btnNext_Click(object sender, EventArgs e)
        {
            Response.Redirect("Interview Scheduling.aspx"); // Replace with your actual URL
        }
    }
}