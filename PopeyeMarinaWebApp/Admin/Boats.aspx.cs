using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using PopeyeMarinaWebApp.Models;
using System.Web.ModelBinding;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;

namespace PopeyeMarinaWebApp
{
    public partial class Boats : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        // Grid View Control Boats

        public IQueryable<Boat> BoatsGrid_GetData()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Boats;
            return query;
        }

        // Add Boat Button

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddBoat.aspx");
        }

        // Form View Edit/Delete Boat

        public IQueryable<Boat> BoatFormUpdate_GetItem([Control("BoatsGrid")] int? BoatID)
        {
            MarinaDBContext db = new MarinaDBContext();

            var query = from b in db.Boats
                        where b.BoatID == BoatID
                        select b;
            return query;
        }

        public void BoatFormUpdate_UpdateItem(int BoatID)
        {
            using (MarinaDBContext db = new MarinaDBContext())
            {
                Boat item = null;

                item = db.Boats.Find(BoatID);
                if (item == null)
                {
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", BoatID));
                    return;
                }

                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    db.SaveChanges();
                }
            }
        }

        // DropDown Edit Boat

        public IQueryable<Slip> EditSlips([Control("BoatsGrid")] int? SlipID)
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = from s in db.Slips
                        where s.SlipID == SlipID
                        select s;
            return query;
        }

        public void BoatFormUpdate_DeleteItem(int BoatID)
        {
            using (MarinaDBContext db = new MarinaDBContext())
            {

                var item = new Boat() { BoatID = BoatID };
                db.Entry(item).State = EntityState.Deleted;
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    ModelState.AddModelError("", string.Format("Item with id {0} no longer exists in the database.", BoatID));
                }
            }
        }

        protected void BoatFormUpdate_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {

        }

        protected void BoatFormUpdate_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {

        }
    }
}