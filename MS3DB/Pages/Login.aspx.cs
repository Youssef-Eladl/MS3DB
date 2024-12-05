using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Configuration;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MS3DB
{
	public partial class Login : System.Web.UI.Page
	{
		protected void Page_Load(object sender, EventArgs e)
		{

		}

		protected void login (object sender, EventArgs e)
		{
			String connStr = WebConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ToString();

			SqlConnection conn = new SqlConnection(connStr);

			int id = Int16.Parse(Username.Text);

			String password = Password.Text;

			SqlCommand loginproc = new SqlCommand("userlogin", conn);
			loginproc.CommandType = CommandType.StoredProcedure;
			loginproc.Parameters.Add(new SqlParameter("@id",id));
			loginproc.Parameters.Add(new SqlParameter("@password", password));

			SqlParameter success = loginproc.Parameters.Add("@success", SqlDbType.Int);
			SqlParameter type = loginproc.Parameters.Add("@type", SqlDbType.Int);

			success.Direction = ParameterDirection.Output;
			type.Direction = ParameterDirection.Output;

			conn.Open();
			loginproc.ExecuteNonQuery();
			conn.Close();

			if (success.Value.ToString() == "1")
			{
				Response.Write("Hello");
			}


		}
	}
}