<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="Boats.aspx.cs" Inherits="PopeyeMarinaWebApp.Boats" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <h3>Boats</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:GridView runat="server" ID="BoatsGrid"
                        ItemType="PopeyeMarinaWebApp.Models.Boat"
                        DataKeyNames="BoatID" 
                        SelectMethod="BoatsGrid_GetData"
                        AutoGenerateColumns="false"  
                        CssClass="table table-striped table-hover" 
                        AllowPaging="True" 
                        PageSize="5"
                        AllowSorting="True"
                        BorderColor="#CCCCCC"> 
                        <Columns>
                            <asp:CommandField ShowSelectButton ="True" />
                            <asp:DynamicField DataField="BoatID" />
                            <asp:DynamicField DataField="StateRegoNo" />
                            <asp:DynamicField DataField="Manufacturer" />
                            <asp:DynamicField DataField="Model" />
                            <asp:DynamicField DataField="Length" />
                            <asp:DynamicField DataField="Year" />
                            <asp:DynamicField DataField="Type" />
                        </Columns>
                    </asp:GridView>
                    <div style="margin-top:20px; margin-bottom:20px">
                        <asp:Button ID="AddButton" CssClass="btn btn-primary btn-sm" runat  ="server" Text="Add Boat" OnClick="AddButton_Click" />
                    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger" ShowModelStateErrors="true" runat="server" />
                        <asp:FormView ID="BoatFormUpdate" runat="server" 
                            ItemType="PopeyeMarinaWebApp.Models.Boat" 
                            DataKeyNames="BoatID" 
                            RenderOuterTable="false"
                            DefaultMode="ReadOnly"
                            SelectMethod="BoatFormUpdate_GetItem"
                            UpdateMethod="BoatFormUpdate_UpdateItem" 
                            DeleteMethod="BoatFormUpdate_DeleteItem"                 
                            OnItemUpdated="BoatFormUpdate_ItemUpdated" 
                            OnItemDeleted="BoatFormUpdate_ItemDeleted" >
                            <ItemTemplate>
                                <div class="form-horizontal">
                                    <fieldset>
                                        <legend>View Boat</legend>
                                        <div class="form-group">
                                            <label for="boatID" class="col-lg-2 control-label">Boat ID:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="boatID" runat="server" Text='<%#: Item.BoatID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="stateRegoNo" class="col-lg-2 control-label">State Rego No:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="stateRegoNo" runat="server" Text='<%#: Item.StateRegoNo %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="manufaturer" class="col-lg-2 control-label">Manufacturer:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="manufaturer" runat="server" Text='<%#: Item.Manufacturer %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="model" class="col-lg-2 control-label">Model:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="model" runat="server" Text='<%#: Item.Model %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="length" class="col-lg-2 control-label">Length:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="length" runat="server" Text='<%#: Item.Length %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="year" class="col-lg-2 control-label">Year:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="year" runat="server" Text='<%#: Item.Year %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="type" class="col-lg-2 control-label">Type:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="type" runat="server" Text='<%#: Item.Type %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="description" class="col-lg-2 control-label">Description:</label>
                                         <div class="col-lg-10">
                                                <asp:Label ID="description" runat="server" Text='<%#: Item.Description %>' />
                                            </div>
                                        </div>
                                            <asp:Button ID="EditButton" runat="server" Text="Edit" CssClass="btn btn-primary btn-sm" CommandName="Edit" />
                                            <asp:Button ID="DeleteButton" runat="server" Text="Delete" CssClass="btn btn-primary btn-sm" CommandName="Delete" OnClientClick="DeleteButton()"/> 
                                        </div>
                                    </fieldset>
                                </div>
                            </ItemTemplate>
                            <EditItemTemplate>
                                <div class="form-horizontal">
                                    <fieldset>
                                        <legend>Edit Boat</legend>
                                        <div class="form-group">
                                            <label for="boatID" class="col-lg-2 control-label">Boat ID:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="boatID" runat="server" Text='<%#: Item.BoatID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="stateRegoNo" class="col-lg-2 control-label">State Rego No:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="stateRegoNo" runat="server" Text="<%#: BindItem.StateRegoNo %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="manufacturer" class="col-lg-2 control-label">Manufacturer:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="manufacturer" runat="server" Text="<%#: BindItem.Manufacturer %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="model" class="col-lg-2 control-label">Model:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="model" runat="server" Text="<%#: BindItem.Model %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="length" class="col-lg-2 control-label">Length:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="length" runat="server" Text="<%#: BindItem.Length %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="year" class="col-lg-2 control-label">Year:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="year" runat="server" Text="<%#: BindItem.Year %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <InsertItemTemplate>
                                            <fieldset>
                                                 <div class="form-group">
                                                     <label for="type" class="col-lg-2 control-label">Type:</label>
                                                     <div class="col-lg-10">
                                                         <asp:DynamicControl ID="type" runat="server" DataField="Type" Mode="Insert" ValidationGroup="Edit"/>
                                                     </div>
                                                 </div>
                                            </fieldset>
                                        </InsertItemTemplate>
                                        <div class="form-group">
                                            <label for="description" class="col-lg-2 control-label">Description:</label>
                                         <div class="col-lg-10">
                                            <asp:TextBox ID="description" runat="server" Text="<%#: BindItem.Description %>" ValidationGroup="Edit" TextMode="MultiLine"></asp:TextBox>
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

