using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;

namespace PopeyeMarinaWebApp.Models
{
    public class MarinaDBContext : DbContext
    {
        public MarinaDBContext() : base("ConnectionString")
        {
        }

        public DbSet<Customer> Customers { get; set; }
        public DbSet<Boat> Boats { get; set; }
        public DbSet<Lease> Leases { get; set; }
        public DbSet<Slip> Slips { get; set; }
        public DbSet<Dock> Docks { get; set; }
    }
}







