using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3DB.Pages
{
 
    public partial class CustomerProfiles : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    LoadCustomerProfiles();
                }
            }

            private void LoadCustomerProfiles()
            {
                // List to hold customer profile data
                List<CustomerProfile> customerProfiles = new List<CustomerProfile>();

                // Fetch connection string from Web.config
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

                // Database interaction
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"CREATE VIEW [allCustomerAccounts] AS
                    SELECT p.*,a.mobileNo,a.account_type,a.status,a.start_date,a.balance,a.points from customer_profile p
                        inner join customer_account a 
                        on p.nationalID = a.nationalID
                        where a.status = 'active' ";

                    SqlCommand command = new SqlCommand(query, connection);
                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            // Map the data to the CustomerProfile object
                            CustomerProfile profile = new CustomerProfile
                            {
                                CustomerID = Convert.ToInt32(reader["CustomerID"]),
                                CustomerName = reader["CustomerName"].ToString(),
                                Email = reader["Email"].ToString(),
                                Phone = reader["Phone"].ToString(),
                                AccountID = Convert.ToInt32(reader["AccountID"]),
                                PlanID = Convert.ToInt32(reader["PlanID"]),
                                SubscribedDate = Convert.ToDateTime(reader["SubscribedDate"]),
                                TotalUsage = Convert.ToDecimal(reader["TotalUsage"])
                            };

                            customerProfiles.Add(profile);
                        }
                    }
                }

                // Bind the data to the Repeater control
                customerProfilesRepeater.DataSource = customerProfiles;
                customerProfilesRepeater.DataBind();
            }
        }

        // Data object representing a customer profile with an active account
        public class CustomerProfile
        {
            public int CustomerID { get; set; }
            public string CustomerName { get; set; }
            public string Email { get; set; }
            public string Phone { get; set; }
            public int AccountID { get; set; }
            public int PlanID { get; set; }
            public DateTime SubscribedDate { get; set; }
            public decimal TotalUsage { get; set; }
        }
    }
