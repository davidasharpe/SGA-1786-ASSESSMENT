using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PopeyeMarinaClassLibrary.Model
{
    public class Customer
    {
        [Key, Display(Name = "ID")]
        [ScaffoldColumn(false)]
        public int CustomerID { get; set; }

        [Required, StringLength(80), Display(Name = "Name")]
        public string Name { get; set; }

        [Required, StringLength(200), Display(Name = "Address")]
        public string Address { get; set; }

        [Required, StringLength(16), Display(Name = "Phone")]
        public string Phone { get; set; }

        [Required, StringLength(50), EmailAddress, Display(Name = "Email")]
        public string Email { get; set; }
    }
}
