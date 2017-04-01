<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AddDock.aspx.cs" Inherits="PopeyeMarinaWebApp.Admin.AddDock" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <h3>Docks</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger" ShowModelStateErrors="true" ShowSummary="true" runat="server" />
            <asp:FormView ID="DockFormAdd" runat="server"
                        ItemType="PopeyeMarinaWebApp.Models.Dock"
                        DataKeyNames="DockID" 
                        RenderOuterTable="false" 
                        DefaultMode="Insert"
                        SelectMethod="DockFormAdd_GetItem"
                        InsertMethod="DockFormAdd_InsertItem" 
                        OnItemInserted="DockFormAdd_ItemInserted">
                        <InsertItemTemplate>
                            <div class="form-horizontal">
                                <fieldset>
                                    <legend>Add Dock</legend>
                                    <div class="form-group">
                                        <label for="location" class="col-lg-2 control-label">Location:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="location" runat="server" Text="<%#: BindItem.Location %>" ValidationGroup="Insert"></asp:TextBox>                      
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="electricity" class="col-lg-2 control-label">Electricity:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="electricity" runat="server" Text="<%#: BindItem.Electricity %>" ValidationGroup="Insert"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="water" class="col-lg-2 control-label">Water:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="water" runat="server" Text="<%#: BindItem.Water %>" ValidationGroup="Insert"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-lg-12">
                                        <asp:Button ID="InsertButton" runat="server" Text="Insert" CausesValidation="True" CssClass="btn btn-primary btn-sm" CommandName="Insert" />
                                        <asp:Button ID="CancelButton" runat="server" Text="Cancel" CssClass="btn btn-primary btn-sm" CommandName="Cancel" OnClick="CancelButton_Click" /> 
                                    </div>
                                </fieldset>
                            </div>
                        </InsertItemTemplate>
                        </asp:FormView>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
