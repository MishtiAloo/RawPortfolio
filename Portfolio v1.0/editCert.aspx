<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="editCert.aspx.cs" Inherits="Portfolio_v1._0.WebForm4" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <title>Edit Certificate</title>
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
  <h1>Edit Certificate</h1>

  <form method="post" class="addSthForm" style="display: flex; flex-direction: column; gap: 1rem">
    
    <input type="hidden" id="certificateId" name="projectId" value="<%= CertificateId %>" />

    <div>
      <label>Certificate Image URL: </label>
      <input type="text" id="img" name="img" value="<%= ImageUrl %>" />
    </div>
    <div>
      <label>Certificate Title: </label>
      <input type="text" id="title" name="title" value="<%= Title %>" />
    </div>
    <div>
      <label>Description: </label>
      <textarea id="desc" name="desc" rows="4" cols="100"><%= Description %></textarea>
    </div>
    <div>
      <label>Tags (comma separated): </label>
      <input type="text" id="tags" name="tags" value="<%= Tags %>" />
    </div>
    <div>
      <label>Issued On (date): </label>
      <input type="date" id="issuedOn" name="issuedOn" value="<%= IssuedOn %>" />
    </div>
    <div>
      <label>Issued By: </label>
      <input type="text" id="issuedBy" name="issuedBy" value="<%= IssuedBy %>" />
    </div>
    <div>
      <label>Link: </label>
      <input type="text" id="link" name="link" value="<%= Link %>" />
    </div>

    <div style="display: flex; justify-content: flex-end; gap: 1rem; flex-direction: row">
      <button style="width: fit-content" type="submit" name="action" value="cancel">Cancel</button>
      <button style="width: fit-content; background-color: green" type="submit" name="action" value="save">
        Save Project
      </button>
    </div>
  </form>
</div>
  </body>
</html>
