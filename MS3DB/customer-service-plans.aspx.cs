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
}
