using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace PopeyeMarinaWebApp.Models
{
    public class Boat
    {
        [Key, Display(Name ="Boat ID")]
        public int BoatID { get; set; }
        
        [Required, Display(Name = "State Rego Number")]
        public string StateRegoNo { get; set; }

        [Required, Display(Name = "Length")]
        public double Length { get; set; }

        [Required, Display(Name = "Manufacturer")]
        public string Manufacturer { get; set; }

        [Required, Display(Name = "Model")]
        public string Model { get; set; }

        [Required, Display(Name = "Year")]
        public int Year { get; set; }

        public string Description { get; set; }

        [EnumDataType(typeof(BoatType)), Display(Name = "Boat Type")]
        public BoatType Type { get; set; }

        public virtual ICollection<Lease> Lease { get; set; }
    }

    public enum BoatType
    {
        PowerBoat,
        SailBoat
    }




    /*
    public class PowerBoat : Boat
    {
        public double KeepDepth { get; set; }
        public int NumberSails { get; set; }
        public string MotorType { get; set; }

    }

    public class Sailboat : Boat
    {
        public int NumberEngines { get; set; }
        public string FuelType { get; set; }

    }
    */

}