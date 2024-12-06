using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using MS3DB.objects;

namespace MS3DB.Pages
{
	public partial class admin_service_plans : System.Web.UI.Page
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
			List<ServicePlan> servicePlans = new List<ServicePlan>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT cp.first_name + ' ' + cp.last_name AS CustomerName,
                           ca.mobileNo,
                           sp.name AS PlanName,
                           sp.price,
                           sp.SMS_offered,
                           sp.minutes_offered,
                           sp.data_offered,
                           s.subscription_date,
                           s.status AS SubscriptionStatus
                    FROM customer_profile cp
                    JOIN customer_account ca ON cp.nationalID = ca.nationalID
                    JOIN Subscription s ON ca.mobileNo = s.mobileNo
                    JOIN Service_plan sp ON s.planID = sp.planID";

				SqlCommand command = new SqlCommand(query, connection);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						ServicePlan plan = new ServicePlan
						{
							CustomerName = reader["CustomerName"].ToString(),
							MobileNo = reader["mobileNo"].ToString(),
							PlanName = reader["PlanName"].ToString(),
							Price = Convert.ToDecimal(reader["price"]),
							SMSOffered = Convert.ToInt32(reader["SMS_offered"]),
							MinutesOffered = Convert.ToInt32(reader["minutes_offered"]),
							DataOffered = Convert.ToInt32(reader["data_offered"]),
							SubscriptionDate = reader["subscription_date"].ToString(),
							SubscriptionStatus = reader["SubscriptionStatus"].ToString()
						};
						servicePlans.Add(plan);
					}
				}
			}

			servicePlansRepeater.DataSource = servicePlans;
			servicePlansRepeater.DataBind();
		}
	}
}
