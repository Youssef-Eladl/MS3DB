using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace MS3DB.Pages
{
	public partial class admin_customer_profiles : System.Web.UI.Page
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
			List<CustomerProfileWithAccounts> customerProfiles = new List<CustomerProfileWithAccounts>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT cp.NationalID, cp.first_name, cp.last_name, cp.Email, cp.Address, cp.Date_Of_Birth,
                           ca.MobileNo, ca.Account_Type, ca.Status, ca.Start_Date, ca.Balance, ca.Points
                    FROM Customer_Profile cp
                    LEFT JOIN Customer_Account ca ON cp.NationalID = ca.NationalID
                    WHERE ca.Status = 'active'";
				SqlCommand cmd = new SqlCommand(query, connection);
				connection.Open();

				using (SqlDataReader reader = cmd.ExecuteReader())
				{
					while (reader.Read())
					{
						CustomerProfileWithAccounts profile = new CustomerProfileWithAccounts
						{
							NationalID = reader["NationalID"].ToString(),
							FirstName = reader["First_Name"].ToString(),
							LastName = reader["Last_Name"].ToString(),
							Email = reader["Email"].ToString(),
							Address = reader["Address"].ToString(),
							DateOfBirth = (reader["Date_Of_Birth"]).ToString(),
							MobileNo = reader["MobileNo"].ToString(),
							AccountType = reader["Account_Type"].ToString(),
							Status = reader["Status"].ToString(),
							StartDate = reader["Start_Date"].ToString(),
							Balance = Convert.ToDecimal(reader["Balance"]),
							Points = Convert.ToInt32(reader["Points"])
						};
						customerProfiles.Add(profile);
					}
				}
			}

			customerProfilesRepeater.DataSource = customerProfiles;
			customerProfilesRepeater.DataBind();
		}
	}

	public class CustomerProfileWithAccounts
	{
		public string NationalID { get; set; }
		public string FirstName { get; set; }
		public string LastName { get; set; }
		public string Email { get; set; }
		public string Address { get; set; }
		public String DateOfBirth { get; set; }
		public string MobileNo { get; set; }
		public string AccountType { get; set; }
		public string Status { get; set; }
		public String StartDate { get; set; }
		public decimal Balance { get; set; }
		public int Points { get; set; }
	}
}
