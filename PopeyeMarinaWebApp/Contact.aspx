<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="PopeyeMarinaWebApp.Contact" %>

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
        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-10">
                <div class="row">
                    <div class="col-md-6">
                        <h3>Contact US</h3>
                        <address>
                            Popeeye Marinabr<br/>
                            PO Box 1025<br />
                            Olive Oyl Lake NSW 98052-6399<br/>
                            <abbr title="Phone">P:</abbr>
                            (02) 9427 9999
                            <strong>Admin:</strong> <a href="mailto:admin@popeyemarina.com">admin@popeyemarina.com</a>
                        </address>
                    </div>
                    <div class="col-md-6">
                </div>
            </div>
        </div>
        <div class="row form-horizontal">
            <div class="col-md-2"></div>
            <div class="col-md-10">
                <fieldset>
                <legend>Contact Form</legend>
                    <div class="form-group">
                        <label for="inputName" class="col-lg-2 control-label">Name:</label>
                        <div class="col-lg-10">
                            <input type="text" class="form-control" id="inputName" placeholder="Name">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputAddress" class="col-lg-2 control-label">Address:</label>
                        <div class="col-lg-10">
                            <input type="text" class="form-control" id="inputAddress" placeholder="Address">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPhone" class="col-lg-2 control-label">Phone No:</label>
                        <div class="col-lg-10">
                            <input type="text" class="form-control" id="inputPhone" placeholder="Phone No">
                        </div>
                    </div>
                    <div class="form-group">
                      <label for="inputEmail" class="col-lg-2 control-label">Email:</label>
                      <div class="col-lg-10">
                        <input type="text" class="form-control" id="inputEmail" placeholder="Email">
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputMessage" class="col-lg-2 control-label">Message:</label>
                      <div class="col-lg-8">
                        <textarea class="form-control" rows="10" id="inputMessage" draggable="false"></textarea>
                        <span class="help-block">Type your message here.</span>
                      </div>
                    </div>
                    <div class="form-group">
                      <label for="inputTerms" class="col-lg-2 control-label"></label>
                        <div class="col-lg-10">
                            <div class="checkbox">
                                <label><input id="inputTerms" type="checkbox">I have read the terms and conditions</label>
                            </div>
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
    </main>
</asp:Content>
