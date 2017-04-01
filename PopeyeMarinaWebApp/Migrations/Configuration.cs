namespace PopeyeMarinaWebApp.Migrations
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Migrations;
    using System.Linq;
    using PopeyeMarinaWebApp.Models;

    internal sealed class Configuration : DbMigrationsConfiguration<MarinaDBContext>
    {
        public Configuration()
        {
            AutomaticMigrationsEnabled = false;
        }

        protected override void Seed(MarinaDBContext context)
        {
            context.Customers.AddOrUpdate(
                new Customer
                {
                    CustomerID = 1,
                    Name = "Barry Norris",
                    Address = "Oxford St Bondi",
                    Phone = "029777888",
                    Email = "bnorris@email.com"
                },

                new Customer
                {
                    CustomerID = 2,
                    Name = "James Smith",
                    Address = "New South Head Road Double Bay",
                    Phone = "029888333",
                    Email = "jsmith@email.com"
                },
                
                new Customer
                {
                    CustomerID = 3,
                    Name = "Ron McDonald",
                    Address = "Beach St Coogee",
                    Phone = "029555111",
                    Email = "rmcdonald@email.com"
                },

                new Customer
                {
                    CustomerID = 4,
                    Name = "Mary Bowman",
                    Address = "Miller St North Sydne",
                    Phone = "029888777",
                    Email = "mbowman@email.com"
                },

                new Customer
                {
                    CustomerID = 5,
                    Name = "Anthony Searle",
                    Address = "Atkinson St Cammerary",
                    Phone = "029999333",
                    Email = "asearle@email.com"
                }
            );

            context.SaveChanges();

            context.Docks.AddOrUpdate(
                new Dock
                {
                    DockID = 1,
                    Location = "right side",
                    Electricity = "avaiable",
                    Water = "available",
                },

                new Dock
                {
                    DockID = 2,
                    Location = "left side",
                    Electricity = "avaiable",
                    Water = "available",
                }
            );

            context.SaveChanges();

            context.Slips.AddOrUpdate(

                new Slip
                {
                    SlipID = 1,
                    DockID = 1,
                    Width = 3,
                    Length = 10,
                },

                new Slip
                {
                    SlipID = 2,
                    DockID = 1,
                    Width = 3,
                    Length = 10,
                },

                new Slip
                {
                    SlipID = 3,
                    DockID = 1,
                    Width = 3,
                    Length = 10,
                },

                new Slip
                {
                    SlipID = 4,
                    DockID = 1,
                    Width = 3,
                    Length = 10,
                },

                new Slip
                {
                    SlipID = 5,
                    DockID = 2,
                    Width = 5,
                    Length = 25,
                },

                new Slip
                {
                    SlipID = 6,
                    DockID = 2,
                    Width = 5,
                    Length = 25,
                },

                new Slip
                {
                    SlipID = 7,
                    DockID = 2,
                    Width = 5,
                    Length = 25,
                },

                new Slip
                {
                    SlipID = 8,
                    DockID = 2,
                    Width = 5,
                    Length = 25,
                }
            );

            context.SaveChanges();

            context.Boats.AddOrUpdate(
                new Boat
                {
                    BoatID = 1,
                    StateRegoNo = "TW207332",
                    Length = 20.01,
                    Manufacturer = "Whittley",
                    Model = "Sea Legend 601",
                    Year = 2002,
                    Type = BoatType.PowerBoat,
                    Description = ""
                },

                new Boat
                {
                    BoatID = 2,
                    StateRegoNo = "NS210451",
                    Length = 48.38,
                    Manufacturer = "Dufour",
                    Model = "500 Grand Large",
                    Year = 2015,
                    Type = BoatType.SailBoat,
                    Description = ""
                },

                new Boat
                {
                    BoatID = 3,
                    StateRegoNo = "HJ905623",
                    Length = 56.97,
                    Manufacturer = "Princess",
                    Model = "V57",
                    Year = 2014,
                    Type = BoatType.PowerBoat,
                    Description = ""
                },

                new Boat
                {
                    BoatID = 4,
                    StateRegoNo = "TL845111",
                    Length = 22,
                    Manufacturer = "Mastercraft",
                    Model = "NXT22",
                    Year = 2016,
                    Type = BoatType.PowerBoat,
                    Description = ""
                },

                new Boat
                {
                    BoatID = 5,
                    StateRegoNo = "KL201376",
                    Length = 36.08,
                    Manufacturer = "Elliot",
                    Model = "11",
                    Year = 1993,
                    Type = BoatType.SailBoat,
                    Description = ""
                }
            );

            context.SaveChanges();

            context.Leases.AddOrUpdate(
                
                new Lease
                {
                    LeaseID = 1,
                    CustomerID = 1,
                    SlipID = 1,
                    BoatID = 1,
                    StartDate = new DateTime(2016, 7, 20),
                    EndDate = new DateTime(2017, 6, 20),
                    Amount = 10, 
                },

                new Lease
                {
                    LeaseID = 2,
                    CustomerID = 2,
                    SlipID = 5,
                    BoatID = 2,               
                    StartDate = new DateTime(2016, 7, 20),
                    EndDate = new DateTime(2017, 6, 20),
                    Amount = 20,
                },

                new Lease
                {
                    LeaseID = 3,
                    CustomerID = 3,
                    SlipID = 6,
                    BoatID = 3,               
                    StartDate = new DateTime(2016, 7, 20),
                    EndDate = new DateTime(2017, 6, 20),
                    Amount = 20,
                },

                new Lease
                {
                    LeaseID = 4,
                    CustomerID = 4,
                    SlipID = 6,
                    BoatID = 4,                 
                    StartDate = new DateTime(2016, 7, 20),
                    EndDate = new DateTime(2017, 6, 20),
                    Amount = 10,
                },

                new Lease
                {
                    LeaseID = 5,
                    CustomerID = 5,
                    SlipID = 7, 
                    BoatID = 5,              
                    StartDate = new DateTime(2016, 7, 20),
                    EndDate = new DateTime(2017, 6, 20),
                    Amount = 20,
                } 
            );

            context.SaveChanges();

        }
    }
}



