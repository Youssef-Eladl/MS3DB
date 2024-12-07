using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Drawing;

namespace MS3DB.Pages
{
    public partial class CashbackTransactions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialize the page if needed
        }

        protected void btnFetchTransactions_Click(object sender, EventArgs e)
        {
            string nationalID = txtNationalID.Text;

            if (!string.IsNullOrWhiteSpace(nationalID))
            {
                List<CashbackTransaction> transactions = GetCashbackTransactions(nationalID);

                if (transactions.Count > 0)
                {
                    transactionsRepeater.DataSource = transactions;
                    transactionsRepeater.DataBind();
                    lblMessage.Text = string.Empty;
                }
                else
                {
                    transactionsRepeater.DataSource = null;
                    transactionsRepeater.DataBind();
                    lblMessage.Text = "No cashback transactions found for the given National ID.";
                }
            }
            else
            {
                lblMessage.Text = "Please enter a valid National ID.";
            }
        }

        private List<CashbackTransaction> GetCashbackTransactions(string nationalID)
        {
            List<CashbackTransaction> transactions = new List<CashbackTransaction>();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = "EXEC sp_GetCashbackTransactionsByNationalID @NationalID";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@NationalID", nationalID);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        transactions.Add(new CashbackTransaction
                        {
                            TransactionID = Convert.ToInt32(reader["TransactionID"]),
                            CashbackAmount = Convert.ToDecimal(reader["CashbackAmount"]),
                            TransactionDate = Convert.ToDateTime(reader["TransactionDate"]),
                            WalletID = Convert.ToInt32(reader["WalletID"]),
                            CustomerName = reader["CustomerName"].ToString(),
                            NationalID = reader["NationalID"].ToString()
                        });
                    }
                }
            }

            return transactions;
        }
    }
    public class CashbackTransaction
    {
        public int TransactionID { get; set; }
        public decimal CashbackAmount { get; set; }
        public DateTime TransactionDate { get; set; }
        public int WalletID { get; set; }
        public string CustomerName { get; set; }
        public string NationalID { get; set; }
    }




  using System;
using System.Data.SqlClient;

namespace MS3DB.Pages
    {
        public partial class ExtraAmount : System.Web.UI.Page
        {
            protected void Page_Load(object sender, EventArgs e)
            {
                // Optionally handle any initialization
            }

            protected void btnFetchExtraAmount_Click(object sender, EventArgs e)
            {
                int accountID, planID;

                if (int.TryParse(txtAccountID.Text, out accountID) && int.TryParse(txtPlanID.Text, out planID))
                {
                    ExtraPayment extraPayment = GetExtraAmount(accountID, planID);

                    if (extraPayment != null)
                    {
                        lblPaymentID.Text = $"Payment ID: {extraPayment.PaymentID}";
                        lblExtraAmount.Text = $"Extra Amount: {extraPayment.ExtraAmount:C}";
                        lblPaymentDate.Text = $"Payment Date: {extraPayment.PaymentDate:yyyy-MM-dd}";
                    }
                    else
                    {
                        lblMessage.Text = "No extra payments found for the specified account and plan.";
                    }
                }
                else
                {
                    lblMessage.Text = "Please enter valid Account ID and Plan ID.";
                }
            }

            private ExtraPayment GetExtraAmount(int accountID, int planID)
            {
                string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;
                ExtraPayment extraPayment = null;

                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    SqlCommand command = new SqlCommand("sp_GetExtraAmountForLastPayment", connection)
                    {
                        CommandType = System.Data.CommandType.StoredProcedure
                    };
                    command.Parameters.AddWithValue("@AccountID", accountID);
                    command.Parameters.AddWithValue("@PlanID", planID);

                    connection.Open();

                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.Read())
                        {
                            extraPayment = new ExtraPayment
                            {
                                PaymentID = Convert.ToInt32(reader["PaymentID"]),
                                ExtraAmount = Convert.ToDecimal(reader["ExtraAmount"]),
                                PaymentDate = Convert.ToDateTime(reader["PaymentDate"])
                            };
                        }
                    }
                }

                return extraPayment;
            }
        }

        public class ExtraPayment
        {
            public int PaymentID { get; set; }
            public decimal ExtraAmount { get; set; }
            public DateTime PaymentDate { get; set; }
        }
    }

}
