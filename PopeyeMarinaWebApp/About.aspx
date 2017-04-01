<%@ Page Title="About Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="PopeyeMarinaWebApp.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <div>
            <img class="logo2" src="Content/Images/PopeyeMarina-Logo100.png" />
        </div>
        <div class="heading">
           <h1><%: Title %></h1>
        </div>
    </header>
    <main>
        <h3>Welcome to Popeye Marina</h3>
        <p>Popeye Marina is a privately owned corporation that rents boat slips and provides boat services on Olive Oyl Lakes, a large inland lake located in the Brutus area. Popeye is the largest of the three marinas on the lake, accomodating up to 350 sailboats and 75 powerboats.</p>
        <p>We also provide full on-site boat maintenance services, antifouling, fishing boat hire, water, gas, fuel, and an eatery.</p>
        <p>Our marina is a familiy owned business and has been a strong part of the boating community for the last seventy years.</p>
        <br />
        <br />
        <br />
        <br />
        <div class="row">
            <div class="col-md-4">
                <img class="image100" src="Content/Images/power-boat-top.jpg" alt="powerboat"/>
            </div>
            <div class="col-md-4">
                <img class="image100" src="Content/Images/lake-geneva-boat-race-horizontal-large-gallery.jpg" alt="sailboats"/>
            </div>
            <div class="col-md-4">
                <img class="image100" src="Content/Images/sailing_boat_close_up.jpg" alt="close-up of sailboat with sunset" />
            </div>
        </div>
    </main>
</asp:Content>
