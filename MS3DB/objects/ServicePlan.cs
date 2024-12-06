using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace MS3DB.objects
{
	public class ServicePlan
	{
		public string CustomerName { get; set; }
		public string MobileNo { get; set; }
		public string PlanName { get; set; }
		public decimal Price { get; set; }
		public int SMSOffered { get; set; }
		public int MinutesOffered { get; set; }
		public int DataOffered { get; set; }
		public String SubscriptionDate { get; set; }
		public string SubscriptionStatus { get; set; }
	}

}