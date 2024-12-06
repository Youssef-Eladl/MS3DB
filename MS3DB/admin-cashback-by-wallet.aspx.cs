using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3DB.Pages
{
	public partial class admin_cashback_by_wallet : System.Web.UI.Page
	{
		protected TextBox walletID;
		protected TextBox planID;
		protected Label resultLabel;
		protected Label errorMessage;

		protected void Page_Load(object sender, EventArgs e)
		{
		}

		protected void GetCashbackAmount(object sender, EventArgs e)
		{
			int walletId = Convert.ToInt32(walletID.Text);
			int planId = Convert.ToInt32(planID.Text);

			decimal totalCashbackAmount = 0;

			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT SUM(c.amount) AS TotalCashbackAmount
                    FROM Cashback c
                    JOIN plan_provides_benefits pb ON c.benefitID = pb.benefitID
                    WHERE c.walletID = @WalletID AND pb.planID = @PlanID";

				SqlCommand command = new SqlCommand(query, connection);
				command.Parameters.AddWithValue("@WalletID", walletId);
				command.Parameters.AddWithValue("@PlanID", planId);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					if (reader.Read())
					{
						totalCashbackAmount = reader["TotalCashbackAmount"] != DBNull.Value ? Convert.ToDecimal(reader["TotalCashbackAmount"]) : 0;
					}
				}
			}

			if (totalCashbackAmount > 0)
			{
				resultLabel.Text = $"Total Cashback Amount: {totalCashbackAmount}";
				resultLabel.Visible = true;
				errorMessage.Visible = false;
			}
			else
			{
				errorMessage.Text = "Invalid input or no records found.";
				errorMessage.Visible = true;
				resultLabel.Visible = false;
			}
		}
	}
}
