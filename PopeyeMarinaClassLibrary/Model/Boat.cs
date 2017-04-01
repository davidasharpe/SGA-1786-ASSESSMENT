using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;

namespace PopeyeMarinaClassLibrary.Model
{
    public class Boat
    {
        [Key, Display(Name = "Boat ID")]
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


        public Boat()
        {
            

        }

    }

    public enum BoatType
    {
        PowerBoat,
        SailBoat
    }
}

