using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using PopeyeMarinaWebApp.Models;
using System.Web.ModelBinding;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Xml;


namespace PopeyeMarinaWebApp
{
    public partial class Customers : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        // Grid View Control Customer

        public IQueryable<Customer> CustomersGrid_GetData()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Customers;
            return query;
        }

        // Add Customer Button

        protected void AddButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddCustomer.aspx");
        }

       

        // Form View Edit/Delete Customer

        public IQueryable<Customer> CustomerForm_GetItem([Control("CustomersGrid")] int? CustomerID)
        {
            MarinaDBContext db = new MarinaDBContext();

            var query = from c in db.Customers
                                 where c.CustomerID == CustomerID
                                 select c;
            return query;
        }

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

        protected void CustomerForm_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            
        }

        protected void CustomerForm_ItemDeleted(object sender, FormViewDeletedEventArgs e)
        {
            
        }

        protected void ExportCustomers(object sender, EventArgs e)
        {
            CustomersSqlDataSource.SelectCommand = "SELECT * FROM dbo.Customers";
            System.Data.DataView rdr = (System.Data.DataView)CustomersSqlDataSource.Select(DataSourceSelectArguments.Empty);

            XmlWriterSettings xmlWriterSettings = new XmlWriterSettings()
            {
                Indent = true,
                IndentChars = "\t",
                NewLineOnAttributes = true
            };

            XmlWriter writer = XmlWriter.Create(@"C:\customers.xml", xmlWriterSettings);//(@"C:\customers.xml");
            writer.WriteStartDocument();
            writer.WriteStartElement("Customers");

            for (int i = 0; i < rdr.Count; i++)
            {
                writer.WriteStartElement("Customer");

                writer.WriteElementString("CustomerID", rdr[i][0].ToString());
                writer.WriteElementString("Name", rdr[i][1].ToString());
                writer.WriteElementString("Address", rdr[i][2].ToString());
                writer.WriteElementString("Phone", rdr[i][3].ToString());
                writer.WriteElementString("Email", rdr[i][4].ToString());

                writer.WriteEndElement();
            }

            writer.WriteEndElement();
            writer.WriteEndDocument();
            writer.Close();

            Response.ContentType = "text/xml";
            Response.AppendHeader("content-disposition", "customers.xml");

        }
    }
}

