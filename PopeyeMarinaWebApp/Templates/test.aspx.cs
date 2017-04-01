using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using PopeyeMarinaWebApp.Models;
using System.Web.ModelBinding;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace PopeyeMarinaWebApp
{
    public partial class test : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public IQueryable<Slip> SlipsGrid_GetData()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Slips;
            return query;
        }
         
        protected void calculateDays(object sender, EventArgs e)
        {
            /*
            string startdate = txtStartDate.Text;
            string enddate = txtEndDate.Text;
            if (startdate != "" && enddate != "")
            {
                DateTime t1 = Convert.ToDateTime(startdate);
                DateTime t2 = Convert.ToDateTime(enddate);
                totaldays.Text = t2.Subtract(t1).Days.ToString();
            }
            */
        }


        // The id parameter should match the DataKeyNames value set on the control
        // or be decorated with a value provider attribute, e.g. [QueryString]int id
        public PopeyeMarinaWebApp.Models.Lease AddLease_GetItem(int id)
        {
            return null;
        }

        public void AddLease_InsertItem()
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

        protected void AddLease_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {

        }
    }
   

}