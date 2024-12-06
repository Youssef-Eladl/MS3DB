using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using MS3DB.objects;

namespace MS3DB.Pages
{
	public partial class customer_service_plans : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadServicePlans();
			}
		}

		private void LoadServicePlans()
		{
			List<ServicePlanonly> servicePlans = new List<ServicePlanonly>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = "SELECT * FROM Service_plan";
				SqlCommand command = new SqlCommand(query, connection);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						ServicePlanonly plan = new ServicePlanonly
						{
							PlanID = Convert.ToInt32(reader["planID"]),
							Name = reader["name"].ToString(),
							Price = Convert.ToInt32(reader["price"]),
							SMSOffered = Convert.ToInt32(reader["SMS_offered"]),
							MinutesOffered = Convert.ToInt32(reader["minutes_offered"]),
							DataOffered = Convert.ToInt32(reader["data_offered"]),
							Description = reader["description"].ToString()
						};
						servicePlans.Add(plan);
					}
				}
			}

			servicePlansOnlyRepeater.DataSource = servicePlans;
			servicePlansOnlyRepeater.DataBind();
		}
	}
    public class ConsumptionResult
    {
        public int TotalSMS { get; set; }
        public int TotalMinutes { get; set; }
        public decimal TotalInternet { get; set; }
    }


    {
        public partial class UnsubscribedPlans : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                if (!IsPostBack)
                {
                    // Optional: Initialize anything specific for the page load
                }
            }

            protected void btnFetchUnsubscribedPlans_Click(object sender, EventArgs e)
            {
                string mobileNumber = txtMobileNumber.Text;

                if (!string.IsNullOrWhiteSpace(mobileNumber))
                {
                    List<UnsubscribedPlan> plans = GetUnsubscribedPlans(mobileNumber);

                    if (plans.Count > 0)
                    {
                        unsubscribedPlansRepeater.DataSource = plans;
                        unsubscribedPlansRepeater.DataBind();
                        lblMessage.Text = string.Empty;
                    }
                    else
                    {
                        unsubscribedPlansRepeater.DataSource = null;
                        unsubscribedPlansRepeater.DataBind();
                        lblMessage.Text = "No unsubscribed plans found for the given mobile number.";
                    }
                }
                else
                {
                    lblMessage.Text = "Please enter a valid mobile number.";
                }
            }

            private List<UnsubscribedPlan> GetUnsubscribedPlans(string mobileNumber)
            {
                List<UnsubscribedPlan> plans = new List<UnsubscribedPlan>();

                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    string query = @"CREATE PROCEDURE sp_GetUnsubscribedPlans \r\n    @MobileNumber NVARCHAR(15)\r\nAS\r\nBEGIN\r\n    SELECT \r\n        sp.PlanID,\r\n        sp.Name AS PlanName,\r\n        sp.Price,\r\n        sp.SMSOffered,\r\n        sp.MinutesOffered,\r\n        sp.DataOffered,\r\n        sp.Description\r\n    FROM \r\n        ServicePlans sp\r\n    WHERE \r\n        sp.PlanID NOT IN (\r\n            SELECT a.PlanID \r\n            FROM Accounts a\r\n            INNER JOIN Customers c ON a.CustomerID = c.CustomerID\r\n            WHERE c.Phone = @MobileNumber\r\n        );\r\nEND;\r\n";
                    SqlCommand command = new SqlCommand(query, connection);
                    command.Parameters.AddWithValue("@MobileNumber", mobileNumber);

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        while (reader.Read())
                        {
                            UnsubscribedPlan plan = new UnsubscribedPlan
                            {
                                PlanID = Convert.ToInt32(reader["PlanID"]),
                                PlanName = reader["PlanName"].ToString(),
                                Price = Convert.ToDecimal(reader["Price"]),
                                SMSOffered = Convert.ToInt32(reader["SMSOffered"]),
                                MinutesOffered = Convert.ToInt32(reader["MinutesOffered"]),
                                DataOffered = Convert.ToInt32(reader["DataOffered"]),
                                Description = reader["Description"].ToString()
                            };

                            plans.Add(plan);
                        }
                    }
                }

                return plans;
            }
        }
    }
public class UnsubscribedPlan
{
    public int PlanID { get; set; }
    public string PlanName { get; set; }
    public decimal Price { get; set; }
    public int SMSOffered { get; set; }
    public int MinutesOffered { get; set; }
    public int DataOffered { get; set; }
    public string Description { get; set; }
}

}
