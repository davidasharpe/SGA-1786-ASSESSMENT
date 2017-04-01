using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PopeyeMarinaClassLibrary.Model
{
    public class Lease
    {
        [Key Display(Name = "Lease ID")]
        public int LeaseID { get; set; }

        [ForeignKey("Customer")]
        public int? CustomerID { get; set; }

        [ForeignKey("Slip")]
        public int? SlipID { get; set; }

        [ForeignKey("Boat")]
        public int? BoatID { get; set; }

        [Range(typeof(DateTime), "1/1/2013", "1/1/3000", ErrorMessage = "Please provide a start date after 1/1/2016")]
        [Required, Display(Name = "Start Date") DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public DateTime StartDate { get; set; }

        [Range(typeof(DateTime), "1/1/2013", "1/1/3000", ErrorMessage = "Please provide an end date after 1/1/2016")]
        [Required, Display(Name = "End Date") DisplayFormat(ApplyFormatInEditMode = true, DataFormatString = "{0:d}")]
        public DateTime EndDate { get; set; }

        [Required, Display(Name = "Amount")]
        public decimal Amount { get; set; }

        public virtual Customer Customer { get; set; }

        public virtual Slip Slip { get; set; }

        public virtual Boat Boat { get; set; }
    }
}
