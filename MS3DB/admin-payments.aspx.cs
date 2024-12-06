using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;

namespace MS3DB.Pages
{
	public partial class admin_payments : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadPayments();
			}
		}

		private void LoadPayments()
		{
			List<PaymentDetails> paymentDetailsList = new List<PaymentDetails>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT p.paymentID, p.amount, p.date_of_payment, p.payment_method, p.status, p.mobileNo
                    FROM Payment p
                    JOIN customer_account cp ON p.mobileNo = cp.mobileNo";

				SqlCommand command = new SqlCommand(query, connection);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						PaymentDetails details = new PaymentDetails
						{
							PaymentID = reader["paymentID"].ToString(),
							Amount = Convert.ToDecimal(reader["amount"]),
							DateOfPayment = Convert.ToDateTime(reader["date_of_payment"]).ToString("yyyy-MM-dd"),
							PaymentMethod = reader["payment_method"].ToString(),
							Status = reader["status"].ToString(),
							MobileNo = reader["mobileNo"].ToString()
						};
						paymentDetailsList.Add(details);
					}
				}
			}

			paymentsRepeater.DataSource = paymentDetailsList;
			paymentsRepeater.DataBind();
		}
	}

	public class PaymentDetails
	{
		public string PaymentID { get; set; }
		public decimal Amount { get; set; }
		public string DateOfPayment { get; set; }
		public string PaymentMethod { get; set; }
		public string Status { get; set; }
		public string MobileNo { get; set; }
		public string AccountName { get; set; }
	}
}
