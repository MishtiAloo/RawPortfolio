using System;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_v1._0
{
    public partial class WebForm5 : System.Web.UI.Page
    {
        string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadProjects();
                LoadCertificates();
            }
        }

        private void LoadProjects()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Projects";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptProjects.DataSource = dt;
                rptProjects.DataBind();
            }
        }

        private void LoadCertificates()
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Certificates";
                SqlDataAdapter da = new SqlDataAdapter(query, conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptCertificates.DataSource = dt;
                rptCertificates.DataBind();
            }
        }

        // ------------------- DELETE FUNCTIONALITY -------------------
        protected void DeleteProject_Click(object sender, EventArgs e)
        {
            var btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            int projectId = Convert.ToInt32(btn.Attributes["data-id"]);
            DeleteProject(projectId);
            LoadProjects();
        }

        protected void DeleteCertificate_Click(object sender, EventArgs e)
        {
            var btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            int certId = Convert.ToInt32(btn.Attributes["data-id"]);
            DeleteCertificate(certId);
            LoadCertificates();
        }

        private void DeleteProject(int id)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Projects WHERE ProjectId=@id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        private void DeleteCertificate(int id)
        {
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "DELETE FROM Certificates WHERE CertificateId=@id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@id", id);
                conn.Open();
                cmd.ExecuteNonQuery();
            }
        }

        // ------------------- ADD BUTTONS -------------------
        protected void BtnAddProject_Click(object sender, EventArgs e)
        {
            Response.Redirect("addProject.aspx");
        }

        protected void BtnAddCert_Click(object sender, EventArgs e)
        {
            Response.Redirect("addCert.aspx");
        }

        // ------------------- EDIT BUTTONS -------------------
        protected void EditProject_Click(object sender, EventArgs e)
        {
            var btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            int projectId = Convert.ToInt32(btn.Attributes["data-id"]);
            // Redirect to an Edit page with the project id
            Response.Redirect($"editProject.aspx?id={projectId}");
        }

        protected void EditCertificate_Click(object sender, EventArgs e)
        {
            var btn = (System.Web.UI.HtmlControls.HtmlButton)sender;
            int certId = Convert.ToInt32(btn.Attributes["data-id"]);
            // Redirect to an Edit page with the certificate id
            Response.Redirect($"editCert.aspx?id={certId}");
        }

        protected void gotoMain(object sender, EventArgs e)
        {
            Response.Redirect("main.aspx");
        }

        protected void removeCookieSession(object sender, EventArgs e)
        {
            // ----- CLEAR SESSION -----
            Session.Clear();
            Session.Abandon();

            // ----- CLEAR COOKIE -----
            if (Request.Cookies["AdminUser"] != null)
            {
                HttpCookie cookie = new HttpCookie("AdminUser");
                cookie.Expires = DateTime.Now.AddDays(-1); // set expiration in the past
                Response.Cookies.Add(cookie);
            }

            // ----- REDIRECT TO MAIN PAGE -----
            Response.Redirect("main.aspx");
        }
    }
}
