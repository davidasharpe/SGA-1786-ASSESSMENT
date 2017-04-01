using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PopeyeMarinaWebApp
{
    public partial class Admin1 : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CurentDate.Text = DateTime.Now.ToLongDateString();
        }
    }
}