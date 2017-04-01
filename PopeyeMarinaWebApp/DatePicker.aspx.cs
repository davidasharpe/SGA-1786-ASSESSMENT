using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PopeyeMarinaWebApp
{
    public partial class DatePicker : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Datepicker1.MinDate = "-20";
            Datepicker1.MaxDate = "+1M +10D";
        }
    }
}

