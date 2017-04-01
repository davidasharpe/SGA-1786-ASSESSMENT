using System;
using System.Linq;
using System.Web.UI;
using System.Web.UI.WebControls;
using PopeyeMarinaWebApp.Models;

namespace PopeyeMarinaWebApp.Admin
{
    public partial class AddLease : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        // Form View Add Lease

        public IQueryable<Lease> LeaseFormAdd_GetItem()
        {
            MarinaDBContext db = new MarinaDBContext();

            var query = from l in db.Leases
                        select l;
            return query;
        }

        public void LeaseFormAdd_InsertItem()
        {
            var item = new Lease();
            TryUpdateModel(item);
            if (ModelState.IsValid)
            {
                using (MarinaDBContext db = new MarinaDBContext())
                {
                    db.Leases.Add(item);
                    db.SaveChanges();
                }
            }
        }

        // DropDown Add Customer

        public IQueryable<Customer> GetCustomer()
        {

            MarinaDBContext db = new MarinaDBContext();

            //Select all Customers in Customer Table

            var query1 = from c in db.Customers
                         select c;
            

            //Select CustomerID in Customers Table that match CustomerID in Leases Table

            var query2 = from c in db.Customers
                         join l in db.Leases
                         on c.CustomerID equals l.CustomerID
                         select c;

            return query1;
        }

        // DropDown Add Slip

        public IQueryable<Slip> GetSlip()
        {
            MarinaDBContext db = new MarinaDBContext();

            //Select all Slips in Slips Table

            var query1 = from s in db.Slips
                        select s;
            
            //Select SlipID in Slips Table that match SlipID in Leases Table

            var query2 = from s in db.Slips
                         join l in db.Leases
                         on s.SlipID equals l.SlipID
                         select s;

            return query1;
        }

        // DropDown Add Boat

        public IQueryable<Boat> GetBoat()
        {
            MarinaDBContext db = new MarinaDBContext();

            //Select all Boats in Boat Table

            var query1 = from b in db.Boats
                        select b;

            //Select SlipID in Slips Table that match SlipID in Leases Table

            var query2 = from b in db.Boats
                         join l in db.Leases
                         on b.BoatID equals l.BoatID
                         select b;

            return query1;
        }

        protected void CalculateDays(object sender, EventArgs e)
        {
           
            TextBox startDate = (TextBox)LeaseFormAdd.Row.FindControl("startDate");
            TextBox endDate = (TextBox)LeaseFormAdd.Row.FindControl("endDate");
            Label totalDays = (Label)LeaseFormAdd.Row.FindControl("totalDays");

            string startdate = startDate.Text;
            string enddate = endDate.Text;
            if (startdate != "" && enddate != "")
            {
                DateTime t1 = Convert.ToDateTime(startdate);
                DateTime t2 = Convert.ToDateTime(enddate);

                if (t2 > t1)
                {
                    totalDays.Text = t2.Subtract(t1).Days.ToString();
                }
                else
                {
                    endDate.Text = startDate.Text;
                    totalDays.Text = 1.ToString();
                }
            }
        }

        protected void CalculateFee(object sender, EventArgs e)
        {

            Label totalDays = (Label)LeaseFormAdd.Row.FindControl("totalDays");
            TextBox amountPerDay = (TextBox)LeaseFormAdd.Row.FindControl("amountPerDay");
            Label totalFee = (Label)LeaseFormAdd.Row.FindControl("totalFee");

            int Days = Convert.ToInt32(totalDays.Text);
            decimal Amount = Convert.ToDecimal(amountPerDay.Text);
            decimal Fee = Days * Amount;
            totalFee.Text = Fee.ToString ();
        }

        protected void LeaseFormAdd_ItemInserted(object sender, FormViewInsertedEventArgs e)
        {
            if (ModelState.IsValid)
            {
                Response.Redirect("Leases.aspx");
            }
        }

        protected void CancelButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("Leases.aspx");
        }

    }
}