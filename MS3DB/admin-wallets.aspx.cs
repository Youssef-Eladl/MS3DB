using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;

namespace MS3DB.Pages
{
	public partial class admin_wallets : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadWallets();
			}
		}

		private void LoadWallets()
		{
			List<WalletDetails> walletDetailsList = new List<WalletDetails>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT w.nationalID, cp.first_name + ' ' + cp.last_name AS CustomerName, w.mobileNo, w.current_balance, w.currency, w.last_modified_date
                    FROM Wallet w
                    JOIN customer_profile cp ON w.nationalID = cp.nationalID";

				SqlCommand command = new SqlCommand(query, connection);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						WalletDetails details = new WalletDetails
						{
							NationalID = reader["nationalID"].ToString(),
							CustomerName = reader["CustomerName"].ToString(),
							MobileNo = reader["mobileNo"].ToString(),
							CurrentBalance = Convert.ToDecimal(reader["current_balance"]),
							Currency = reader["currency"].ToString(),
							LastModifiedDate = Convert.ToDateTime(reader["last_modified_date"]).ToString("yyyy-MM-dd")
						};
						walletDetailsList.Add(details);
					}
				}
			}

			walletsRepeater.DataSource = walletDetailsList;
			walletsRepeater.DataBind();
		}
	}

	public class WalletDetails
	{
		public string NationalID { get; set; }
		public string CustomerName { get; set; }
		public string MobileNo { get; set; }
		public decimal CurrentBalance { get; set; }
		public string Currency { get; set; }
		public string LastModifiedDate { get; set; }
	}
}
