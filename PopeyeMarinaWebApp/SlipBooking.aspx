<%@ Page Title="Slip Booking" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="SlipBooking.aspx.cs" Inherits="PopeyeMarinaWebApp.SlipBooking" %>

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
        <div class="row form-horizontal">
            <div class="col-md-2"></div>
            <div class="col-md-10">
                <h3>Make a booking</h3>
                <hr />
                <fieldset>
                <h3>Customer Details</h3>
                <br />
                <h4>Address:</h4>
                <div class="form-group">
                    <label for="inputName" class="col-lg-2 control-label">Name</label>
                    <div class="col-lg-10" style="left: 0px; top: 0px">
                        <asp:TextBox ID="inputName" CssClass="form-control" placeholder="Name" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputUnit" class="col-lg-2 control-label">Unit/Apartment:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputUnit" CssClass="form-control" placeholder="Unit" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputNumber" class="col-lg-2 control-label">Number:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputNumber" CssClass="form-control" placeholder="Number" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputStreet" class="col-lg-2 control-label">Street:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputStreet" CssClass="form-control" placeholder="Street" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputSuburb" class="col-lg-2 control-label">Suburb/City/Town:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputSuburb" CssClass="form-control" placeholder="Suburb/City/Town" runat="server"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label for="selectState" class="col-lg-2 control-label">State:</label>
                    <div class="col-lg-10">
                        <asp:DropDownList runat="server" CssClass="form-control" id="select" OnSelectedIndexChanged="selectState_SelectedIndexChanged" Width="200px">
                            <asp:ListItem>select state</asp:ListItem>
                            <asp:ListItem>New South Wales</asp:ListItem>
                            <asp:ListItem>Queensland</asp:ListItem>
                            <asp:ListItem>Victoria</asp:ListItem>
                            <asp:ListItem>South Australia</asp:ListItem>
                            <asp:ListItem>Western Australia</asp:ListItem>
                            <asp:ListItem>Tasmania</asp:ListItem>
                            <asp:ListItem>Northern Teritory</asp:ListItem>
                            <asp:ListItem>ACT</asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEmail" class="col-lg-2 control-label">Email Address:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputEmail" CssClass="form-control" placeholder="Email Address" runat="server"></asp:TextBox>
                    </div>
                </div>
                <hr />
                <h3>Lease Slip</h3>
                <br />
                <div class="form-group">
                    <label for="inputStartDate" class="col-lg-2 control-label">Start Date:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputStartDate" CssClass="DatePicker" placeholder="Start Date" runat="server"></asp:TextBox>  
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputEndDate" class="col-lg-2 control-label">End Date:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputEndDate" CssClass="DatePicker" placeholder="End Date" runat="server"></asp:TextBox>  
                    </div>
                </div>
                <div class="form-group">
                    <label for="leaseType" class="col-lg-2 control-label">Lease Type:</label>
                    <div class="col-lg-10">
                        <asp:DropDownList runat="server" CssClass="form-control" id="leaseType" OnSelectedIndexChanged="leaseType_SelectedIndexChanged" Width="200px">
                            <asp:ListItem>select lease type</asp:ListItem>
                            <asp:ListItem>Annual</asp:ListItem>
                            <asp:ListItem>Daily</asp:ListItem>
                        </asp:DropDownList>  
                    </div>
                </div>
                <hr />
                <h3>Boat Details</h3>
                <br />
                <div class="form-group">
                    <label for="inputStateRegoNo" class="col-lg-2 control-label">State Rego No:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputStateRegoNo" CssClass="form-control" placeholder="State Rego No" runat="server"></asp:TextBox>  
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputManufacturer" class="col-lg-2 control-label">Manufacturer:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputManufacturer" CssClass="form-control" placeholder="Manufacturer" runat="server"></asp:TextBox>  
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputModel" class="col-lg-2 control-label">Model:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputModel" CssClass="form-control" placeholder="Model" runat="server"></asp:TextBox>  
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputLength" class="col-lg-2 control-label">Length:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputLength" CssClass="form-control" placeholder="Length" runat="server"></asp:TextBox>  
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputYear" class="col-lg-2 control-label">Year:</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputYear" CssClass="form-control" placeholder="Year" runat="server"></asp:TextBox>  
                    </div>
                </div>
                <div class="form-group">
                    <label for="boatType" class="col-lg-2 control-label">Boat Type:</label>
                    <div class="col-lg-10">
                        <asp:DropDownList runat="server" CssClass="form-control" id="boatType" OnSelectedIndexChanged="boatType_SelectedIndexChanged" Width="200px">
                            <asp:ListItem>select boat type</asp:ListItem>
                            <asp:ListItem>Powerboat</asp:ListItem>
                            <asp:ListItem>Sailboat</asp:ListItem>
                        </asp:DropDownList>  
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputDescription" class="col-lg-2 control-label">Description</label>
                    <div class="col-lg-10">
                        <asp:TextBox ID="inputDescription" CssClass="form-control" Rows="10" placeholder="Description" runat="server" TextMode="MultiLine" Height="100px" Width="50%"></asp:TextBox>  
                    </div>
                </div>
                <div class="form-group">
                    <label for="inputTerms" class="col-lg-2 control-label"></label>
                    <div class="col-lg-10">
                        <asp:CheckBox ID="inputTerms" Text="I have read the terms and conditions" runat="server" />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-lg-10 col-lg-offset-2">
                        <asp:Button ID="reset" runat="server" CssClass="btn btn-primary btn-sm" Text="cancel" />
                        <asp:Button ID="submit" runat="server" CssClass="btn btn-primary btn-sm" Text="submit" />
                    </div>
                </div>
        </fieldset>
    </div>
        </div>
    </main
</asp:Content>
