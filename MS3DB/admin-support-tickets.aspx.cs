using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace MS3DB.Pages
{
	public partial class admin_support_tickets : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadResolvedTickets();
			}
		}

		private void LoadResolvedTickets()
		{
			List<ResolvedTicket> resolvedTickets = new List<ResolvedTicket>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT mobileNo, issue_description, priority_level, status
                    FROM Technical_support_ticket
                    WHERE status = 'Resolved'";
				SqlCommand cmd = new SqlCommand(query, connection);
				connection.Open();

				using (SqlDataReader reader = cmd.ExecuteReader())
				{
					while (reader.Read())
					{
						ResolvedTicket ticket = new ResolvedTicket
						{
							MobileNo = reader["mobileNo"].ToString(),
							IssueDescription = reader["issue_description"].ToString(),
							PriorityLevel = Convert.ToInt32(reader["priority_level"]),
							Status = reader["status"].ToString()
						};
						resolvedTickets.Add(ticket);
					}
				}
			}

			resolvedTicketsRepeater.DataSource = resolvedTickets;
			resolvedTicketsRepeater.DataBind();
		}
	}

	public class ResolvedTicket
	{
		public string MobileNo { get; set; }
		public string IssueDescription { get; set; }
		public int PriorityLevel { get; set; }
		public string Status { get; set; }
	}
}
