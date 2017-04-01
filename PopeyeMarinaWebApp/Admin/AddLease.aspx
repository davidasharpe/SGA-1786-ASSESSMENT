<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AddLease.aspx.cs" Inherits="PopeyeMarinaWebApp.Admin.AddLease" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <h3>Leases</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
             <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger"
                        ShowModelStateErrors="true" ShowSummary="true" runat="server" />
                    <asp:FormView ID="LeaseFormAdd" runat="server"
                        ItemType="PopeyeMarinaWebApp.Models.Lease"
                        DataKeyNames="LeaseID" 
                        RenderOuterTable="false" 
                        DefaultMode="Insert"
                        SelectMethod="LeaseFormAdd_GetItem"
                        InsertMethod="LeaseFormAdd_InsertItem" 
                        OnItemInserted="LeaseFormAdd_ItemInserted">
                        <InsertItemTemplate>
                            <div class="form-horizontal">
                                <fieldset>
                                    <legend>Add Lease</legend>
                                    <InsertItemTemplate>
                                        <fieldset>
                                            <div class="form-group">
                                                 <label for="customer" class="col-lg-2 control-label">Customer Name:</label>
                                                 <div class="col-lg-10">
                                                     <asp:DropDownList ID="customer" runat="server" 
                                                         SelectMethod="GetCustomer" 
                                                         DataTextField="Name" 
                                                         DataValueField="CustomerID"
                                                         AppendDataBoundItems="true"
                                                         SelectedValue="<%#: BindItem.CustomerID %>">
                                                         <asp:ListItem Text="Select One" Value="" />
                                                     </asp:DropDownList>
                                                 </div>
                                             </div>
                                        </fieldset>
                                        </InsertItemTemplate>
                                    <InsertItemTemplate>
                                        <fieldset>
                                            <div class="form-group">
                                                 <label for="slipID" class="col-lg-2 control-label">Slip ID:</label>
                                                 <div class="col-lg-10">
                                                     <asp:DropDownList ID="slipID" runat="server" 
                                                         SelectMethod="GetSlip" 
                                                         DataTextField="SlipID" 
                                                         DataValueField="SlipID"
                                                         AppendDataBoundItems="true"
                                                         SelectedValue="<%#: BindItem.SlipID %>">
                                                         <asp:ListItem Text="Select One" Value="" />
                                                     </asp:DropDownList>
                                                 </div>
                                             </div>
                                        </fieldset>
                                    </InsertItemTemplate>
                                    <InsertItemTemplate>
                                        <fieldset>
                                            <div class="form-group">
                                                 <label for="stateRegoNo" class="col-lg-2 control-label">Boat State Rego No:</label>
                                                 <div class="col-lg-10">
                                                     <asp:DropDownList ID="stateRegoNo" runat="server" 
                                                         SelectMethod="GetBoat" 
                                                         DataTextField="StateRegoNo" 
                                                         DataValueField="BoatID"
                                                         AppendDataBoundItems="true" 
                                                         SelectedValue="<%#: BindItem.BoatID %>">
                                                         <asp:ListItem Text="Select One" Value="" />
                                                     </asp:DropDownList>
                                                 </div>
                                             </div>
                                        </fieldset>
                                    </InsertItemTemplate>
                                    <div class="form-group">
                                        <label for="startDate" class="col-lg-2 control-label">Start Date:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="startDate" CssClass="DatePicker" runat="server" Text="<%#: BindItem.StartDate %>"
                                                OnTextChanged="CalculateDays" ValidationGroup="Insert" AutoPostBack="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="endDate" class="col-lg-2 control-label">End Date:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="endDate" CssClass="DatePicker" runat="server" Text="<%#: BindItem.EndDate %>"
                                                OnTextChanged="CalculateDays" ValidationGroup="Insert" AutoPostBack="true"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                            <label for="totalDays" class="col-lg-2 control-label">Total No Days:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="totalDays" runat="server" Text="<%#: BindItem.TotalDays %>" />
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label for="amountPerDay" class="col-lg-2 control-label">Amount per Day:</label>
                                            <div class="col-lg-10"> 
                                                <asp:TextBox ID="amountPerDay" runat="server" Text="<%#: BindItem.Amount %>"
                                                    OnTextChanged="CalculateFee" AutoPostBack="true" ValidationGroup="Insert"></asp:TextBox>
                                            </div>
                                        </div>
                                    <div class="form-group">
                                            <label for="totalFee" class="col-lg-2 control-label">Total Fee:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="totalFee" runat="server" Text="<%#: BindItem.TotalFee %>" />
                                            </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <asp:Button ID="InsertButton" runat="server" Text="Insert" CausesValidation="True" CssClass="btn btn-primary btn-sm" CommandName="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm" CommandName="Cancel" OnClick="CancelButton_Click"/> 
                                    </div>
                                </fieldset>
                            </div>
                        </InsertItemTemplate>
                        </asp:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
