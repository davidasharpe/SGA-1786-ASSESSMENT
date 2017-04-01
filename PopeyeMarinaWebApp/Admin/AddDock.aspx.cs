using System;
using System.Linq;
using System.Web.UI.WebControls;
using PopeyeMarinaWebApp.Models;

namespace PopeyeMarinaWebApp.Admin
{
    public partial class AddDock : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Form View Add Dock

        public IQueryable<Dock> DockFormAdd_GetItem()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Docks;
            return query;
        }

        public void DockFormAdd_InsertItem()
        {
            var item = new Dock();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                using (MarinaDBContext db = new MarinaDBContext())
                {
                    db.Docks.Add(item);
                    db.SaveChanges();
                }
            }
        }

        protected void DockFormAdd_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (ModelState.IsValid)
            {
                Response.Redirect("Docks.aspx");
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Docks.aspx");
        }
    }
}



