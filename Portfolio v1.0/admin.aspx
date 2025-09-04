<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin.aspx.cs"
    Inherits="Portfolio_v1._0.WebForm5" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin</title>
    <link href="https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=Rajdhani:wght@300;400;500;600;700&display=swap" rel="stylesheet" />
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css" />
    <link rel="stylesheet" href="main.css" runat="server" />
    <script src="main.js" defer></script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="admin-container">
            <div style="display: flex; flex-direction: row; gap: 3rem">
                <h1 style="font-size: 2rem">Welcome to Admin Page</h1>
                <button runat="server" onserverclick="removeCookieSession">Log Out</button>
            </div>

            <!-- PROJECTS SECTION -->
            <div class="mini-sections">
                <div style="width: 100%; display: flex; flex-direction: row; justify-content: center; align-items: center; margin-bottom: 2rem;">
                    <h1 style="font-size: 2.5rem">Projects</h1>
                    <button id="btnAddProject" runat="server" onserverclick="BtnAddProject_Click" style="margin-left: auto; gap: 0.5rem">
                        <i style="font-size: 1rem" class="fa-solid fa-plus"></i> Add a project
                    </button>
                </div>

                <!-- Repeater for Projects -->
                <div style="display: flex; flex-direction: column; gap: 2rem; width: 100%;">
                    <asp:Repeater ID="rptProjects" runat="server">
                        <ItemTemplate>
                            <div class="project-card-mini">
                                <div class="project-card-mini-rows">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' />
                                    <h2 style="color: #ff014f"><%# Eval("Title") %></h2>
                                    <div class="project-card-mini-rows" style="margin-left: auto; background-color: #ff014d2c; padding: 0 5px; border-radius: 10px;">
                                        <h3>Tags:</h3>
                                        <p><%# Eval("Tags") %></p>
                                    </div>
                                </div>
                                <p style="font-weight: 400"><%# Eval("Description") %></p>
                                <div class="project-card-mini-rows">
                                    <h3>Stacks:</h3>
                                    <p class="animated-links" style="color: #ff014f"><%# Eval("Stacks") %></p>
                                </div>
                                <div class="project-card-mini-rows">
                                    <h3>Links:</h3>
                                    <a class="animated-links" href='<%# Eval("GithubLink") %>' style="color: #ff014f">Github</a>
                                    <a class="animated-links" href='<%# Eval("WebsiteLink") %>' style="color: #ff014f">Website</a>
                                </div>
                                <div class="project-card-mini-rows" style="margin-left: auto">
                                    <!-- HTML button -->
                                    <button type="button" style="background-color: green" runat="server" onserverclick="EditProject_Click" data-id='<%# Eval("ProjectId") %>'>Edit</button>
                                    <button type="button" runat="server" onserverclick="DeleteProject_Click" data-id='<%# Eval("ProjectId") %>'>Delete</button>
                                    
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <!-- CERTIFICATES SECTION -->
            <div class="mini-sections">
                <div style="width: 100%; display: flex; flex-direction: row; justify-content: center; align-items: center; margin-bottom: 2rem;">
                    <h1 style="font-size: 2.5rem">Certificates</h1>
                    <button id="btnAddCert" runat="server" onserverclick="BtnAddCert_Click" style="margin-left: auto; gap: 0.5rem">
                        <i style="font-size: 1rem" class="fa-solid fa-plus"></i> Add a certificate
                    </button>
                </div>

                <!-- Repeater for Certificates -->
                <div style="display: flex; flex-direction: column; gap: 2rem; width: 100%;">
                    <asp:Repeater ID="rptCertificates" runat="server">
                        <ItemTemplate>
                            <div class="project-card-mini">
                                <div class="project-card-mini-rows">
                                    <img src='<%# Eval("ImageUrl") %>' alt='<%# Eval("Title") %>' />
                                    <h2 style="color: #ff014f"><%# Eval("Title") %></h2>
                                    <div class="project-card-mini-rows" style="margin-left: auto; background-color: #ff014d2c; padding: 0 5px; border-radius: 10px;">
                                        <h3>Tags:</h3>
                                        <p><%# Eval("Tags") %></p>
                                    </div>
                                </div>
                                <p style="font-weight: 400"><%# Eval("Description") %></p>
                                <div class="project-card-mini-rows">
                                    <h3>Issued On:</h3>
                                    <p class="animated-links" style="color: #ff014f"><%# Eval("IssuedOn", "{0:dd MMM, yyyy}") %></p>
                                </div>
                                <div class="project-card-mini-rows">
                                    <h3>Issued By:</h3>
                                    <p class="animated-links" style="color: #ff014f"><%# Eval("IssuedBy") %></p>
                                </div>
                                <div class="project-card-mini-rows">
                                    <h3>Links:</h3>
                                    <a class="animated-links" href='<%# Eval("CertificateLink") %>' style="color: #ff014f">Cert Link</a>
                                </div>
                                <div class="project-card-mini-rows" style="margin-left: auto">
                                    <!-- HTML button -->
                                    <button type="button" style="background-color: green" runat="server" onserverclick="EditCertificate_Click" data-id='<%# Eval("CertificateId") %>'>Edit</button>
                                    <button type="button" runat="server" onserverclick="DeleteCertificate_Click" data-id='<%# Eval("CertificateId") %>'>Delete</button>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>

            <button runat="server" style="font-size: 1.3rem; margin-bottom: 8rem; background-color: green;" onserverclick="gotoMain">
                Save and Go to HomePage
            </button>
        </div>
    </form>
</body>
</html>
