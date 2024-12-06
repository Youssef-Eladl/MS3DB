using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace MS3DB.Pages
{
    public partial class admin_stores_vouchers : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadPhysicalStore();
            }
        }

        private void LoadPhysicalStore()
        {
            // List to hold the store data
            List<PhysicalStore> stores = new List<PhysicalStore>();

            // Fetch connection string from Web.config
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

            // Database interaction
            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"CREATE VIEW [PhysicalStoreVouchers] AS\r\nselect p.*, v.voucherID,v.value from Physical_shop p\r\ninner join Voucher v\r\non p.shopID = v.shopid";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {

                        PhysicalStore store = new PhysicalStore
                        {
                            StoreID = Convert.ToInt32(reader["p.StoreID"]),
                            StoreName = reader["p.StoreName"].ToString(),
                            VoucherID = reader["v.voucherID"].ToString(),
                            VoucherValue = Convert.ToDecimal(reader["v.value"])
                        };

                        stores.Add(store);
                    }
                }
            }


            PhysicalStoreRepeater.DataSource = stores;
            PhysicalStoreRepeater.DataBind();
        }
    }


    public class PhysicalStore
    {
        public int StoreID { get; set; }
        public string StoreName { get; set; }
        public string VoucherID { get; set; }
        public decimal VoucherValue { get; set; }
    }
}
