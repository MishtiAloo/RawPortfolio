<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Portfolio_v1._0.WebForm7" %>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>login</title>
    <link
      href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Rajdhani:wght@300;400;500;600;700&display=swap"
      rel="stylesheet"
    />

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css"
    />

    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />

    <link rel="stylesheet" href="main.css" runat="server"/>
    <script src="main.js" defer></script>
  </head>
  <body>
    <div class="admin-container">
      <h1>Welcome to Admin Login</h1>
      <form method="post">
        <div class="form-container">
          <label for="username">Username:</label>
          <input type="text" id="username" name="username" required />
      
          <label for="password">Password:</label>
          <input type="password" id="password" name="password" required />
      
          <div style="display: flex; flex-direction: row; gap: 2rem">
            <button type="reset" style="background-color: gray">Cancel</button>
            <button type="submit" name="action" value="login" style="background-color: green">Login</button>
          </div>
        </div>
      </form>
    </div>
  </body>
</html>

