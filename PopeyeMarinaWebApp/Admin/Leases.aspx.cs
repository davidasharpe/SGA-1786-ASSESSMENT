using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using PopeyeMarinaWebApp.Models;
using System.Web.ModelBinding;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace PopeyeMarinaWebApp.Admin
{
    public partial class Leases : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        public IQueryable<Lease> LeasesGrid_GetData()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Leases;
            return query;
        }

        // Add Lease Button

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddLease.aspx");          
        }

        // Form View Edit/Delete Lease

        public IQueryable<Lease> LeaseFormUpdate_GetItem([Control("LeasesGrid")] int? LeaseID)
         {
            MarinaDBContext db = new MarinaDBContext();

            var query = from l in db.Leases
                        join s in db.Slips on l.SlipID equals s.SlipID
                        join c in db.Customers on l.CustomerID equals c.CustomerID
                        join b in db.Boats on l.BoatID equals b.BoatID
                        where l.LeaseID == LeaseID
                        select l;
            return query;
        }

        protected void EditButton_Click(object sender, EventArgs e)
        {
            if (ModelState.IsValid)
            {
                LeaseFormUpdate.ChangeMode(FormViewMode.Edit);
            }
        }

        public void LeaseFormUpdate_UpdateItem(int LeaseID)
        {
            using (MarinaDBContext db = new MarinaDBContext())
            {
                Lease item = null;

                item = db.Leases.Find(LeaseID);
                if (item == null)
                {
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", LeaseID));
                    return;
                }

                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    db.SaveChanges();
                }
            }
        }

        // DropDown Add Cusomter

        public IQueryable<Customer> EditCusomer([Control("LeasesGrid")] int? CustomerID)
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = from c in db.Customers
                        where c.CustomerID == CustomerID
                        select c;
            return query;
        }

        // DropDown Add Slip

        public IQueryable<Slip> EditSlip([Control("LeasesGrid")] int? SlipID)
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = from s in db.Slips
                        where s.SlipID == SlipID
                        select s;
            return query;
        }

        // DropDown Add Boat

        public IQueryable<Boat> EditBoat([Control("LeasesGrid")] int? BoatID)
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = from b in db.Boats
                        where b.BoatID == BoatID
                        select b;
            return query;
        }

        protected void CalculateDays(object sender, EventArgs e)
        {
            TextBox startDate = (TextBox)LeaseFormUpdate.Row.FindControl("startDate");
            TextBox endDate = (TextBox)LeaseFormUpdate.Row.FindControl("endDate");
            Label totalDays = (Label)LeaseFormUpdate.Row.FindControl("totalDays");
            string startdate = startDate.Text;
            string enddate = endDate.Text;
            if (startdate != "" && enddate != "")
            {
                DateTime t1 = Convert.ToDateTime(startdate);
                DateTime t2 = Convert.ToDateTime(enddate);
                totalDays.Text = t2.Subtract(t1).Days.ToString();

                if (t2 > t1)
                {
                    totalDays.Text = t2.Subtract(t1).Days.ToString();
                }
                else
                {
                    endDate.Text = startDate.Text;
                    totalDays.Text = 1.ToString();
                }
            }
        }

        protected void CalculateFee(object sender, EventArgs e)
        {
            Label totalDays = (Label)LeaseFormUpdate.Row.FindControl("totalDays");
            TextBox amountPerDay = (TextBox)LeaseFormUpdate.Row.FindControl("amountPerDay");
            Label totalFee = (Label)LeaseFormUpdate.Row.FindControl("totalFee");

            decimal Days = Convert.ToDecimal(totalDays.Text);
            decimal Amount = Convert.ToDecimal(amountPerDay.Text);
            decimal Fee = Days * Amount;
            totalFee.Text = Fee.ToString();
        }

        public void LeaseFormUpdate_DeleteItem(int LeaseID)
        {
            using (MarinaDBContext db = new MarinaDBContext())
            {
                var item = new Lease() { LeaseID = LeaseID };
                db.Entry(item).State = EntityState.Deleted;
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    ModelState.AddModelError("", string.Format("Item with id {0} no longer exists in the database.", LeaseID));
                }
            }
        }

        protected void LeaseFormUpdate_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {

        }

        protected void LeaseFormUpdate_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {

        }


    }
}