<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="Slips.aspx.cs" Inherits="PopeyeMarinaWebApp.Admin.Slips" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <h3>Slips</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true">
                <ContentTemplate>
                    <asp:GridView runat="server" ID="SlipsGrid"
                        ItemType="PopeyeMarinaWebApp.Models.Slip"
                        DataKeyNames="SlipID" 
                        SelectMethod="SlipsGrid_GetData"
                        AutoGenerateColumns="false"  
                        CssClass="table table-striped table-hover" 
                        AllowPaging="True" 
                        PageSize="5"
                        AllowSorting="True"
                        BorderColor="#CCCCCC"> 
                        <Columns>
                            <asp:CommandField ShowSelectButton ="True" />
                            <asp:DynamicField DataField="SlipID" />
                            <asp:DynamicField DataField="DockID" />
                            <asp:DynamicField DataField="Length" />
                            <asp:DynamicField DataField="Width" />
                        </Columns>
                    </asp:GridView>
                    <div style="margin-top:20px; margin-bottom:20px">
                        <asp:Button ID="AddButton" CssClass="btn btn-primary btn-sm" runat  ="server" Text="Add Slip" OnClick="AddButton_Click" />
                    </div>
    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger" ShowModelStateErrors="true" runat="server" />
                        <asp:FormView ID="SlipFormUpdate" runat="server" 
                            ItemType="PopeyeMarinaWebApp.Models.Slip" 
                            DataKeyNames="SlipID" 
                            RenderOuterTable="false"
                            DefaultMode="ReadOnly"
                            SelectMethod="SlipFormUpdate_GetItem"
                            UpdateMethod="SlipFormUpdate_UpdateItem" 
                            DeleteMethod="SlipFormUpdate_DeleteItem"                 
                            OnItemUpdated="SlipFormUpdate_ItemUpdated" 
                            OnItemDeleted="SlipFormUpdate_ItemDeleted" >
                            <ItemTemplate>
                                <div class="form-horizontal">
                                    <fieldset>
                                        <legend>View Slip</legend>
                                        <div class="form-group">
                                            <label for="slipID" class="col-lg-2 control-label">Slip ID:</label>
                                            <div class="col-lg-10"> 
                                                <asp:Label ID="slipID" runat="server" Text='<%#: Item.SlipID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="dockID" class="col-lg-2 control-label">Dock ID:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="dockID" runat="server" Text='<%#: Item.DockID %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="width" class="col-lg-2 control-label">Width:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="width" runat="server" Text='<%#: Item.Width %>' />
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="length" class="col-lg-2 control-label">Length:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="length" runat="server" Text='<%#: Item.Length %>' />
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
                                        <legend>Edit Slip</legend>
                                        <div class="form-group">
                                            <label for="slipID" class="col-lg-2 control-label">Slip ID:</label>
                                            <div class="col-lg-10">
                                                <asp:Label ID="slipID" runat="server" Text='<%#: Item.SlipID %>' />
                                            </div>
                                        </div>
                                        <InsertItemTemplate>
                                        <fieldset>
                                            <div class="form-group">
                                                 <label for="docks" class="col-lg-2 control-label">Dock ID:</label>
                                                 <div class="col-lg-10">
                                                     <asp:DropDownList ID="docks" runat="server" 
                                                         SelectMethod="EditDocks" 
                                                         DataTextField="DockID" 
                                                         DataValueField="DockID"
                                                         AppendDataBoundItems="true">
                                                         <asp:ListItem Text="Select One" Value="" />
                                                     </asp:DropDownList>
                                                 </div>
                                             </div>
                                        </fieldset>
                                    </InsertItemTemplate>
                                        <div class="form-group">
                                            <label for="width" class="col-lg-2 control-label">Width:</label>
                                            <div class="col-lg-10">
                                                <asp:TextBox ID="width" runat="server" Text="<%#: BindItem.Width %>" ValidationGroup="Edit"></asp:TextBox>
                                            </div>
                                        </div>
                                        <div class="form-group">
                                            <label for="length" class="col-lg-2 control-label">Length:</label>
                                         <div class="col-lg-10">
                                            <asp:TextBox ID="length" runat="server" Text="<%#: BindItem.Length %>" ValidationGroup="Edit" TextMode="MultiLine"></asp:TextBox>
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

