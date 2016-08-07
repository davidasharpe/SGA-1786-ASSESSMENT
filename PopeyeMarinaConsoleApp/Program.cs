using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace PopeyeMarinaConsoleApp
{
    public class Customer
    {
        public int customerID { get; set; }
        public string customerName { get; set; }
        public string customerAddress { get; set; }
        public int customerPhoneNo { get; set; }

        public Customer(int ID, string Name, string Address, int Phone)
        {
            ID = customerID;
            Name = customerName;
            Address = customerAddress;
            Phone = customerPhoneNo;
        }
    }
    
    class Program
    {
        static void Main(string[] args)
        {
            Customer customer1 = new Customer(1, "Bob Taylor", "200 Random Street Some Suburb", 0401999999);

            Console.WriteLine("Customer ID = {0} Name = {1} Address = {2} Phone = {3}",
                customer1.customerID,
                customer1.customerName,
                customer1.customerAddress,
                customer1.customerPhoneNo);

            Console.ReadLine();
        }
    }
}


