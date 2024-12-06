using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;

namespace MS3DB.Pages
{
	public partial class admin_sms_offers : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				// Optional: Load initial data if required
			}
		}

		protected void ViewSMSOffers(object sender, EventArgs e)
		{
			string mobileNo = Request.Form["mobileNo"];

			List<SMSOffer> smsOffers = new List<SMSOffer>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT e.offerID, b.description AS BenefitDescription, e.SMS_offered, e.internet_offered, e.minutes_offered, b.validity_date, b.status
                    FROM Exclusive_offer e
                    JOIN Benefits b ON e.benefitID = b.benefitID
                    WHERE b.mobileNo = @MobileNo";

				SqlCommand command = new SqlCommand(query, connection);
				command.Parameters.AddWithValue("@MobileNo", mobileNo);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						SMSOffer offer = new SMSOffer
						{
							OfferID = reader["offerID"].ToString(),
							BenefitDescription = reader["BenefitDescription"].ToString(),
							SMSOffered = Convert.ToInt32(reader["SMS_offered"]),
							InternetOffered = reader["internet_offered"].ToString(),
							MinutesOffered = Convert.ToInt32(reader["minutes_offered"]),
							ValidityDate = Convert.ToDateTime(reader["validity_date"]),
							Status = reader["status"].ToString()
						};
						smsOffers.Add(offer);
					}
				}
			}

			smsOffersRepeater.DataSource = smsOffers;
			smsOffersRepeater.DataBind();

			if (smsOffers.Count == 0)
			{
				errorMessage.Visible = true;
			}
			else
			{
				errorMessage.Visible = false;
			}
		}
	}

	public class SMSOffer
	{
		public string OfferID { get; set; }
		public string BenefitDescription { get; set; }
		public int SMSOffered { get; set; }
		public string InternetOffered { get; set; }
		public int MinutesOffered { get; set; }
		public DateTime ValidityDate { get; set; }
		public string Status { get; set; }
	}
}
