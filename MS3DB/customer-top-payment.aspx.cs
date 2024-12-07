using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System;
using System.Collections.Generic;
using System.Data.SqlClient;

namespace MS3DB.Pages
{
    public partial class TopPayments : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Optionally handle any initialization
        }

        protected void btnFetchTopPayments_Click(object sender, EventArgs e)
        {
            int accountID;

            if (int.TryParse(txtAccountID.value, out accountID))
            {
                List<Payment> topPayments = GetTopPayments(accountID);

                if (topPayments.Count > 0)
                {
                    topPaymentsRepeater.DataSource = topPayments;
                    topPaymentsRepeater.DataBind();
                    lblMessage.Text = string.Empty;
                }
                else
                {
                    lblMessage.Text = "No successful payments found for the specified account.";
                }
            }
            else
            {
                lblMessage.Text = "Please enter a valid Account ID.";
            }
        }

        private List<Payment> GetTopPayments(int accountID)
        {
            List<Payment> payments = new List<Payment>();
            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                SqlCommand command = new SqlCommand(@"CREATE PROCEDURE [Top_Successful_Payments]\r\n@mobile_num char(11)  \r\n\r\nAS\r\nselect top 10 p.* from Payment p \r\nwhere p.mobileNo = @mobile_num\r\nand p.status = 'successful'\r\norder by p.amount desc", connection)
                {
                    CommandType = System.Data.CommandType.StoredProcedure
                };
                command.Parameters.AddWithValue("@AccountID", accountID);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        payments.Add(new Payment
                        {
                            PaymentID = Convert.ToInt32(reader["PaymentID"]),
                            PaidAmount = Convert.ToDecimal(reader["PaidAmount"]),
                            PaymentDate = Convert.ToDateTime(reader["PaymentDate"]),
                            Status = reader["Status"].ToString()
                        });
                    }
                }
            }

            return payments;
        }
    }

    public class Payment
    {
        public int PaymentID { get; set; }
        public decimal PaidAmount { get; set; }
        public DateTime PaymentDate { get; set; }
        public string Status { get; set; }
    }
}
