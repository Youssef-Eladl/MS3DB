using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace MS3DB.Pages
{
    public partial class customerExtraAmount : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
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
                SqlCommand command = new SqlCommand(@"CREATE FUNCTION [Extra_plan_amount]\r\n(@mobile_num char(11), @plan_name varchar(50)) --Define Function Inputs\r\nRETURNS int -- Define Function Output\r\nAS\r\nBegin\r\ndeclare @output int, @plan_id int, @payment_id int\r\nSelect @plan_id = s.planID, @payment_id= p.paymentID from Service_plan s inner join process_payment pp\r\non s.planID = pp.planID inner join payment p \r\non pp.paymentID = p.paymentID\r\nwhere s.name = @plan_name and p.mobileNo = @mobile_num and p.status='successful'\r\n\r\nset @output = dbo.function_extra_amount(@payment_id,@plan_id)\r\nreturn @output\r\nEND", connection)
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
