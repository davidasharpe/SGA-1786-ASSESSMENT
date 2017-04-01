using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PopeyeMarinaClassLibrary.Model
{
    public class Dock
    {
        [Key, Display(Name = "Dock ID")]
        public int DockID { get; set; }

        [Required, Display(Name = "Location")]
        public string Location { get; set; }

        [Required, Display(Name = "Electricity")]
        public string Electricity { get; set; }

        [Required, Display(Name = "Water")]
        public string Water { get; set; }

        public ICollection<Slip> Slips { get; set; }
    }
}
