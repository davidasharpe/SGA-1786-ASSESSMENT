<%@ Page Title="Products and Services" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ProductsAndServices.aspx.cs" Inherits="PopeyeMarinaWebApp.ProductsAndServices" %>
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
        <h3>Our marina is more than just a place to park your boat</h3>
            <p>We provide a variety of services.</p>
        <div class="row">
            <div class="col-md-3">
                <h4>Slip Leasing</h4>
                <img class="image100" src="Content/Images/boat-mooring.jpg" alt="boats moored at marina"/>
                <p>At Popeye Marina we aim to make boat berths and mooorings as affordable as possible with flexible lease options.</p>
                <p>Our Slips rnage from 5 metres to 20 metres in length and all of our slips are conected to shore power and water.</p>
                <p>The benifits of slip hire are 24 hour security, easy access, boat services, use of facilities, insurance and peace of mind.</p>
            </div>
            <div class="col-md-3">
                <h4>Boat Maintenence</h4>
                <img class="image100" src="Content/Images/Refit-of-a-luxury-sailing-yacht.jpg" alt="refit of sailing yacht"/>
                <p>Our marina has a range of the best selected services in the marine industry to provide our clients with convenience, service, reliability and confidences with undertaking the maintenance of their boat.</p>
                <p>We have a full ranage of services for boat maintenance including shipwrights, marine electricians, boat trimmers, marine painters, and detailers as well out beautiful waterfront cafe.</p>
            </div>
            <div class="col-md-3">
                <h4>Brokerage</h4>
                <img class="image100" src="Content/Images/For-Sale-Sign.jpg" alt="boat for sale sign"/>
                <p>We have a range of new and used boats for sale. Our managers have a strong background in sales and service with many years of boating experience, resulting in a successful boat sales team that achieves consistant results for both vendors and purchanses. Passion, drive and superior customer service are the conerstones of this boat sales team.</p>
            </div>
            <div class="col-md-3">
                <h4>Boat Hire</h4>
                <img class="image100" src="Content/Images/fishing-boat.jpg" alt="fishing boat"/>
                <p>Popeye Marina's small boat hire fleet are available from 8am to 4pm every day. Each tiny is a 4 meter long aluminium fishing boat with sun awning and a 6hp outboard motor, that can carry up to 6 passenges. Fuel, life jacks and a fishing license are inclueded in the small boat hire fee. All you need to bring is your own fishing gear. Bait is availble at the Popeye Marina Cafe.</p>
            </div>
        </div>
    </main>

</asp:Content>
