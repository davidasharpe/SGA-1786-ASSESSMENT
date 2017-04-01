using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using PopeyeMarinaWebApp.Models;

namespace PopeyeMarinaWebApp.Admin
{
    public partial class AddBoat : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Form View Add Boat

        public IQueryable<Boat> BoatFormAdd_GetItem()
        {
            MarinaDBContext db = new MarinaDBContext();

            var query = from b in db.Boats
                        select b;
            return query;
        }

        public void BoatFormAdd_InsertItem()
        {
            var item = new Boat();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                using (MarinaDBContext db = new MarinaDBContext())
                {
                    db.Boats.Add(item);
                    db.SaveChanges();
                }
            }
        }

        protected void BoatFormAdd_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (ModelState.IsValid)
            {
                Response.Redirect("Boats.aspx");
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Boats.aspx");
        }
    }
}
