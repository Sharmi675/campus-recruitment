using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.OleDb;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OnlineCampusRecruitmentSystem
{
    public partial class OnlineTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadQuestions();
            }
        }

        private void LoadQuestions()
        {
            try
            {
                List<Question> questions = GetQuestionsFromDataSource();

                int questionNumber = 1; // Keep track of question numbers for control IDs

                foreach (Question question in questions)
                {
                    Panel questionContainer = new Panel(); // Use a more descriptive name
                    questionContainer.CssClass = "question-container"; // Apply CSS class

                    Label questionLabel = new Label();
                   questionLabel.Text = string.Format("{0}. {1}", questionNumber, question.QuestionText);
                    questionLabel.CssClass = "question-label"; // Apply CSS class
                    questionContainer.Controls.Add(questionLabel);
                    questionContainer.Controls.Add(new LiteralControl("<br />"));

                    RadioButtonList answerList = new RadioButtonList();
                    answerList.CssClass = "options-list"; // Apply CSS class
                    answerList.ID = "rblOptions" + questionNumber; // Set unique ID for each RadioButtonList

                    foreach (string answer in question.Answers)
                    {
                        answerList.Items.Add(new ListItem(answer, answer));
                    }

                    questionContainer.Controls.Add(answerList);
                    questionContainer.Controls.Add(new LiteralControl("<hr />"));
                    pnlQuestions.Controls.Add(questionContainer);

                    questionNumber++;
                }
            }
            catch (Exception ex)
            {
               string errorMessage = string.Format("Error loading questions: {0}", ex.Message);
System.Diagnostics.Trace.WriteLine(errorMessage);
                lblErrorMessage.Text = "An error occurred while loading the questions. Please try again later.";
                lblErrorMessage.Visible = true;
            }
        }

        private List<Question> GetQuestionsFromDataSource()
        {
            List<Question> questions = new List<Question>();
            string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\HP\\OneDrive\\Documents\\CampusRecruitment.accdb";

            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                string query = "SELECT QuestionID, QuestionText, OptionA, OptionB, OptionC, CorrectAnswer FROM Questions ORDER BY QuestionID";
                using (OleDbCommand command = new OleDbCommand(query, connection))
                {
                    try
                    {
                        connection.Open();
                        using (OleDbDataReader reader = command.ExecuteReader())
                        {
                            while (reader.Read())
                            {
                                Question question = new Question();
                                question.QuestionText = reader["QuestionText"].ToString();
                                question.Answers = new List<string> { reader["OptionA"].ToString(), reader["OptionB"].ToString(), reader["OptionC"].ToString() };
                                question.CorrectAnswer = reader["CorrectAnswer"].ToString();
                                questions.Add(question);
                            }
                        }
                    }
                    catch (Exception ex)
                    {
                      string errorMessage = string.Format("Error retrieving questions from database: {0}", ex.Message);
    System.Diagnostics.Trace.WriteLine(errorMessage);
                }
            }
            return questions;
        }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            List<string> selectedAnswers = new List<string>();
            List<string> correctAnswers = new List<string>();
            List<Question> questions = GetQuestionsFromDataSource();

            for (int i = 0; i < questions.Count; i++)
            {
                RadioButtonList rblOptions = FindControl("rblOptions" + (i + 1)) as RadioButtonList;
                if (rblOptions != null && rblOptions.SelectedItem != null)
                {
                    selectedAnswers.Add(rblOptions.SelectedItem.Value);
                }
                else
                {
                    selectedAnswers.Add("Not Answered");
                }
                correctAnswers.Add(questions[i].CorrectAnswer);
            }

            Session["SelectedAnswers"] = selectedAnswers;

            int score = 0;
            for (int i = 0; i < correctAnswers.Count; i++)
            {
                if (selectedAnswers[i] != "Not Answered" && selectedAnswers[i].Equals(correctAnswers[i], StringComparison.OrdinalIgnoreCase))
                {
                    score++;
                }
            }

            Session["TestScore"] = score;
            Session["TotalQuestions"] = correctAnswers.Count;
            Response.Redirect("Score Module.aspx");

            string connectionString = @"Provider=Microsoft.ACE.OLEDB.12.0;Data Source=C:\\Users\\HP\\OneDrive\\Documents\\CampusRecruitment.accdb";


            using (OleDbConnection connection = new OleDbConnection(connectionString))
            {
                if (score > 0)
                {
                    string insertQuery = "INSERT INTO Scores (UserName, Score, TestDate) VALUES (@UserID, @Score, @TestDate)";
                    using (OleDbCommand command = new OleDbCommand(insertQuery, connection))
                    {
                        command.Parameters.AddWithValue("@UserID", Session["UserName"]);
                        command.Parameters.AddWithValue("@Score", score);
                        command.Parameters.AddWithValue("@TestDate", DateTime.Now);

                        try
                        {
                            connection.Open();
                            command.ExecuteNonQuery();
                            Response.Redirect("Score Module.aspx");
                        }
                        catch (Exception ex)
                        {
                           string errorMessage = string.Format("Error saving score: {0}", ex.Message);
System.Diagnostics.Trace.WriteLine(errorMessage);
                            lblErrorMessage.Text = "An error occurred while saving your score. Please try again later.";
                            lblErrorMessage.Visible = true;
                            return;
                        }
                    }
                }
            }
        }
    }

    public class Question
    {
        public string QuestionText { get; set; }
        public List<string> Answers { get; set; }
        public string CorrectAnswer { get; set; } // Add CorrectAnswer property
    }
}