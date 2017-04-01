using System;
using System.Web.UI.WebControls;
using PopeyeMarinaWebApp.Models;

namespace PopeyeMarinaWebApp.Templates
{
    public partial class CalculateDaysTest2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LeaseFormAdd_InsertItem()
        {
            var item = new Lease();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                using (MarinaDBContext db = new MarinaDBContext())
                {
                    db.Leases.Add(item);
                    db.SaveChanges();
                }
            }
        }
        
        protected void calculateDays(object sender, EventArgs e)
        {
            TextBox txtStartDate = (TextBox)AddLease.Row.FindControl("txtStartDate");
            TextBox txtEndDate = (TextBox)AddLease.Row.FindControl("txtEndDate");
            Label totalDays = (Label)AddLease.Row.FindControl("totalDays");

            string startdate = txtStartDate.Text;
            string enddate = txtEndDate.Text;
            if (startdate != "" && enddate != "")
            {
                DateTime t1 = Convert.ToDateTime(startdate);
                DateTime t2 = Convert.ToDateTime(enddate);
                totalDays.Text = t2.Subtract(t1).Days.ToString();
            }
        }
    }
}



