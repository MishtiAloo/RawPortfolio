using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace Portfolio_v1._0
{
    public partial class WebForm6 : System.Web.UI.Page
    {
        // These properties are used by your .aspx inline expressions:
        // value="<%= ImageUrl %>" and textarea content "<%= Description %>"
        public int ProjectId { get; set; }
        public string ImageUrl { get; set; } = "";
        public string Title { get; set; } = "";
        public string Description { get; set; } = "";
        public string Tags { get; set; } = "";
        public string Stacks { get; set; } = "";
        public string GithubLink { get; set; } = "";
        public string WebsiteLink { get; set; } = "";

        protected void Page_Load(object sender, EventArgs e)
        {
            // Use HTTP method (GET / POST) because you're using plain HTML form elements
            if (Request.HttpMethod.Equals("GET", StringComparison.OrdinalIgnoreCase))
            {
                // Initial load: read id from querystring and populate form
                if (int.TryParse(Request.QueryString["id"], out int id) && id > 0)
                {
                    LoadProject(id);
                }
                else
                {
                    // no id -> go back to admin
                    Response.Redirect("admin.aspx");
                }
            }
            else if (Request.HttpMethod.Equals("POST", StringComparison.OrdinalIgnoreCase))
            {
                // Form submitted
                string action = (Request.Form["action"] ?? "").Trim().ToLowerInvariant();
                if (action == "save")
                {
                    SaveProject();
                }
                else
                {
                    // cancel or unknown -> go back without saving
                    Response.Redirect("admin.aspx");
                }
            }
        }

        private void LoadProject(int projectId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            using (SqlCommand cmd = new SqlCommand(@"
                    SELECT ProjectId, ImageUrl, Title, Description, Tags, Stacks, GithubLink, WebsiteLink
                    FROM Projects
                    WHERE ProjectId = @ProjectId", conn))
            {
                cmd.Parameters.AddWithValue("@ProjectId", projectId);
                conn.Open();

                using (SqlDataReader reader = cmd.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        ProjectId = reader["ProjectId"] != DBNull.Value ? Convert.ToInt32(reader["ProjectId"]) : 0;

                        // HTML-encode values so inline <%= ... %> output won't break attributes or textareas
                        ImageUrl = HttpUtility.HtmlEncode(Convert.ToString(reader["ImageUrl"]));
                        Title = HttpUtility.HtmlEncode(Convert.ToString(reader["Title"]));
                        Description = HttpUtility.HtmlEncode(Convert.ToString(reader["Description"]));
                        Tags = HttpUtility.HtmlEncode(Convert.ToString(reader["Tags"]));
                        Stacks = HttpUtility.HtmlEncode(Convert.ToString(reader["Stacks"]));
                        GithubLink = HttpUtility.HtmlEncode(Convert.ToString(reader["GithubLink"]));
                        WebsiteLink = HttpUtility.HtmlEncode(Convert.ToString(reader["WebsiteLink"]));
                    }
                    else
                    {
                        // Not found -> redirect back
                        Response.Redirect("admin.aspx");
                    }
                }
            }
        }

        private void SaveProject()
        {
            // Prefer posted hidden projectId, fall back to querystring
            int projectId = 0;
            string postedPid = Request.Form["projectId"];
            if (!int.TryParse(postedPid, out projectId))
            {
                int.TryParse(Request.QueryString["id"], out projectId);
            }

            if (projectId <= 0)
            {
                Response.Write("<script>alert('Invalid project id.'); window.location='admin.aspx';</script>");
                return;
            }

            // Read values from the plain HTML fields
            string img = Request.Form["img"] ?? "";
            string title = Request.Form["title"] ?? "";
            string desc = Request.Form["desc"] ?? "";
            string tags = Request.Form["tags"] ?? "";
            string stacks = Request.Form["stacks"] ?? "";
            string github = Request.Form["githubLink"] ?? "";
            string website = Request.Form["websiteLink"] ?? "";

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

            try
            {
                using (SqlConnection conn = new SqlConnection(connStr))
                using (SqlCommand cmd = conn.CreateCommand())
                {
                    cmd.CommandText = @"
                        UPDATE Projects
                        SET ImageUrl = @ImageUrl,
                            Title = @Title,
                            Description = @Description,
                            Tags = @Tags,
                            Stacks = @Stacks,
                            GithubLink = @GithubLink,
                            WebsiteLink = @WebsiteLink
                        WHERE ProjectId = @ProjectId";

                    cmd.Parameters.AddWithValue("@ImageUrl", (object)img ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Title", (object)title ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Description", (object)desc ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Tags", (object)tags ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@Stacks", (object)stacks ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@GithubLink", (object)github ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@WebsiteLink", (object)website ?? DBNull.Value);
                    cmd.Parameters.AddWithValue("@ProjectId", projectId);

                    conn.Open();
                    int rows = cmd.ExecuteNonQuery();

                    if (rows > 0)
                    {
                        // success -> back to admin
                        Response.Redirect("admin.aspx");
                    }
                    else
                    {
                        // nothing updated (shouldn't normally happen)
                        Response.Write("<script>alert('No changes were saved.');</script>");
                    }
                }
            }
            catch (Exception ex)
            {
                // Show error (escaped for JS)
                string esc = HttpUtility.JavaScriptStringEncode(ex.Message);
                Response.Write($"<script>alert('Error saving project: {esc}');</script>");
            }
        }
    }
}
