<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Template.aspx.cs" Inherits="PopeyeMarinaWebApp.Template" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div>
        <h3>Customers</h3>
        <asp:UpdatePanel ID="UpdatePanel" runat="server">
            <ContentTemplate>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" />
                <asp:GridView runat="server" ID="CustomersGrid"
                    ItemType="PopeyeMarinaWebApp.Models.Customer" 
                    DataKeyNames="CustomerID" 
                    SelectMethod="CustomersGrid_GetData"
                    AutoGenerateColumns="false"  
                    CssClass="table table-striped table-hover" 
                    AllowPaging="True" AllowSorting="True"> 
                    <Columns>
                        <asp:CommandField ShowSelectButton="True" />
                        <asp:DynamicField DataField="CustomerID" />
                        <asp:DynamicField DataField="Name" />
                        <asp:DynamicField DataField="Address" />
                        <asp:DynamicField DataField="Phone" /> 
                        <asp:DynamicField DataField="Email" />     
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
        </asp:UpdatePanel>
        
        <br />
        <br />
        <br />

        <asp:DropDownList ID="CustomersDropDownList" runat="server" 
            AutoPostBack="True" 
            SelectMethod="BindCustomers"
            AppendDataBoundItems="true"
            DataTextField="Name" DataValueField="CustomerID">
            <asp:ListItem Value="0">Select One:</asp:ListItem>
        </asp:DropDownList>
 
        <asp:FormView ID="CustomerForm" runat="server" 
            ItemType="PopeyeMarinaWebApp.Models.Customer" 
            DataKeyNames="CustomerID" 
            RenderOuterTable="false" 
            DefaultMode="ReadOnly" 
            SelectMethod="CustomerForm_GetItem" 
            UpdateMethod="CustomerForm_UpdateItem" 
            InsertMethod="CustomerForm_InsertItem" 
            DeleteMethod="CustomerForm_DeleteItem" 
            OnItemInserted="CustomerForm_ItemInserted" 
            OnItemUpdated="CustomerForm_ItemUpdated" 
            OnItemDeleted="CustomerForm_ItemDeleted">
            <ItemTemplate>
                <div class="form-horizontal">
                    <fieldset>
                        <legend>View Cutomer</legend>
                        <div class="form-group">
                            <label for="CustomerID" class="col-lg-2 control-label">CustomerID:</label>
                            <div class="col-lg-10">
                                <asp:Label ID="ID" runat="server" Text='<%#: Item.CustomerID %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Name" class="col-lg-2 control-label">Name:</label>
                            <div class="col-lg-10">
                                <asp:Label ID="name" runat="server" Text='<%#: Item.Name %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Address" class="col-lg-2 control-label">Address:</label>
                            <div class="col-lg-10">
                                <asp:Label ID="address" runat="server" Text='<%#: Item.Address %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Phone" class="col-lg-2 control-label">Phone:</label>
                            <div class="col-lg-10">
                                <asp:Label ID="phone" runat="server" Text='<%#: Item.Phone %>' />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="Email" class="col-lg-2 control-label">Email:</label>
                            <div class="col-lg-10">
                                <asp:Label ID="email" runat="server" Text='<%#: Item.Email %>' />
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <asp:Button ID="NewButton" runat="server" Text="New" CausesValidation="False" CssClass="btn btn-primary btn-sm" CommandName="New" />
                            <asp:Button ID="EditButton" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm" CommandName="Edit" />
                            <asp:Button ID="DeleteButton" runat="server" Text="Delete" CssClass="btn btn-primary btn-sm" CommandName="Delete"/> 
                        </div>
                    </fieldset>
                </div>
            </ItemTemplate>
            <EditItemTemplate>
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Edit Cutomer</legend>
                        <div class="form-group">
                            <label for="ID" class="col-lg-2 control-label">CustomerID:</label>
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
            <InsertItemTemplate>
                <div class="form-horizontal">
                    <fieldset>
                        <legend>Add Cutomer</legend>
                         <div class="form-group">
                            <label for="name" class="col-lg-2 control-label">Name:</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="name" runat="server" Text="<%#: BindItem.Name %>" ValidationGroup="Insert"></asp:TextBox>                          
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="address" class="col-lg-2 control-label">Address:</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="address" runat="server" Text="<%#: BindItem.Address %>" ValidationGroup="Insert"></asp:TextBox>                      
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="phone" class="col-lg-2 control-label">Phone:</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="phone" runat="server" Text="<%#: BindItem.Phone %>" ValidationGroup="Insert"></asp:TextBox>
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="email" class="col-lg-2 control-label">Email:</label>
                            <div class="col-lg-10">
                                <asp:TextBox ID="email" runat="server" Text="<%#: BindItem.Email %>" ValidationGroup="Insert"></asp:TextBox>
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
        

    </div>
    </form>
    <br />
    <br />
    </body>
</html>
