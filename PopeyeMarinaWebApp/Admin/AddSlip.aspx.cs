using System;
using System.Linq;
using System.Web.UI.WebControls;
using PopeyeMarinaWebApp.Models;

namespace PopeyeMarinaWebApp.Admin
{
    public partial class AddSlip : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Add Slip Button

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddSlip.aspx");
        }

        // Form View Add Slip

        public IQueryable<Slip> SlipFormAdd_GetItem()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Slips;
            return query;
        }

        public void SlipFormAdd_InsertItem()
        {
            var item = new Slip();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                using (MarinaDBContext db = new MarinaDBContext())
                {
                    db.Slips.Add(item);
                    db.SaveChanges();
                }
            }
        }

        // DropDown Add Docks

        public IQueryable<Dock> GetDocks()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = from d in db.Docks
                        select d;
            return query;
        }

        protected void SlipFormAdd_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (ModelState.IsValid)
            {
                Response.Redirect("Slips.aspx");
            }  
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Slips.aspx");
        }
    }
}