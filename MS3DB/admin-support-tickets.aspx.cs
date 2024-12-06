using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3DB.Pages
{
public partial class admin_support_tickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
            Loadadmin_support_tickets();
            }
        }

        private void Loadadmin_support_tickets()
        {
            // List to hold resolved ticket data
            List<ResolvedTicket> resolvedTickets = new List<ResolvedTicket>();

            // Fetch connection string from Web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

            // Database interaction
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"CREATE VIEW [allResolvedTickets] AS \r\n select * from Technical_support_ticket \r\n where status = 'Resolved'";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        // Map the data to the ResolvedTicket object
                        ResolvedTicket ticket = new ResolvedTicket
                        {
                            TicketID = Convert.ToInt32(reader["TicketID"]),
                            CustomerName = reader["CustomerName"].ToString(),
                            Issue = reader["Issue"].ToString(),
                            Resolution = reader["Resolution"].ToString(),
                            ResolvedDate = Convert.ToDateTime(reader["ResolvedDate"])
                        };

                        resolvedTickets.Add(ticket);
                    }
                }
            }

            // Bind the data to the Repeater control
            resolvedTicketsRepeater.DataSource = resolvedTickets;
            resolvedTicketsRepeater.DataBind();
        }
    }


}
public class ResolvedTicket
{
    public int TicketID { get; set; }
    public string CustomerName { get; set; }
    public string Issue { get; set; }
    public string Resolution { get; set; }
    public DateTime ResolvedDate { get; set; }
}
