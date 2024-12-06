using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MS3DB.objects
{
	public class ServicePlanonly
	{
		public int PlanID { get; set; }
		public string Name { get; set; }
		public int Price { get; set; }
		public int SMSOffered { get; set; }
		public int MinutesOffered { get; set; }
		public int DataOffered { get; set; }
		public string Description { get; set; }
	}
}