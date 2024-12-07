using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3DB.Pages.Shared
{
	public partial class customer_payments_vouchers : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}
        protected void btnFetchHighestVoucher_Click(object sender, EventArgs e)
        {
            int accountID = int.Parse(txtAccountID.Text);
            Voucher highestVoucher = GetHighestVoucher(accountID);

            lblVoucherID.Text = highestVoucher.VoucherID.ToString();
            lblVoucherValue.Text = highestVoucher.VoucherValue.ToString("C");
        }

        private Voucher GetHighestVoucher(int accountID)
        {
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;
            Voucher voucher = null;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(@"CREATE PROCEDURE [Account_Highest_Voucher]\r\n@mobile_num char(11)  \r\n\r\nAS\r\ndeclare @max int\r\nselect @max =  max(v.value) from Voucher v \r\nwhere v.mobileNo = @mobile_num \r\n\r\nselect v.voucherID from voucher v\r\nwhere v.mobileNo = @mobile_num and v.value = @max", connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@AccountID", accountID);

                connection.Open();
                using (SqlDataReader reader = command.ExecuteReader())
                {
                    if (reader.Read())
                    {
                        voucher = new Voucher
                        {
                            VoucherID = Convert.ToInt32(reader["VoucherID"]),
                            VoucherValue = Convert.ToDecimal(reader["VoucherValue"])
                        };
                    }
                }
            }

            return voucher;
        }

        public class Voucher
        {
            public int VoucherID { get; set; }
            public decimal VoucherValue { get; set; }
        }



    }



}