using System;
using System.Configuration;
using System.Data.SqlClient;

namespace Portfolio_v1._0
{
    public partial class WebForm4 : System.Web.UI.Page
    {
        protected int CertificateId;
        protected string ImageUrl;
        protected string Title;
        protected string Description;
        protected string Tags;
        protected string IssuedOn;
        protected string IssuedBy;
        protected string Link;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    CertificateId = Convert.ToInt32(Request.QueryString["id"]);
                    LoadCertificate(CertificateId);
                }
            }
            else
            {
                // On Postback, keep hidden field value
                CertificateId = Convert.ToInt32(Request.Form["projectId"]);
            }

            if (Request.HttpMethod == "POST")
            {
                string action = Request.Form["action"];
                if (action == "save")
                {
                    SaveCertificate();
                }
                else if (action == "cancel")
                {
                    Response.Redirect("admin.aspx");
                }
            }
        }

        private void LoadCertificate(int certId)
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = "SELECT * FROM Certificates WHERE CertificateId=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@Id", certId);
                conn.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                if (reader.Read())
                {
                    ImageUrl = reader["ImageUrl"] != DBNull.Value ? reader["ImageUrl"].ToString() : "";
                    Title = reader["Title"] != DBNull.Value ? reader["Title"].ToString() : "";
                    Description = reader["Description"] != DBNull.Value ? reader["Description"].ToString() : "";
                    Tags = reader["Tags"] != DBNull.Value ? reader["Tags"].ToString() : "";
                    IssuedOn = reader["IssuedOn"] != DBNull.Value
                                ? Convert.ToDateTime(reader["IssuedOn"]).ToString("yyyy-MM-dd")
                                : "";
                    IssuedBy = reader["IssuedBy"] != DBNull.Value ? reader["IssuedBy"].ToString() : "";
                    Link = reader["CertificateLink"] != DBNull.Value ? reader["CertificateLink"].ToString() : "";
                }
            }
        }


        private void SaveCertificate()
        {
            string img = Request.Form["img"];
            string title = Request.Form["title"];
            string desc = Request.Form["desc"];
            string tags = Request.Form["tags"];
            string issuedOn = Request.Form["issuedOn"];
            string issuedBy = Request.Form["issuedBy"];
            string link = Request.Form["link"];

            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                string query = @"UPDATE Certificates 
                                 SET ImageUrl=@ImageUrl, Title=@Title, Description=@Description, 
                                     Tags=@Tags, IssuedOn=@IssuedOn, IssuedBy=@IssuedBy, CertificateLink=@Link
                                 WHERE CertificateId=@Id";
                SqlCommand cmd = new SqlCommand(query, conn);
                cmd.Parameters.AddWithValue("@ImageUrl", img);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Description", desc);
                cmd.Parameters.AddWithValue("@Tags", tags);
                cmd.Parameters.AddWithValue("@IssuedOn", issuedOn);
                cmd.Parameters.AddWithValue("@IssuedBy", issuedBy);
                cmd.Parameters.AddWithValue("@Link", link);
                cmd.Parameters.AddWithValue("@Id", CertificateId);

                conn.Open();
                cmd.ExecuteNonQuery();
            }

            Response.Redirect("admin.aspx");
        }
    }
}
