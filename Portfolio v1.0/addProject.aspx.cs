using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;

namespace Portfolio_v1._0
{
    public partial class WebForm3 : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Nothing needed here for now
        }

        protected void btnAdd_Click(object sender, EventArgs e)
        {
            try
            {
                // Read values from HTML inputs via Request.Form
                string imgUrl = Request.Form["img"]?.Trim();
                string title = Request.Form["title"]?.Trim();
                string description = Request.Form["desc"]?.Trim();
                string tags = Request.Form["tags"]?.Trim();
                string stacks = Request.Form["stacks"]?.Trim();
                string github = Request.Form["githubLink"]?.Trim();
                string website = Request.Form["websiteLink"]?.Trim();


                string connStr = ConfigurationManager.ConnectionStrings["PortfolioDb"].ConnectionString;

                using (SqlConnection conn = new SqlConnection(connStr))
                {
                    conn.Open();

                    string query = @"INSERT INTO Projects
                                     (Title, Description, Tags, Stacks, GithubLink, WebsiteLink, ImageUrl)
                                     VALUES
                                     (@Title, @Description, @Tags, @Stacks, @GithubLink, @WebsiteLink, @ImageUrl)";

                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Title", title);
                        cmd.Parameters.AddWithValue("@Description", description);
                        cmd.Parameters.AddWithValue("@Tags", tags);
                        cmd.Parameters.AddWithValue("@Stacks", stacks);
                        cmd.Parameters.AddWithValue("@GithubLink", github);
                        cmd.Parameters.AddWithValue("@WebsiteLink", website);
                        cmd.Parameters.AddWithValue("@ImageUrl", imgUrl);

                        int rows = cmd.ExecuteNonQuery();
                        if (rows > 0)
                        {
                            Response.Write("<script>alert('Project added successfully!');</script>");
                            // Optionally clear form fields
                            Response.Write("<script>document.getElementById('form1').reset();</script>");
                        }
                        else
                        {
                            Response.Write("<script>alert('Failed to add project.');</script>");
                        }
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Write($"<script>alert('Error: {ex.Message}');</script>");
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            // Redirect to another page
            Response.Redirect("admin.aspx");
        }
    }
}
