using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MS3DB.Pages
{
    public partial class UnresolvedTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnFetchUnresolvedTickets_Click(object sender, EventArgs e)
        {
            int customerID = int.Parse(txtCustomerID.Text);
            List<UnresolvedTicket> tickets = GetUnresolvedTickets(customerID);

            unresolvedTicketsRepeater.DataSource = tickets;
            unresolvedTicketsRepeater.DataBind();
        }

        private List<UnresolvedTicket> GetUnresolvedTickets(int customerID)
        {
            List<UnresolvedTicket> tickets = new List<UnresolvedTicket>();
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand("sp_GetUnresolvedTicketsByCustomer", connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@CustomerID", customerID);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        tickets.Add(new UnresolvedTicket
                        {
                            AccountID = Convert.ToInt32(reader["AccountID"]),
                            UnresolvedTickets = Convert.ToInt32(reader["UnresolvedTickets"])
                        });
                    }
                }
            }

            return tickets;
        }
    }

    public class UnresolvedTicket
    {
        public int AccountID { get; set; }
        public int UnresolvedTickets { get; set; }
    }
}
