<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="Docks.aspx.cs" Inherits="PopeyeMarinaWebApp.Admin.Docks" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <h3>Docks</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:GridView runat="server" ID="DocksGrid"
                        ItemType="PopeyeMarinaWebApp.Models.Dock"
                        DataKeyNames="DockID" 
                        SelectMethod="DocksGrid_GetData"
                        AutoGenerateColumns="false"  
                        CssClass="table table-striped table-hover" 
                        AllowPaging="True" 
                        PageSize="5"
                        AllowSorting="True"
                        BorderColor="#CCCCCC"> 
                        <Columns>
                            <asp:CommandField ShowSelectButton ="True" />
                            <asp:DynamicField DataField="DockID" />
                            <asp:DynamicField DataField="Location" />
                            <asp:DynamicField DataField="Electricity" />
                            <asp:DynamicField DataField="Water" />
                        </Columns>
                    </asp:GridView>
                    <div style="margin-top:20px; margin-bottom:20px">
                        <asp:Button ID="AddButton" CssClass="btn btn-primary btn-sm" runat="server" Text="Add Dock" OnClick="AddButton_Click" />
                    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger" ShowModelStateErrors="true" runat="server" />
                        <asp:FormView ID="DockFormUpdate" runat="server" 
                            ItemType="PopeyeMarinaWebApp.Models.Dock" 
                            DataKeyNames="DockID" 
                            RenderOuterTable="false"
                            DefaultMode="ReadOnly"
                            SelectMethod="DockFormUpdate_GetItem"
                            UpdateMethod="DockFormUpdate_UpdateItem" 
                            DeleteMethod="DockFormUpdate_DeleteItem"                 
                            OnItemUpdated="DockFormUpdate_ItemUpdated" 
                            OnItemDeleted="DockFormUpdate_ItemDeleted" >
                            <ItemTemplate>
                                <div class="form-horizontal">
                                    <fieldset>
                                        <legend>View Dock</legend>
                                        <div class="form-group">
                                            <label for="dockID" class="col-lg-2 control-label">Dock ID:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="dockID" runat="server" Text='<%#: Item.DockID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="location" class="col-lg-2 control-label">Location:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="location" runat="server" Text='<%#: Item.Location %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="electricity" class="col-lg-2 control-label">Electricity:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="electricity" runat="server" Text='<%#: Item.Electricity %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="water" class="col-lg-2 control-label">Water:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="water" runat="server" Text='<%#: Item.Water %>' />
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
                                        <legend>Edit Dock</legend>
                                        <div class="form-group">
                                            <label for="dockID" class="col-lg-2 control-label">DockID:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="dockID" runat="server" Text='<%#: Item.DockID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="location" class="col-lg-2 control-label">Location:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="location" runat="server" Text="<%#: BindItem.Location %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="electricity" class="col-lg-2 control-label">Electricity:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="electricity" runat="server" Text="<%#: BindItem.Electricity %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="water" class="col-lg-2 control-label">Water:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="water" runat="server" Text="<%#: BindItem.Water %>" ValidationGroup="Edit"></asp:TextBox>
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
