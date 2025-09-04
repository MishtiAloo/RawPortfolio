<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addProject.aspx.cs" Inherits="Portfolio_v1._0.WebForm3" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Add Project</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Rajdhani:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <link rel="stylesheet" href="main.css" runat="server"/>
    <script src="main.js" defer></script>
  </head>
  <body>
    <div class="mini-sections">
      <h1>Add Project</h1>
      <form
        class="addSthForm" runat="server" id="form1"
        style="display: flex; flex-direction: column; gap: 1rem"
      >
        <div>
          <label>Project Image URL: </label>
          <input type="text" id="img" name="img" />
        </div>
        <div>
          <label>Project Title: </label>
          <input type="text" id="title" name="title" />
        </div>
        <div>
          <label>Description: </label>
          <textarea id="desc" name="desc" rows="4" cols="100"></textarea>
        </div>
        <div>
          <label>Tags (comma separated): </label>
          <input type="text" id="tags" name="tags" />
        </div>
        <div>
          <label>Stacks (comma separated): </label>
          <input type="text" id="stacks" name="stacks" />
        </div>
        <div>
          <label>Github Link: </label>
          <input type="text" id="githubLink" name="githubLink" />
        </div>
        <div>
          <label>Website Link: </label>
          <input type="text" id="websiteLink" name="websiteLink" />
        </div>
        <div style="display: flex; justify-content: flex-end; gap: 1rem; flex-direction: row;">
            <button style="width: fit-content" type="button" runat="server" id="btnCancel" OnServerClick="btnCancel_Click">Cancel</button>
            <button style="width: fit-content; background-color: green" type="button" runat="server" id="btnAdd" OnServerClick="btnAdd_Click">Add Project</button>
        </div>

      </form>
    </div>
  </body>
</html>
