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
    public partial class Template : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Grid View Control

        public IQueryable<Customer> CustomersGrid_GetData()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Customers;
            return query;
        }

        // Drop Down List

        public IQueryable<Customer> BindCustomers()
        {
            MarinaDBContext db = new MarinaDBContext();
          
            var CustomerName =  from c in db.Customers
                                select c;
            return CustomerName;       
        }

        // Form View

        public IQueryable<Customer> CustomerForm_GetItem([Control("CustomersGrid")] int? CustomerID)
        {
            MarinaDBContext db = new MarinaDBContext();

            var SelectCustomer =    from c in db.Customers
                                    where c.CustomerID == CustomerID
                                    select c;
            return SelectCustomer;
        }

        // Form View Update

        public void CustomerForm_UpdateItem(int CustomerID)
        {
            using (MarinaDBContext db = new MarinaDBContext())
            {
                Customer item = null;

                item = db.Customers.Find(CustomerID);
                if (item == null)
                {
                    ModelState.AddModelError("", String.Format("Item with id {0} was not found", CustomerID));
                    return;
                }

                TryUpdateModel(item);
                if (ModelState.IsValid)
                {
                    db.SaveChanges();
                }
            }
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

        public void CustomerForm_DeleteItem(int CustomerID)
        {
            using (MarinaDBContext db = new MarinaDBContext())
            {

                var item = new Customer() { CustomerID = CustomerID };
                db.Entry(item).State = EntityState.Deleted;
                try
                {
                    db.SaveChanges();
                }
                catch (DbUpdateConcurrencyException)
                {
                    ModelState.AddModelError("", string.Format("Item with id {0} no longer exists in the database.", CustomerID));
                }

            }
        }

        protected void CustomerForm_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            Response.Redirect("~/Template");
        }

        protected void CustomerForm_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("~/Template");
        }

        protected void CustomerForm_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            Response.Redirect("~/Template");
        }
    }
}



 