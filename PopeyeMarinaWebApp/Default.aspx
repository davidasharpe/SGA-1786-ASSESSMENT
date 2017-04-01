<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="PopeyeMarinaWebApp._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <header>
        <div class="mainHeader col-md-10">
            <div class="jumbotron">      
                <img class="logo1" src="Content/Images/PopeyeMarinaLogo.png" />
            </div>
        </div>
        <div class="webService col-md-2">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="rows">
                        <div class="col-md-12">
                            <h4>Local Weather</h4>
                        <table class="weatherTable">
                            <tr>
                                <td>Temp:</td>
                                <td><asp:TextBox ID="TemperatureTextbox" runat="server" CssClass="form-control input-xs" Text="" Width="50px" Height="10px"></asp:TextBox></td>
                                <td><asp:Button ID="ConvertButton" runat="server" CssClass="btn btn-primary btn-xs" Text="Convert" OnClick="ConvertButton_Click"/></td>
                            </tr>
                        </table>
                        <br />
                        <label for="FahrenheitLabel" style="font-size:14px">Fahrenheit To Celsius:</label>
                            <div style="background:#fff">
                                <asp:Label ID="FahrenheitLabel" runat="server" Text=""></asp:Label>
                            </div>
                        <br />
                        <label for="CelsiusLabel" style="font-size:14px">Celsius To Fahrenheit:</label>
                            <div style="background:#fff">
                                <asp:Label ID="CelsiusLabel" runat="server" Text=""></asp:Label>
                        </div>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>   
    </header>
    <main>
        <div class="row">
            <div class="col-md-4">
                <h2>Our Marina</h2>
                <p>We are the largest Marina on Olive Oyl Lake, a large inland lake located in the Brutus area. We maintain a boating tradition that dates back seventy years and has strong ties with the local community.</p>
                <p>Olive Oly Lake is a very popular tourist destination and caters for a variety recreation activities. Our marina is easily accessible to nearby shops, restaurants and accommodation.</p>
            </div>
            <div class="col-md-4">
                <h2>Our Services</h2>
                <p>We provide a range of services including boat moorings, service and maintenance, new and used boat sales and small boat hire as well as our famous Popeye Marina Cafe.</p>
                <p>Our marina can accomodate up to 350 sailboats and 75 powerboats. All our slips have electricity and water connected and come with a variety of different lengths to suit the size of your boat</p>
            </div>
            <div class="col-md-4">
                <h2>Contact Us</h2>
                <p>Contact us for any equires. We'll be glad to help</p>
                <p>Click on <a href="SlipBooking.aspx">Slipping Booking</a> if you wish to lease one our our slips for your sail or power boat or click <a href="Contact.aspx">Contact</a> for any enquires</p>
                <p>Phone: (02) 9427 9999</p>
                <p>Email: <a href="mailto:admin@popeyemarina.com">admin@popeyemarina.com</a></p>
            </div>
        </div>
        <div class="row">
            <div class="col-md-4">
                <img class="image100" src="Content/Images/marina-aerial-view.jpg" alt="marina aerial view" />
            </div>
            <div class="col-md-4">
                <img class="image100" src="Content/Images/Boats-in-Lake-Michigan-Harbor-with-Lighthouse.jpg" alt="sailboats"/>
            </div>
            <div class="col-md-4">
                <img class="image100" src="Content/Images/BlackCrownHelm.jpg" alt="boat interior"/>   
            </div>
        </div>
    </main>
</asp:Content>
