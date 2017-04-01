using System;

namespace PopeyeMarinaWebApp.Templates
{
    public partial class CalculateDaysTest1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void calculateDays(object sender, EventArgs e)
        {

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
