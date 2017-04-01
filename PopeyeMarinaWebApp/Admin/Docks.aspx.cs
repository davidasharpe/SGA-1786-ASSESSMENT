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
    public partial class Docks : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
        }

        // Grid View Control Docks

        public IQueryable<Dock> DocksGrid_GetData()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Docks;
            return query;
        }

        // Add Dock Button

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddDock.aspx");
        }
   
        // Form View Edit/Delete Dock

        public IQueryable<Dock> DockFormUpdate_GetItem([Control("DocksGrid")] int? DockID)
        {
            MarinaDBContext db = new MarinaDBContext();

            var query = from d in db.Docks
                        where d.DockID == DockID
                        select d;
            return query;
        }


        public void DockFormUpdate_UpdateItem(int DockID)
        {
            using (MarinaDBContext db = new MarinaDBContext())
            {
                Dock item = null;

                item = db.Docks.Find(DockID);
                if (item == null)
                {
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", DockID));
                    return;
                }

                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    db.SaveChanges();
                }
            }
        }

        public void DockFormUpdate_DeleteItem(int DockID)
        {
            using (MarinaDBContext db = new MarinaDBContext())
            {

                var item = new Dock() { DockID = DockID };
                db.Entry(item).State = EntityState.Deleted;
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    ModelState.AddModelError("", string.Format("Item with id {0} no longer exists in the database.", DockID));
                }
            }
        }

        protected void DockFormUpdate_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {

        }

        protected void DockFormUpdate_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {

        }
    }
}

