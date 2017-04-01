<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeBehind="AddSlip.aspx.cs" Inherits="PopeyeMarinaWebApp.Admin.AddSlip" %>
<asp:Content ID="Content1" ContentPlaceHolderID="SubContent" runat="server">
    <h3>Slips</h3>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <asp:ValidationSummary ID="ValidationSummary" CssClass="alert-danger" ShowModelStateErrors="true" ShowSummary="true" runat="server" />
            <asp:FormView ID="SlipFormAdd" runat="server"
                        ItemType="PopeyeMarinaWebApp.Models.Slip"
                        DataKeyNames="SlipID" 
                        RenderOuterTable="false" 
                        DefaultMode="Insert"
                        SelectMethod="SlipFormAdd_GetItem"
                        InsertMethod="SlipFormAdd_InsertItem" 
                        OnItemInserted="SlipFormAdd_ItemInserted">
                        <InsertItemTemplate>
                            <div class="form-horizontal">
                                <fieldset>
                                    <legend>Add Slip</legend>
                                        <InsertItemTemplate>
                                        <fieldset>
                                            <div class="form-group">
                                                 <label for="docks" class="col-lg-2 control-label">Dock ID:</label>
                                                 <div class="col-lg-10">
                                                     <asp:DropDownList ID="docks" runat="server" 
                                                         SelectMethod="GetDocks" 
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
                                            <asp:TextBox ID="width" runat="server" Text="<%#: BindItem.Width %>" ValidationGroup="Insert"></asp:TextBox>                      
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label for="length" class="col-lg-2 control-label">Length:</label>
                                        <div class="col-lg-10">
                                            <asp:TextBox ID="length" runat="server" Text="<%#: BindItem.Length %>" ValidationGroup="Insert"></asp:TextBox>
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
