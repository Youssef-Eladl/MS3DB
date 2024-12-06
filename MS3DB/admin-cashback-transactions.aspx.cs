using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3DB.Pages
{
	public partial class admin_cashback_transactions : System.Web.UI.Page
	{
		protected TextBox mobileNom;
		protected Repeater transactionsRepeator;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				// Optionally, load initial data
			}
		}

		protected void FilterTransactions(object sender, EventArgs e)
		{
			string mobileNumber = mobileNom.Text;
			if (string.IsNullOrEmpty(mobileNumber))
			{
				// Handle the case where mobileNo is not provided
				return;
			}

			List<PaymentTransaction> paymentTransactionList = new List<PaymentTransaction>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT p.mobileNo, COUNT(*) AS TransactionCount, SUM(pg.pointsAmount) AS TotalPoints
                    FROM Payment p
                    JOIN Points_group pg ON p.mobileno = pg.mobileno
                    WHERE p.status = 'accepted' AND p.date_of_payment >= DATEADD(year, -12, GETDATE())
                    AND p.mobileNo = @MobileNo
                    GROUP BY p.mobileNo";

				SqlCommand command = new SqlCommand(query, connection);
				command.Parameters.AddWithValue("@MobileNo", mobileNumber);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						PaymentTransaction transaction = new PaymentTransaction
						{
							MobileNo = reader["mobileNo"].ToString(),
							TransactionCount = Convert.ToInt32(reader["TransactionCount"]),
							TotalPoints = Convert.ToInt32(reader["TotalPoints"])
						};
						paymentTransactionList.Add(transaction);
					}
				}
			}

			transactionsRepeator.DataSource = paymentTransactionList;
			transactionsRepeator.DataBind();
		}
	}

	public class PaymentTransaction
	{
		public string MobileNo { get; set; }
		public int TransactionCount { get; set; }
		public int TotalPoints { get; set; }
	}
}
