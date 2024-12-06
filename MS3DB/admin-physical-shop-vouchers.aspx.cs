using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI;

namespace MS3DB.Pages
{
	public partial class admin_stores_vouchers : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				LoadPhysicalStores();
			}
		}

		private void LoadPhysicalStores()
		{
			List<PhysicalStoreWithVouchers> physicalStores = new List<PhysicalStoreWithVouchers>();
			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				string query = @"
                    SELECT ps.shopID, s.name, v.voucherID, v.value
                    FROM Physical_shop ps
                    INNER JOIN Voucher v ON ps.shopID = v.shopID join Shop s on s.shopid=ps.shopid
                    WHERE v.redeem_date<>null";
				SqlCommand cmd = new SqlCommand(query, connection);
				connection.Open();

				using (SqlDataReader reader = cmd.ExecuteReader())
				{
					while (reader.Read())
					{
						PhysicalStoreWithVouchers store = new PhysicalStoreWithVouchers
						{
							ShopID = reader["shopID"].ToString(),
							ShopName = reader["name"].ToString(),
							VoucherID = reader["voucherID"].ToString(),
							Value = Convert.ToDecimal(reader["value"])
						};
						physicalStores.Add(store);
					}
				}
			}

			physicalStoresRepeater.DataSource = physicalStores;
			physicalStoresRepeater.DataBind();
		}
	}

	public class PhysicalStoreWithVouchers
	{
		public string ShopID { get; set; }
		public string ShopName { get; set; }
		public string VoucherID { get; set; }
		public decimal Value { get; set; }
	}
}
