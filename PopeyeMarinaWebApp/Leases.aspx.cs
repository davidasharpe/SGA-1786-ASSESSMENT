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

namespace PopeyeMarinaWebApp.Admin
{
    public partial class Leases : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack)
            {
                LeaseFormAdd.Visible = false;
                LeaseFormUpdate.Visible = true;
            }
            
        }

        public IQueryable<Lease> LeasesGrid_GetData()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Leases;
            return query;
        }

        // Add Customer Button

        protected void AddButton_Click(object sender, EventArgs e)
        {
            if (LeaseFormAdd.Visible == false)
            {
                LeaseFormAdd.Visible = true;
                LeaseFormUpdate.Visible = false;
            }
            else
            {
                LeaseFormAdd.Visible = false;
                LeaseFormUpdate.Visible = true;
            }
        }

        // Form View Add Lease

        public IQueryable<Lease> LeaseFormAdd_GetItem()
        {
            MarinaDBContext db = new MarinaDBContext();

            var query = from l in db.Leases
                        select l;
            return query;

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

        // DropDown Add Customer

        public IQueryable<Customer> GetCusomer()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = from c in db.Customers
                        select c;
            return query;
        }

        // DropDown Add Slip

        public IQueryable<Slip> GetSlip()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = from s in db.Slips
                        select s;
            return query;
        }

        // DropDown Add Boat

        public IQueryable<Boat> GetBoat()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = from b in db.Boats
                        select b;
            return query;
        }

        protected void CalculateDays(object sender, EventArgs e)
        {
            // ERROR The name startDate does not exist in the current context
            // ERROR The name endDate does not exist in the current context
            // ERROR The name totalDays does not exist in the current context
            /*
            string startdate = startDate.Text;
            string enddate = endDate.Text;
            if (startdate != "" && enddate != "")
            {
                DateTime t1 = Convert.ToDateTime(startdate);
                DateTime t2 = Convert.ToDateTime(enddate);
                totalDays.Text = t2.Subtract(t1).Days.ToString();
            }
            */
        }

        protected void CalculateFee(Object sender, EventArgs e)
        {
            // ERROR The name totalDays does not exist in the current context
            // ERROR The name amountPerDay does not exist in the current context
            /*
                   double totalFee = totalDays.Text * amountPerDay.Text;
            */
        }

         protected void LeaseFormAdd_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {

        }

        // Form View Edit/Delete Lease

        public IQueryable<Lease> LeaseFormUpdate_GetItem([Control("LeasesGrid")] int? LeaseID)
        {
            MarinaDBContext db = new MarinaDBContext();

            var query = from l in db.Leases
                        where l.LeaseID == LeaseID
                        select l;
            return query;
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