﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="Leases.aspx.cs" Inherits="PopeyeMarinaWebApp.Admin.Leases" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
     <h3>Leases</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:GridView runat="server" ID="LeasesGrid"
                        ItemType="PopeyeMarinaWebApp.Models.Lease"
                        DataKeyNames="LeaseID" 
                        SelectMethod="LeasesGrid_GetData"
                        AutoGenerateColumns="false"  
                        CssClass="table table-striped table-hover" 
                        AllowPaging="True" 
                        PageSize="5"
                        AllowSorting="True"
                        BorderColor="#CCCCCC"> 
                        <Columns>
                            <asp:CommandField ShowSelectButton ="True" />
                            <asp:DynamicField DataField="LeaseID" />
                            <asp:DynamicField DataField="CustomerID" />
                            <asp:DynamicField DataField="SlipID" />
                            <asp:DynamicField DataField="StartDate" />
                            <asp:DynamicField DataField="EndDate" />
                            <asp:DynamicField DataField="Amount" />
                        </Columns>
                    </asp:GridView>
                        <div style="margin-top:20px; margin-bottom:20px">
                        <asp:Button ID="AddButton" CssClass="btn btn-primary btn-sm" runat="server" Text="Add Lease" OnClick="AddButton_Click" />
                    </div>
        </ContentTemplate>
    </asp:UpdatePanel>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <Triggers>
                    <asp:AsyncPostBackTrigger ControlID="AddButton" />
                </Triggers>
                <ContentTemplate>
                    <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger" ShowModelStateErrors="true" runat="server" />
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
                                                         SelectMethod="GetCusomer" 
                                                         DataTextField="Name" 
                                                         DataValueField="Name"
                                                         AppendDataBoundItems="true">
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
                                                         AppendDataBoundItems="true">
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
                                                         DataValueField="StateRegoNo"
                                                         AppendDataBoundItems="true">
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
                                                OnTextChanged="CalculateDays" ValidationGroup="Insert"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="endDate" class="col-lg-2 control-label">End Date:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="endDate" CssClass="DatePicker" runat="server" Text="<%#: BindItem.EndDate %>" 
                                                OnTextChanged="CalculateDays" ValidationGroup="Insert"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                            <label for="totalDays" class="col-lg-2 control-label">Total No Days:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="totalDays" runat="server" Text="" />
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label for="amountPerDay" class="col-lg-2 control-label">Amount:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="amountPerDay" runat="server" Text="<%#: BindItem.Amount %>" />
                                            </div>
                                        </div>
                                    <div class="form-group">
                                            <label for="totalFee" class="col-lg-2 control-label">Total Fee:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="totalFee" runat="server" OnLoad="CalculateFee" Text="" />
                                            </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <asp:Button ID="InsertButton" runat="server" Text="Insert" CausesValidation="True" CssClass="btn btn-primary btn-sm" CommandName="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm" CommandName="Cancel"/> 
                                    </div>
                                </fieldset>
                            </div>
                        </InsertItemTemplate>
                        </asp:FormView>
                        <asp:FormView ID="LeaseFormUpdate" runat="server" 
                            ItemType="PopeyeMarinaWebApp.Models.Lease" 
                            DataKeyNames="LeaseID" 
                            RenderOuterTable="false"
                            DefaultMode="ReadOnly"
                            SelectMethod="LeaseFormUpdate_GetItem"
                            UpdateMethod="LeaseFormUpdate_UpdateItem" 
                            DeleteMethod="LeaseFormUpdate_DeleteItem"                 
                            OnItemUpdated="LeaseFormUpdate_ItemUpdated" 
                            OnItemDeleted="LeaseFormUpdate_ItemDeleted" >
                            <ItemTemplate>
                                <div class="form-horizontal">
                                    <fieldset>
                                        <legend>View Lease</legend>
                                        <div class="form-group">
                                            <label for="slipID" class="col-lg-2 control-label">Slip ID:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="slipID" runat="server" Text='<%#: Item.LeaseID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="customerID" class="col-lg-2 control-label">Customer ID:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="customerID" runat="server" Text='<%#: Item.CustomerID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="boatID" class="col-lg-2 control-label">Boat ID:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="boatID" runat="server" Text='<%#: Item.BoatID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="startDate" class="col-lg-2 control-label">Start Date:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="startDate" runat="server" Text='<%#: Item.StartDate %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="endDate" class="col-lg-2 control-label">End Date:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="endDate" runat="server" Text='<%#: Item.EndDate %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="totalDays" class="col-lg-2 control-label">Total No Days:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="totalDays" runat="server" Text="" />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="amountPerDay" class="col-lg-2 control-label">Amount:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="amountPerDay" runat="server" Text='<%#: Item.Amount %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="totalFee" class="col-lg-2 control-label">Total Fee:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="totalFee" runat="server" Text="" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <asp:Button ID="EditButton" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm" CommandName="Edit" />
                                            <asp:Button ID="DeleteButton" runat="server" Text="Delete" CssClass="btn btn-primary btn-sm" CommandName="Delete" OnClientClick="javascript:confirm('This record will be deleted permanently from the database. Do you wish to proceed?')" /> 
                                        </div>
                                    </fieldset>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="form-horizontal">
                                    <fieldset>
                                        <legend>Edit Lease</legend>
                                        <div class="form-group">
                                            <label for="leaseID" class="col-lg-2 control-label">Lease ID:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="leaseID" runat="server" Text='<%#: Item.LeaseID %>' />
                                            </div>
                                        </div>
                                        <InsertItemTemplate>
                                        <fieldset>
                                            <div class="form-group">
                                                 <label for="customer" class="col-lg-2 control-label">Customer Name:</label>
                                                 <div class="col-lg-10">
                                                     <asp:DropDownList ID="customer" runat="server" 
                                                         SelectMethod="EditCusomer" 
                                                         ItemType="PopeyeMarinaWebApp.Models.Customer"
                                                         DataTextField="Name" 
                                                         DataValueField="Name"
                                                         AppendDataBoundItems="true">
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
                                                         SelectMethod="EditSlip" 
                                                         ItemType="PopeyeMarinaWebApp.Models.Slip"
                                                         DataTextField="SlipID" 
                                                         DataValueField="SlipID"
                                                         AppendDataBoundItems="true">
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
                                                         SelectMethod="EditBoat"
                                                         ItemType="PopeyeMarinaWebApp.Models.Boat" 
                                                         DataTextField="StateRegoNo" 
                                                         DataValueField="StateRegoNo"
                                                         AppendDataBoundItems="true">
                                                     </asp:DropDownList>
                                                 </div>
                                             </div>
                                        </fieldset>
                                    </InsertItemTemplate>
                                    <div class="form-group">
                                        <label for="startDate" class="col-lg-2 control-label">Start Date:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="startDate" CssClass="DatePicker" runat="server" Text="<%#: BindItem.StartDate %>" 
                                                OnTextChanged="CalculateDays" ValidationGroup="Edit"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="endDate" class="col-lg-2 control-label">End Date:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="endDate" CssClass="DatePicker" runat="server" Text="<%#: BindItem.EndDate %>" 
                                                OnTextChanged="CalculateDays" ValidationGroup="Edit"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                            <label for="totalDays" class="col-lg-2 control-label">Total No Days:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="totalDays" runat="server" Text="" />
                                            </div>
                                    </div>
                                    <div class="form-group">
                                            <label for="amountPerDay" class="col-lg-2 control-label">Amount:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="amountPerDay" runat="server" Text="<%#: BindItem.Amount %>" />
                                            </div>
                                        </div>
                                    <div class="form-group">
                                            <label for="totalFee" class="col-lg-2 control-label">Total Fee:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="totalFee" runat="server" OnDataBinding="CalculateFee" Text="" />
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <asp:Button ID="UpdateButton" runat="server" Text="Update" CausesValidation="True" CssClass="btn btn-primary btn-sm" CommandName="Update" />
                                            <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm" CommandName="Cancel"/> 
                                        </div>
                                    </fieldset>
                                </div>
                            </EditItemTemplate>
                        </asp:FormView>
                </ContentTemplate>
        </asp:UpdatePanel>
    <script>
        $(function () {
            $('.DatePicker').datepicker(
            {
                dateFormat: 'dd/mm/yy',
                changeMonth: true,
                changeYear: true,
                yearRange: '1950:2100'
            });
        })
    </script>
</asp:Content>


