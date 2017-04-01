<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="Customers.aspx.cs" Inherits="PopeyeMarinaWebApp.Customers" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <h3>Customers</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:GridView runat="server" ID="CustomersGrid"
                        ItemType="PopeyeMarinaWebApp.Models.Customer" 
                        DataKeyNames="CustomerID" 
                        SelectMethod="CustomersGrid_GetData"
                        AutoGenerateColumns="false"  
                        CssClass="table table-striped table-hover" 
                        AllowPaging="True" 
                        PageSize="5"
                        AllowSorting="True"
                        BorderColor="#CCCCCC"> 
                        <Columns>
                            <asp:CommandField ShowSelectButton ="True" />
                            <asp:DynamicField DataField="CustomerID" />
                            <asp:DynamicField DataField="Name" />
                            <asp:DynamicField DataField="Address" />
                            <asp:DynamicField DataField="Phone" /> 
                            <asp:DynamicField DataField="Email" />     
                        </Columns>
                    </asp:GridView>
                    <div style="margin-top:20px; margin-bottom:20px">
                        <asp:Button ID="AddButton" CssClass="btn btn-primary btn-sm" runat  ="server" Text="Add Customer" OnClick="AddButton_Click" />
                        <asp:Button ID="ExportButton" CssClass="btn btn-primary btn-sm" runat  ="server" Text="Export" OnClick="ExportCustomers" />
                        <asp:SqlDataSource ID="CustomersSqlDataSource" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT * FROM [Customers]"></asp:SqlDataSource>
                    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger" ShowModelStateErrors="true" runat="server" />
                        <asp:FormView ID="CustomerFormUpdate" runat="server" 
                            ItemType="PopeyeMarinaWebApp.Models.Customer" 
                            DataKeyNames="CustomerID" 
                            RenderOuterTable="false" 
                            DefaultMode="ReadOnly" 
                            SelectMethod="CustomerForm_GetItem" 
                            UpdateMethod="CustomerForm_UpdateItem" 
                            DeleteMethod="CustomerForm_DeleteItem"                 
                            OnItemUpdated="CustomerForm_ItemUpdated" 
                            OnItemDeleted="CustomerForm_ItemDeleted">
                            <ItemTemplate>
                                <div class="form-horizontal">
                                    <fieldset>
                                        <legend>View Customer</legend>
                                        <div class="form-group">
                                            <label for="customerID" class="col-lg-2 control-label">Customer ID:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="customerID" runat="server" Text='<%#: Item.CustomerID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="name" class="col-lg-2 control-label">Name:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="name" runat="server" Text='<%#: Item.Name %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="address" class="col-lg-2 control-label">Address:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="address" runat="server" Text='<%#: Item.Address %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone" class="col-lg-2 control-label">Phone:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="phone" runat="server" Text='<%#: Item.Phone %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="col-lg-2 control-label">Email:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="email" runat="server" Text='<%#: Item.Email %>' />
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <asp:Button ID="EditButton" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm" CommandName="Edit" />
                                            <asp:Button ID="DeleteButton" runat="server" Text="Delete" CssClass="btn btn-primary btn-sm" CommandName="Delete" OnClientClick="DeleteButton()"/> 
                                        </div>
                                    </fieldset>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="form-horizontal">
                                    <fieldset>
                                        <legend>Edit Customer</legend>
                                        <div class="form-group">
                                            <label for="ID" class="col-lg-2 control-label">Customer ID:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="ID" runat="server" Text='<%#: Item.CustomerID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="name" class="col-lg-2 control-label">Name:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="name" runat="server" Text="<%#: BindItem.Name %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="address" class="col-lg-2 control-label">Address:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="address" runat="server" Text="<%#: BindItem.Address %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="phone" class="col-lg-2 control-label">Phone:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="phone" runat="server" Text="<%#: BindItem.Phone %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="email" class="col-lg-2 control-label">Email:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="email" runat="server" Text="<%#: BindItem.Email %>" ValidationGroup="Edit"></asp:TextBox>
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
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>



