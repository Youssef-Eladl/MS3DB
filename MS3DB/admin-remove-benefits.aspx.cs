using System;
using System.Data.SqlClient;
using System.Web.UI;

namespace MS3DB.Pages
{
	public partial class admin_remove_benefits : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!IsPostBack)
			{
				// Optional: Initialize page components if needed
			}
		}

		protected void RemoveBenefits(object sender, EventArgs e)
		{
			string mobileNo = Request.Form["mobileNo"];
			int planID = int.Parse(Request.Form["planID"]);

			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				connection.Open();
				SqlTransaction transaction = connection.BeginTransaction();

				try
				{
					// Remove all benefits linked to the specified plan and mobile number
					string deleteQuery = @"
                        DELETE FROM Benefits 
                        WHERE mobileNo = @MobileNo AND benefitID IN 
                            (SELECT benefitID FROM plan_provides_benefits WHERE planID = @PlanID)";

					using (SqlCommand command = new SqlCommand(deleteQuery, connection, transaction))
					{
						command.Parameters.AddWithValue("@MobileNo", mobileNo);
						command.Parameters.AddWithValue("@PlanID", planID);

						int rowsAffected = command.ExecuteNonQuery();

						if (rowsAffected > 0)
						{
							// If successful, commit the transaction
							transaction.Commit();
							Response.Redirect("admin-remove-benefits.aspx?status=success");
						}
						else
						{
							// If no rows affected, roll back the transaction
							transaction.Rollback();
							Response.Redirect("admin-remove-benefits.aspx?status=error");
						}
					}
				}
				catch (Exception ex)
				{
					// Roll back the transaction on error
					transaction.Rollback();
					Response.Redirect("admin-remove-benefits.aspx?status=error");
				}
			}
		}
	}
}
