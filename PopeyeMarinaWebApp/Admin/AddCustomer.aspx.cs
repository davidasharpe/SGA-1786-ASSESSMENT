using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using PopeyeMarinaWebApp.Models;

namespace PopeyeMarinaWebApp.Admin
{
    public partial class AddCustomer : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        // Form View Add Customer

        public IQueryable<Customer> CustomerFormAdd_GetItem()
        {
            MarinaDBContext db = new MarinaDBContext();

            var SelectCustomer = from c in db.Customers
                                 select c;
            return SelectCustomer;
        }

        public void CustomerForm_InsertItem()
        {
            var item = new Customer();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                using (MarinaDBContext db = new MarinaDBContext())
                {
                    db.Customers.Add(item);
                    db.SaveChanges();
                }
            }
        }

        protected void CustomerForm_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (ModelState.IsValid)
            {
                Response.Redirect("Customers.aspx");
            }
            
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }
    }
}

