<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Online Test.aspx.cs" Inherits="OnlineCampusRecruitmentSystem.OnlineTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Online Test</title>
    <style>
        /* Your CSS styles here */
        body {
            font-family: Arial, sans-serif;
        }

        .test-container {
            width: 80%;
            margin: 40px auto;
            padding: 20px;
            border: 1px solid #ccc;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .question-container { /* Style for each question container */
            margin-bottom: 20px;
        }

        .question-label {
            display: block;
            margin-bottom: 10px;
        }

        .options-list { /* Style for the RadioButtonList */
            margin-bottom: 20px;
        }

        .options-list label { /* Style the labels for the radio buttons */
            display: inline-block; /* Make labels sit side by side */
            margin-right: 10px;
        }

        .submit-button {
            background-color: #4CAF50;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }

        .submit-button:hover 
            background-color: #3e8e41;
        }
        .options {
            height: 22px;
            width: 896px;
        }
    </style>
</head>
<body>
    <div class="test-container">
        <form id="form1" runat="server">
            <h2>Online Test
                <asp:Label ID="lblErrorMessage" runat="server" Text=""></asp:Label>
            </h2>

            <asp:Panel ID="pnlQuestions" runat="server"></asp:Panel>
              <%-- Container for the questions --%>
            <!-- Question 1 -->
<div class="question">
<label>What does CPU stand for?</label>
<div class="options">
<input type="radio" name="q1" value="Central Processing Unit"> Central Processing Unit
<input type="radio" name="q1" value="Computer Processing Unit"> Computer Processing Unit
<input type="radio" name="q1" value="Central Performance Unit"> Central Performance Unit
</div>
</div>
 <!-- Question 2 -->
  <div class="question">
    <label>Which of the following operating systems is open-source?</label>
    <div class="options">
      <input type="radio" name="q2" value="Windows"> Windows
      <input type="radio" name="q2" value="macOS"> macOS
      <input type="radio" name="q2" value="Linux"> Linux
    </div>
  </div>
  
  <!-- Question 3 -->
  <div class="question">
    <label>What is the primary function of RAM?</label>
    <div class="options">
      <input type="radio" name="q3" value="To store data permanently"> To store data permanently
      <input type="radio" name="q3" value="To provide power to the computer"> To provide power to the computer
      <input type="radio" name="q3" value="To temporarily store data for processing"> To temporarily store data for processing
    </div>
  </div>
  
  <!-- Question 4 -->
  <div class="question">
    <label>Which of the following programming languages is used for web development?</label>
    <div class="options">
      <input type="radio" name="q4" value="Java"> Java
      <input type="radio" name="q4" value="Python"> Python
      <input type="radio" name="q4" value="JavaScript"> JavaScript
    </div>
  </div>
  
  <!-- Question 5 -->
  <div class="question">
    <label>What is the term for a network of interconnected computers?</label>
    <div class="options">
      <input type="radio" name="q5" value="Internet"> Internet
      <input type="radio" name="q5" value="Intranet"> Intranet
      <input type="radio" name="q5" value="Network"> Network
    </div>
  </div>
  
  <!-- Question 6 -->
  <div class="question">
    <label>Which of the following devices is used to connect multiple computers to a network?</label>
    <div class="options">
      <input type="radio" name="q6" value="Router"> Router
      <input type="radio" name="q6" value="Switch"> Switch
      <input type="radio" name="q6" value="Modem"> Modem
    </div>
  </div>
  
  <!-- Question 7 -->
  <div class="question">
    <label>What is the term for a type of malware that demands payment in exchange for restoring access to data?</label>
    <div class="options">
      <input type="radio" name="q7" value="Virus"> Virus
      <input type="radio" name="q7" value="Worm"> Worm&nbsp;
        <asp:RadioButton ID="RadioButton1" runat="server" Text="Ransomware" />
&nbsp;<!-- Question 8 --><div class="question">
<label>What is the term for a type of computer memory that loses its data when the power is turned off?</label>
<div class="options">
<input type="radio" name="q8" value="RAM"> RAM
<input type="radio" name="q8" value="ROM"> ROM
<input type="radio" name="q8" value="Cache"> Cache
</div>
</div>

<!-- Question 9 -->
<div class="question">
<label>Which of the following programming languages is known for its simplicity and ease of use?</label>
<div class="options">
<input type="radio" name="q9" value="C++"> C++
<input type="radio" name="q9" value="Java"> Java
<input type="radio" name="q9" value="Python"> Python
</div>
    </div>

<!-- Question 10 -->
<div class="question">
<label>What is the term for a type of computer network that connects devices within a limited geographical area?</label>
<div class="options">
<input type="radio" name="q10" value="LAN"> LAN
<input type="radio" name="q10" value="WAN"> WAN
<input type="radio" name="q10" value="MAN"> MAN
</div>
</div>



            <asp:Button ID="btnSave" runat="server" Text="SAVE" OnClick="btnSave_Click" CssClass="submit-button" />
            </form>
    </div>
</body>
</html>