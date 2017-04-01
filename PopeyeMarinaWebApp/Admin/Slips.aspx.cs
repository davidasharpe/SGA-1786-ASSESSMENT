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
    public partial class Slips : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Grid View Control Slips

        public IQueryable<Slip> SlipsGrid_GetData()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Slips;
            return query;
        }

        // Add Slip Button

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddSlip.aspx");
        }

        // Form View Edit/Delete Slip

        public IQueryable<Slip> SlipFormUpdate_GetItem([Control("SlipsGrid")] int? SlipID)
        {
            MarinaDBContext db = new MarinaDBContext();

            var query = from s in db.Slips
                        where s.SlipID == SlipID
                        select s;
            return query;
        }

        // DropDown Edit Docks

        public IQueryable<Dock> EditDocks([Control("SlipsGrid")] int? DockID)
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = from d in db.Docks
                        where d.DockID == DockID
                        select d;
            return query;
        }

        public void SlipFormUpdate_UpdateItem(int SlipID)
        {
            using (MarinaDBContext db = new MarinaDBContext())
            {
                Slip item = null;

                item = db.Slips.Find(SlipID);
                if (item == null)
                {
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", SlipID));
                    return;
                }

                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    db.SaveChanges();
                }
            }
        }

        public void SlipFormUpdate_DeleteItem(int SlipID)
        {
            using (MarinaDBContext db = new MarinaDBContext())
            {
                var item = new Slip() { SlipID = SlipID };
                db.Entry(item).State = EntityState.Deleted;
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    ModelState.AddModelError("", string.Format("Item with id {0} no longer exists in the database.", SlipID));
                }
            }
        }

        protected void SlipFormUpdate_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {

        }

        protected void SlipFormUpdate_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {

        }
    }
}