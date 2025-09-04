using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Portfolio_v1._0
{
    public partial class WebForm2 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Attach client-side click to Cancel button
            if (!IsPostBack)
            {
                // Optionally, you can do something on page load
            }
        }

        // Called when Add Certificate button is clicked
        protected void btnAdd_Click(object sender, EventArgs e)
        {
            // Read values from plain HTML inputs using Request.Form
            string imgUrl = Request.Form["img"]?.Trim();
            string certTitle = Request.Form["title"]?.Trim();
            string certDesc = Request.Form["desc"]?.Trim();
            string certTags = Request.Form["tags"]?.Trim();
            string certIssuedOn = Request.Form["issuedOn"]?.Trim();
            string certIssuedBy = Request.Form["issuedBy"]?.Trim();
            string certLink = Request.Form["links"]?.Trim();

            // Connection string from Web.config
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDb"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                try
                {
                    conn.Open();

                    string query = @"INSERT INTO Certificates
                                    (ImageUrl, Title, Description, Tags, IssuedOn, IssuedBy, CertificateLink)
                                     VALUES (@img, @title, @desc, @tags, @issuedOn, @issuedBy, @link)";

                    SqlCommand cmd = new SqlCommand(query, conn);
                    cmd.Parameters.AddWithValue("@img", imgUrl);
                    cmd.Parameters.AddWithValue("@title", certTitle);
                    cmd.Parameters.AddWithValue("@desc", certDesc);
                    cmd.Parameters.AddWithValue("@tags", certTags);
                    cmd.Parameters.AddWithValue("@issuedOn", certIssuedOn);
                    cmd.Parameters.AddWithValue("@issuedBy", certIssuedBy);
                    cmd.Parameters.AddWithValue("@link", certLink);

                    int rows = cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        // Success message
                        Response.Write("<script>alert('Certificate added successfully!');</script>");
                        // Optionally clear fields via JS
                        Response.Write("<script>document.getElementById('form2').reset();</script>");
                    }
                    else
                    {
                        Response.Write("<script>alert('Failed to add certificate.');</script>");
                    }
                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('Error: " + ex.Message.Replace("'", "\\'") + "');</script>");
                }
            }
        }

        // Called when Cancel button is clicked
        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Redirect to admin or list page
            Response.Redirect("admin.aspx");
        }
    }
}
