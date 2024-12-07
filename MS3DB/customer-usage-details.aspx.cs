using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Web.UI;

namespace MS3DB.Pages
{
    public partial class UsageDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        protected void btnFetchUsage_Click(object sender, EventArgs e)
        {
            string mobileNumber = txtMobileNumber.Text;

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
                string query = "select p.data_consumption, p.minutes_used, p.SMS_sent from Plan_Usage p\r\ninner join Subscription s \r\non p.planID = s.planID and p.mobileNo = s.mobileNo\r\nwhere p.mobileNo = @mobile_num and s.status = 'active' \r\nand month(p.start_date)= month(current_timestamp) or month(p.end_date)= month(current_timestamp) and year(p.start_date)= year(current_timestamp) or year(p.end_date)= year(current_timestamp))\r\n";
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
