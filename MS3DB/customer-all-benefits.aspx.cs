using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;


namespace MS3DB.Pages
{
    public partial class ActiveBenefits : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                LoadActiveBenefits();
            }
        }

        private void LoadActiveBenefits()
        {
            List<Benefit> activeBenefits = new List<Benefit>();

            string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["MyDatabaseConnection"].ConnectionString;

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                string query = @"select * from Benefits\r\nwhere status = 'active'";
                SqlCommand command = new SqlCommand(query, connection);
                connection.Open();

                using (SqlDataReader reader = command.ExecuteReader())
                {
                    while (reader.Read())
                    {
                        activeBenefits.Add(new Benefit
                        {
                            BenefitID = Convert.ToInt32(reader["BenefitID"]),
                            BenefitName = reader["BenefitName"].ToString(),
                            Description = reader["Description"].ToString(),
                            ValidFrom = Convert.ToDateTime(reader["ValidFrom"]),
                            ValidTo = Convert.ToDateTime(reader["ValidTo"])
                        });
                    }
                }
            }

            benefitsRepeater.DataSource = activeBenefits;
            benefitsRepeater.DataBind();
        }
    }
    public class Benefit
    {
        public int BenefitID { get; set; }
        public string BenefitName { get; set; }
        public string Description { get; set; }
        public DateTime ValidFrom { get; set; }
        public DateTime ValidTo { get; set; }
    }

}
