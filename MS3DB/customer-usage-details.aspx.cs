using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;

namespace MS3DB
{
    public partial class UsageDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            // Initialize the page if needed
        }

        protected void btnFetchUsage_Click(object sender, EventArgs e)
        {
            string mobileNumber = txtMobileNumber.value;

            if (!string.IsNullOrWhiteSpace(mobileNumber))
            {
                List<UsageRecord> usageRecords = GetCurrentMonthUsage(mobileNumber);

                if (usageRecords.Count > 0)
                {
                    usageDetailsRepeater.DataSource = usageRecords;
                    usageDetailsRepeater.DataBind();
                    lblMessage.Text = string.Empty;
                }
                else
                {
                    usageDetailsRepeater.DataSource = null;
                    usageDetailsRepeater.DataBind();
                    lblMessage.Text = "No usage records found for the given mobile number.";
                }
            }
            else
            {
                lblMessage.Text = "Please enter a valid mobile number.";
            }
        }

        private List<UsageRecord> GetCurrentMonthUsage(string mobileNumber)
        {
            List<UsageRecord> usageRecords = new List<UsageRecord>();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"CREATE PROCEDURE sp_GetCurrentMonthUsage\r\n    @MobileNumber NVARCHAR(15)\r\nAS\r\nBEGIN\r\n    SELECT \r\n        a.AccountID,\r\n        sp.Name AS PlanName,\r\n        u.SMSUsage,\r\n        u.MinutesUsage,\r\n        u.InternetUsage,\r\n        u.UsageDate\r\n    FROM \r\n        Accounts a\r\n    INNER JOIN \r\n        Customers c ON a.CustomerID = c.CustomerID\r\n    INNER JOIN \r\n        ServicePlans sp ON a.PlanID = sp.PlanID\r\n    INNER JOIN \r\n        UsageRecords u ON a.AccountID = u.AccountID\r\n    WHERE \r\n        c.Phone = @MobileNumber\r\n        AND MONTH(u.UsageDate) = MONTH(GETDATE())\r\n        AND YEAR(u.UsageDate) = YEAR(GETDATE())\r\n        AND a.IsActive = 1; -- Ensure the account is active\r\nEND;\r\n";
                SqlCommand command = new SqlCommand(query, connection);
                command.Parameters.AddWithValue("@MobileNumber", mobileNumber);

                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        usageRecords.Add(new UsageRecord
                        {
                            AccountID = Convert.ToInt32(reader["AccountID"]),
                            PlanName = reader["PlanName"].ToString(),
                            SMSUsage = Convert.ToInt32(reader["SMSUsage"]),
                            MinutesUsage = Convert.ToInt32(reader["MinutesUsage"]),
                            InternetUsage = Convert.ToDecimal(reader["InternetUsage"]),
                            UsageDate = Convert.ToDateTime(reader["UsageDate"])
                        });
                    }
                }
            }

            return usageRecords;
        }
    }
    public class UsageRecord
    {
        public int AccountID { get; set; }
        public string PlanName { get; set; }
        public int SMSUsage { get; set; }
        public int MinutesUsage { get; set; }
        public decimal InternetUsage { get; set; }
        public DateTime UsageDate { get; set; }
    }

}
