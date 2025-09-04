using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Portfolio_v1._0
{
    public partial class WebForm1 : System.Web.UI.Page
    {
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
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
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

        protected void rptProjects_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                // Find the container div
                var stacksContainer = (System.Web.UI.HtmlControls.HtmlGenericControl)e.Item.FindControl("StacksContainer");
                if (stacksContainer != null)
                {
                    // Get the Stacks string from the DataItem
                    string stacks = DataBinder.Eval(e.Item.DataItem, "Stacks")?.ToString();
                    if (!string.IsNullOrEmpty(stacks))
                    {
                        // Split by comma and add each as <span class="used-stack">
                        foreach (string stack in stacks.Split(','))
                        {
                            stacksContainer.Controls.Add(new LiteralControl($"<span class='used-stack'>{stack.Trim()}</span>"));
                        }
                    }
                }
            }
        }

        private void LoadCertificates()
        {
            string connStr = ConfigurationManager.ConnectionStrings["PortfolioDB"].ConnectionString;
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

    }
}