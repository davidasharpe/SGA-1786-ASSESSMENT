using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace PopeyeMarinaWebApp.Templates
{
    public partial class GridViewRadioButtons : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Customer Grid View Control

        public IQueryable<Customer> CustomersGrid_GetData()
        {
            MarinaDBContext db = new MarinaDBContext();
            var query = db.Customers;
            return query;
        }

        protected void CustomersGrid_RowCreated(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                Literal output = (Literal)e.Row.FindControl("RadioButtonMarkup");
                output.Text = string.Format(@"<input type=""radio"" name=""CustomersGroup"" id=""RowSelector{0}"" value=""{0}""", e.Row.RowIndex);
                if (CustomersSelectedIndex == e.Row.RowIndex || (!Page.IsPostBack && e.Row.RowIndex == 0))
                {
                    output.Text += @" checked=""checked""";

                    SelectedIDLabel.Text = Convert.ToString(CustomersSelectedIndex);
                }
                output.Text += " />";
            }
        }

        private int CustomersSelectedIndex
        {
            get
            {
                if (string.IsNullOrEmpty(Request.Form["CustomersGroup"]))
                    return -1;
                else
                    return Convert.ToInt32(Request.Form["CustomersGroup"]);
            }
        }

        protected void CustomersGrid_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        protected void SelectButton_Click(object sender, EventArgs e)
        {
            if (CustomersSelectedIndex < 0)
            {
                CustomersPanel.Visible = false;
            }
            else
            {
                Customers.SelectedIndex = "CustomersSelectedIndex";
                CustomersPanel.Visible = true;
                Console.WriteLine(SelectedIndex);
                SelectedIDLabel2.Text = Convert.ToString(SelectedIndex);
            }
        }

        // Customer FormView Control

        // Update Customer -----------------------------------------------------------

        public IQueryable<Customer> UpdateCustomerForm_GetItem(int SelectedIndex)
        {
            MarinaDBContext db = new MarinaDBContext();

            var query = db.Customers.Where(i => i.CustomerID == SelectedIndex);
            return query;
        }

        public void UpdateCustomerForm_UpdateItem(int CustomerID)
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

        protected void UpdateCustomerForm_ItemUpdated(object sender, FormViewUpdatedEventArgs e)
        {
            Response.Redirect("~/Admin/Customers");
        }

        protected void UpdateCancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Admin/Customers");
        }

    }
}