using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PopeyeMarinaWebApp.Models
{
    public class Slip
    {
        [Key, Display(Name = "Slip ID")]
        public int SlipID { get; set; }

        public int DockID { get; set; }
        
        [Display(Name = "Width")]
        public decimal Width { get; set; }

        [Display(Name = "Length")]
        public decimal Length { get; set; }

        public virtual Dock Dock { get; set; }

        public virtual ICollection<Lease> Lease { get; set; }
    }
}




