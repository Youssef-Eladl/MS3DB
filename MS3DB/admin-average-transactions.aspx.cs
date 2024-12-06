using System;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3DB.Pages
{
	public partial class admin_average_transactions : System.Web.UI.Page
	{
		protected TextBox walletID;
		protected TextBox startDate;
		protected TextBox endDate;
		protected Label resultLabel;
		protected Label errorMessage;

		protected void Page_Load(object sender, EventArgs e)
		{
		}

		protected void GetAverageAmount(object sender, EventArgs e)
		{
			int walletId = Convert.ToInt32(walletID.Text);
			DateTime start = Convert.ToDateTime(startDate.Text);
			DateTime end = Convert.ToDateTime(endDate.Text);

			decimal averageAmount = 0;

			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT AVG(amount) AS AverageAmount
                    FROM transfer_money
                    WHERE walletID1 = @WalletID AND transfer_date BETWEEN @StartDate AND @EndDate";

				SqlCommand command = new SqlCommand(query, connection);
				command.Parameters.AddWithValue("@WalletID", walletId);
				command.Parameters.AddWithValue("@StartDate", start);
				command.Parameters.AddWithValue("@EndDate", end);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					if (reader.Read())
					{
						averageAmount = reader["AverageAmount"] != DBNull.Value ? Convert.ToDecimal(reader["AverageAmount"]) : 0;
					}
				}
			}

			if (averageAmount > 0)
			{
				resultLabel.Text = $"Average Sent Transaction Amount: {averageAmount:F2}";
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
