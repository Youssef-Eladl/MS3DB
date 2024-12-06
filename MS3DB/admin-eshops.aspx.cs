using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;

namespace MS3DB.Pages
{
	public partial class admin_eshops : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadEShops();
			}
		}

		private void LoadEShops()
		{
			List<EShopDetails> eShopDetailsList = new List<EShopDetails>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT es.shopID, s.name AS ShopName, es.URL, es.rating, v.voucherID, v.value
                    FROM E_shop es
                    JOIN shop s ON es.shopID = s.shopID
                    JOIN Voucher v ON es.shopID = v.shopID
                    WHERE v.redeem_date IS NOT NULL";

				SqlCommand command = new SqlCommand(query, connection);
				connection.Open();

				using (SqlDataReader reader = command.ExecuteReader())
				{
					while (reader.Read())
					{
						EShopDetails details = new EShopDetails
						{
							ShopID = reader["shopID"].ToString(),
							ShopName = reader["ShopName"].ToString(),
							URL = reader["URL"].ToString(),
							Rating = Convert.ToDecimal(reader["rating"]),
							VoucherID = reader["voucherID"].ToString(),
							Value = Convert.ToDecimal(reader["value"])
						};
						eShopDetailsList.Add(details);
					}
				}
			}

			eshopsRepeater.DataSource = eShopDetailsList;
			eshopsRepeater.DataBind();
		}
	}

	public class EShopDetails
	{
		public string ShopID { get; set; }
		public string ShopName { get; set; }
		public string URL { get; set; }
		public decimal Rating { get; set; }
		public string VoucherID { get; set; }
		public decimal Value { get; set; }
	}
}
