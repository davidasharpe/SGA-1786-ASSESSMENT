<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AddBoat.aspx.cs" Inherits="PopeyeMarinaWebApp.Admin.AddBoat" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <h3>Boats</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger" ShowModelStateErrors="true" ShowSummary="true" runat="server" />
            <asp:FormView ID="BoatFormAdd" runat="server"
                        ItemType="PopeyeMarinaWebApp.Models.Boat"
                        DataKeyNames="BoatID" 
                        RenderOuterTable="false" 
                        DefaultMode="Insert"
                        SelectMethod="BoatFormAdd_GetItem"
                        InsertMethod="BoatFormAdd_InsertItem" 
                        OnItemInserted="BoatFormAdd_ItemInserted">
                        <InsertItemTemplate>
                            <div class="form-horizontal">
                                <fieldset>
                                    <legend>Add Boat</legend>
                                        <div class="form-group">
                                        <label for="stateRegoNo" class="col-lg-2 control-label">State Rego No:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="stateRegoNo" runat="server" Text="<%#: BindItem.StateRegoNo %>" ValidationGroup="Insert"></asp:TextBox>                          
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="Manufacturer" class="col-lg-2 control-label">Manufacturer:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="Manufacturer" runat="server" Text="<%#: BindItem.Manufacturer %>" ValidationGroup="Insert"></asp:TextBox>                      
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="model" class="col-lg-2 control-label">Model:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="model" runat="server" Text="<%#: BindItem.Model %>" ValidationGroup="Insert"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="length" class="col-lg-2 control-label">Length:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="length" runat="server" Text="<%#: BindItem.Length %>" ValidationGroup="Insert"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="year" class="col-lg-2 control-label">Year:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="year" runat="server" Text="<%#: BindItem.Year %>" ValidationGroup="Insert"></asp:TextBox>
                                        </div>
                                    </div>
                                    <InsertItemTemplate>
                                        <fieldset>
                                             <div class="form-group">
                                                 <label for="type" class="col-lg-2 control-label">Type:</label>
                                                 <div class="col-lg-10">
                                                     <asp:DynamicControl ID="type" runat="server" DataField="Type" Mode="Insert" ValidationGroup="Insert"/>
                                                 </div>
                                             </div>
                                        </fieldset>
                                    </InsertItemTemplate>
                                    <div class="form-group">
                                        <label for="description" class="col-lg-2 control-label">Description:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="description" runat="server" Text="<%#: BindItem.Description %>" ValidationGroup="Insert" TextMode="MultiLine"></asp:TextBox>
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
