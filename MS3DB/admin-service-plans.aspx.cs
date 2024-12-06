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
                    SELECT sp.planID,
                           cp.first_name + ' ' + cp.last_name AS CustomerName,
                           ca.mobileNo,
                           sp.name AS PlanName,
                           sp.price,
                           sp.SMS_offered,
                           sp.minutes_offered,
                           sp.data_offered,
                           s.subscription_date,
                           s.status AS SubscriptionStatus
                    FROM customer_account ca
                    LEFT JOIN customer_profile cp ON cp.nationalID = ca.nationalID
                    LEFT JOIN Subscription s ON ca.mobileNo = s.mobileNo
                    JOIN Service_plan sp ON s.planID = sp.planID";

				SqlCommand command = new SqlCommand(query, connection);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						ServicePlan plan = new ServicePlan
						{
							PlanID = Convert.ToInt32(reader["planID"]),
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

		protected void FilterServicePlans(object sender, EventArgs e)
		{
			List<ServicePlan> servicePlans = new List<ServicePlan>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT sp.planID,
                           cp.first_name + ' ' + cp.last_name AS CustomerName,
                           ca.mobileNo,
                           sp.name AS PlanName,
                           sp.price,
                           sp.SMS_offered,
                           sp.minutes_offered,
                           sp.data_offered,
                           s.subscription_date,
                           s.status AS SubscriptionStatus
                    FROM customer_account ca
                    LEFT JOIN customer_profile cp ON cp.nationalID = ca.nationalID
                    LEFT JOIN Subscription s ON ca.mobileNo = s.mobileNo
                    JOIN Service_plan sp ON s.planID = sp.planID
                    WHERE (@PlanID IS NULL OR sp.planID = @PlanID) AND 
                          (@InputDate IS NULL OR s.subscription_date <= @InputDate)";

				SqlCommand command = new SqlCommand(query, connection);
				SqlParameter planIDParam = new SqlParameter("@PlanID", DBNull.Value);
				SqlParameter inputDateParam = new SqlParameter("@InputDate", DBNull.Value);

				if (!string.IsNullOrWhiteSpace(planId.Text))
				{
					planIDParam.Value = Convert.ToInt32(planId.Text);
				}

				if (!string.IsNullOrWhiteSpace(inputDate.Text))
				{
					inputDateParam.Value = inputDate.Text;
				}

				command.Parameters.Add(planIDParam);
				command.Parameters.Add(inputDateParam);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						ServicePlan plan = new ServicePlan
						{
							PlanID = Convert.ToInt32(reader["planID"]),
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

		protected void ShowTotalUsage(object sender, EventArgs e)
		{
			string mobileNo = Request.Form["mobileNo"];
			string inputDate = Request.Form["inputDate"];

			List<UsageData> usageDataList = new List<UsageData>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT sp.name AS PlanName,
                           pu.start_date,
                           pu.end_date,
                           pu.data_consumption,
                           pu.minutes_used,
                           pu.SMS_sent
                    FROM Plan_Usage pu
                    JOIN Service_plan sp ON pu.planID = sp.planID
                    WHERE pu.mobileNo = @MobileNo AND pu.start_date >= @InputDate";

				SqlCommand command = new SqlCommand(query, connection);
				command.Parameters.AddWithValue("@MobileNo", mobileNo);
				command.Parameters.AddWithValue("@InputDate", inputDate);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						UsageData usageData = new UsageData
						{
							PlanName = reader["PlanName"].ToString(),
							StartDate = reader["start_date"].ToString(),
							EndDate = reader["end_date"].ToString(),
							DataConsumption = Convert.ToDecimal(reader["data_consumption"]),
							MinutesUsed = Convert.ToInt32(reader["minutes_used"]),
							SMSSent = Convert.ToInt32(reader["SMS_sent"])
						};
						usageDataList.Add(usageData);
					}
				}
			}

			usageDataRepeater.DataSource = usageDataList;
			usageDataRepeater.DataBind();
		}
	}

	public class ServicePlan
	{
		public int PlanID { get; set; }
		public string CustomerName { get; set; }
		public string MobileNo { get; set; }
		public string PlanName { get; set; }
		public decimal Price { get; set; }
		public int SMSOffered { get; set; }
		public int MinutesOffered { get; set; }
		public int DataOffered { get; set; }
		public string SubscriptionDate { get; set; }
		public string SubscriptionStatus { get; set; }
	}

	public class UsageData
	{
		public string PlanName { get; set; }
		public string StartDate { get; set; }
		public string EndDate { get; set; }
		public decimal DataConsumption { get; set; }
		public int MinutesUsed { get; set; }
		public int SMSSent { get; set; }
	}
}
