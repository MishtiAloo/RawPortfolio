using System;
using System.Configuration;
using System.Data.SqlClient;
using System.Web;

namespace Portfolio_v1._0
{
    public partial class WebForm7 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // ----- COOKIE CHECK -----
            HttpCookie adminCookie = Request.Cookies["AdminUser"];
            if (adminCookie != null)
            {
                // Optionally, validate cookie values
                if (!string.IsNullOrEmpty(adminCookie["AdminId"]))
                {
                    // Initialize session from cookie
                    Session["AdminId"] = adminCookie["AdminId"];
                    Session["AdminName"] = adminCookie["AdminName"];

                    // Redirect to admin panel
                    Response.Redirect("admin.aspx");
                    return; // stop further processing
                }
            }

            // ----- FORM POST HANDLING -----
            if (Request.HttpMethod == "POST" && Request.Form["action"] == "login")
            {
                AuthenticateAdmin();
            }
        }

        private void AuthenticateAdmin()
        {
            string username = Request.Form["username"];
            string password = Request.Form["password"];

            if (string.IsNullOrEmpty(username) || string.IsNullOrEmpty(password))
            {
                Response.Write("<script>alert('Please enter username and password.');</script>");
                return;
            }

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT AdminId, FullName, PasswordHash FROM Admins WHERE Username=@Username";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Username", username);

                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    string storedPassword = reader["PasswordHash"].ToString(); // plaintext
                    int adminId = Convert.ToInt32(reader["AdminId"]);
                    string fullName = reader["FullName"].ToString();

                    if (password == storedPassword)
                    {
                        // ----- SESSION -----
                        Session["AdminId"] = adminId;
                        Session["AdminName"] = fullName;

                        // ----- COOKIE -----
                        HttpCookie newCookie = new HttpCookie("AdminUser");
                        newCookie["AdminId"] = adminId.ToString();
                        newCookie["AdminName"] = fullName;
                        newCookie.Expires = DateTime.Now.AddDays(7);
                        Response.Cookies.Add(newCookie);

                        Response.Redirect("admin.aspx");
                        return;
                    }
                }

                Response.Write("<script>alert('Invalid username or password');</script>");
            }
        }
    }
}
