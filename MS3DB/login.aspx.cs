using System;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Data;

namespace MS3DB.Pages
{
	public partial class Login : System.Web.UI.Page
	{
		// Controls must be declared as protected fields to be accessible
		protected TextBox username;
		protected TextBox password;
		protected Label feedback;

		protected void Page_Load(object sender, EventArgs e)
		{
		}

		protected void LoginForm_Submit(object sender, EventArgs e)
		{
			// Access the controls directly
			string userName = username.Text;
			string passWord = password.Text;
			bool isValid;

			string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

			using (SqlConnection connection = new SqlConnection(connectionString))
			{
				SqlCommand cmd = new SqlCommand("CheckUserCredentials", connection);
				cmd.CommandType = CommandType.StoredProcedure;

				cmd.Parameters.AddWithValue("@MobileNo", userName);
				cmd.Parameters.AddWithValue("@Password", passWord);

				SqlParameter outputParameter = new SqlParameter();
				outputParameter.ParameterName = "@IsValid";
				outputParameter.SqlDbType = SqlDbType.Bit;
				outputParameter.Direction = ParameterDirection.Output;
				cmd.Parameters.Add(outputParameter);

				connection.Open();
				cmd.ExecuteNonQuery();
				isValid = Convert.ToBoolean(outputParameter.Value);

			}



			if (userName == "admin" && passWord == "admin123")
			{
				Response.Redirect("admin-dashboard.aspx");
			}
			else if (isValid)
			{
				Response.Redirect("customer-dashboard.aspx");
			}
			else
			{
				feedback.Text = "Unsuccessful login attempt.";
			}
		}
	}
}
